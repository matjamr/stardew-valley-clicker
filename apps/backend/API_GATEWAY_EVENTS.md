# API Gateway - Events Endpoints

## Overview
This document describes the REST API endpoints for scheduled event management in the API Gateway. These endpoints allow clients (Flutter app) to create and monitor scheduled events.

## Base URL
```
http://localhost:8080/api/v1
```

## Authentication
All endpoints require authentication via JWT token in the Authorization header:
```
Authorization: Bearer <access_token>
```

## Endpoints

### 1. Create Event (Trigger Event Execution)

**POST** `/events`

Triggers a new scheduled event (e.g., mining, harvesting). The event will be processed after a delay based on game mechanics.

#### Request Body
```json
{
  "islandId": "string (required)",
  "userId": "string (required)",
  "resourceId": "string (required)",
  "type": "UNKNOWN_TYPE | MINES_TYPE (required)"
}
```

#### Request Example
```json
{
  "islandId": "island-123",
  "userId": "user-456",
  "resourceId": "resource-789",
  "type": "MINES_TYPE"
}
```

#### Response (200 OK)
```json
{
  "id": "550e8400-e29b-41d4-a716-446655440000",
  "completionTimestamp": "2025-10-31T15:05:00Z"
}
```

#### Response Fields
- `id`: Unique identifier of the created event
- `completionTimestamp`: ISO-8601 timestamp when the event will complete

#### Error Responses
- **400 Bad Request**: Invalid input parameters
  ```json
  {
    "code": 400,
    "message": "Invalid event type or missing required fields"
  }
  ```

- **401 Unauthorized**: Missing or invalid authentication token
  ```json
  {
    "code": 401,
    "message": "Authentication required"
  }
  ```

### 2. Read Event Status

**GET** `/events/{id}`

Retrieves the current status and details of a scheduled event.

#### Path Parameters
- `id` (required): Event ID

#### Request Example
```
GET /api/v1/events/550e8400-e29b-41d4-a716-446655440000
```

#### Response (200 OK)
```json
{
  "event": {
    "id": "550e8400-e29b-41d4-a716-446655440000",
    "createdDate": "2025-10-31T15:00:00Z",
    "executionDate": "2025-10-31T15:03:00Z",
    "islandId": "island-123",
    "assetId": "resource-789",
    "status": "COMPLETED",
    "userId": "user-456"
  }
}
```

#### Response Fields
- `event.id`: Unique identifier
- `event.createdDate`: When the event was created (ISO-8601)
- `event.executionDate`: When the event will/did execute (ISO-8601)
- `event.islandId`: Associated island ID
- `event.assetId`: Associated resource/asset ID
- `event.status`: Current status
  - `PENDING`: Event is scheduled but not yet executed
  - `COMPLETED`: Event has been executed successfully
  - `FAILED`: Event execution failed
- `event.userId`: User who created the event

#### Error Responses
- **404 Not Found**: Event not found
  ```json
  {
    "code": 404,
    "message": "Event with ID 550e8400... not found"
  }
  ```

- **401 Unauthorized**: Missing or invalid authentication token

## Event Types

### EventRequestTriggerType Enum
- `UNKNOWN_TYPE`: Default/unknown event type
- `MINES_TYPE`: Mining event (collecting resources from mines)

Additional types can be added as game mechanics expand.

## Event Lifecycle

### 1. Event Creation
```
Client → POST /events → API Gateway → game-service (gRPC)
```
- Event is created with status `PENDING`
- Event is stored in DynamoDB
- Event is published to Kafka `schedule-event` topic
- Client receives event ID and completion timestamp

### 2. Event Processing
```
scheduling-worker → Filter (5 min) → Store in RocksDB → Wait until execution time
→ delayed-notification-sender → Wait 5 seconds → event-change-processing
```
- Events are filtered to only process those within 5 minutes
- Events wait in persistent storage until execution time
- After execution + 5 seconds delay, event is sent for completion

### 3. Event Completion
```
game-service Consumer → Update DB (status = COMPLETED)
outbound Consumer → Send Push Notification
```
- Database is updated with final status
- Push notification sent to user's device
- Client can poll status via GET `/events/{id}`

### 4. Status Check
```
Client → GET /events/{id} → API Gateway → game-service (gRPC) → DynamoDB
```
- Client can check status at any time
- Real-time status reflects current state

## Integration with Flutter App

### Creating an Event (User Taps Mining Node)
```dart
// User taps on a mining resource in the Flutter app
Future<CreateEventResponse> triggerMiningEvent(String islandId, String userId, String resourceId) async {
  final response = await http.post(
    Uri.parse('$baseUrl/api/v1/events'),
    headers: {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'islandId': islandId,
      'userId': userId,
      'resourceId': resourceId,
      'type': 'MINES_TYPE',
    }),
  );

  if (response.statusCode == 200) {
    return CreateEventResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create event');
  }
}
```

### Checking Event Status
```dart
Future<ScheduledEvent> getEventStatus(String eventId) async {
  final response = await http.get(
    Uri.parse('$baseUrl/api/v1/events/$eventId'),
    headers: {
      'Authorization': 'Bearer $accessToken',
    },
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return ScheduledEvent.fromJson(data['event']);
  } else {
    throw Exception('Failed to load event');
  }
}
```

### Receiving Push Notifications
```dart
// Configure FCM/APNs in Flutter to receive notifications
FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  if (message.data['eventId'] != null) {
    // Event completed, refresh UI or show animation
    final eventId = message.data['eventId'];
    // Refresh game state, show reward animation, etc.
  }
});
```

## Complete E2E Example

### Scenario: User mines a resource

1. **User Action**: User taps mining node in Flutter app
   ```
   POST /api/v1/events
   {
     "islandId": "island-123",
     "userId": "user-456",
     "resourceId": "mine-node-789",
     "type": "MINES_TYPE"
   }
   ```

2. **Server Response**: Event created
   ```json
   {
     "id": "event-001",
     "completionTimestamp": "2025-10-31T15:03:00Z"
   }
   ```

3. **Flutter App**: Shows mining animation/timer
   - Display countdown to completion timestamp
   - Show "Mining in progress..." message

4. **Server Processing** (background):
   - T+0:00: Event stored, scheduled for T+3:00
   - T+3:00: Event execution time reached
   - T+3:05: Event completed, DB updated, notification sent

5. **Push Notification**: User receives notification
   ```json
   {
     "aps": {
       "alert": {
         "title": "Mining Complete!",
         "body": "Your resources are ready to collect"
       }
     },
     "eventId": "event-001",
     "islandId": "island-123"
   }
   ```

6. **Flutter App**: Receives notification
   - Shows completion animation
   - Updates resource count
   - Optionally verifies via GET `/events/event-001`

7. **Status Verification** (optional):
   ```
   GET /api/v1/events/event-001
   ```
   Response:
   ```json
   {
     "event": {
       "id": "event-001",
       "status": "COMPLETED",
       ...
     }
   }
   ```

## Timing Considerations

### Default Event Duration
- Defined in `BuildScheduledEventConsumer.java`
- Current value: 5 seconds (`DEFAULT_DURATION_SECONDS`)
- Can be adjusted per event type

### Processing Delay
- Additional 5-second delay after execution for processing
- Ensures game state settles before notification
- Total time: execution time + 5 seconds

### Example Timeline
```
T=0:00 - User triggers mining event
T=0:00 - Event created with executionDate = T+0:05
T=0:05 - Mining completes (execution time)
T=0:10 - Notification sent (execution + 5s processing)
```

## Error Handling

### Client-Side Retries
Recommended retry strategy for transient failures:
```dart
Future<CreateEventResponse> createEventWithRetry(CreateEventRequest request) async {
  int retries = 3;
  for (int i = 0; i < retries; i++) {
    try {
      return await createEvent(request);
    } catch (e) {
      if (i == retries - 1) rethrow;
      await Future.delayed(Duration(seconds: 1 << i)); // Exponential backoff
    }
  }
}
```

### Server-Side Error Recovery
- Kafka retries: Automatic for transient failures
- DynamoDB retries: Built into AWS SDK
- Event timeout: Events are not retried if execution time passes

## Monitoring & Debugging

### Check Event Status
Use the GET endpoint to check if an event is progressing:
```bash
curl -H "Authorization: Bearer $TOKEN" \
  http://localhost:8080/api/v1/events/event-001
```

### Expected Status Transitions
```
PENDING (initial) → COMPLETED (success) or FAILED (error)
```

### Logs to Check
- **API Gateway**: Request/response logging
- **game-service**: Event creation, DB updates
- **scheduling-worker**: Event filtering, scheduling
- **outbound**: Notification sending

## Security Considerations

1. **Authentication**: All endpoints require valid JWT
2. **Authorization**: Users can only access their own events
3. **Rate Limiting**: Recommended to prevent abuse
4. **Input Validation**: All inputs validated before processing

## Dependencies

### Libraries Used
- `external-api`: 0.0.5 (OpenAPI models)
- `game-service-api`: 0.1.7 (gRPC client)
- MapStruct: 1.6.3 (DTO mapping)
- Spring Boot: 3.2.4

### Services Required
- API Gateway (port 8080)
- game-service (gRPC)
- scheduling-worker (Kafka consumer)
- outbound (push notifications)
- Kafka (message broker)
- DynamoDB (event storage)

## Building and Deploying

### Build external-api
```bash
cd apps/external-api
mvn clean install
```

### Build game-service-api
```bash
cd apps/internal-api/game-service-api
mvn clean install
```

### Build and Run API Gateway
```bash
cd apps/backend/api-gateway
mvn clean install
mvn spring-boot:run
```

### Test Endpoints
```bash
# Create event
curl -X POST http://localhost:8080/api/v1/events \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TOKEN" \
  -d '{
    "islandId": "island-123",
    "userId": "user-456",
    "resourceId": "resource-789",
    "type": "MINES_TYPE"
  }'

# Get event status
curl http://localhost:8080/api/v1/events/event-001 \
  -H "Authorization: Bearer $TOKEN"
```

## Future Enhancements

1. **WebSocket Support**: Real-time event updates without polling
2. **Batch Operations**: Create multiple events in one request
3. **Event Cancellation**: Allow users to cancel pending events
4. **Event History**: List all events for a user/island
5. **Event Types**: Add more event types (farming, fishing, crafting)
6. **Priority Levels**: VIP users get faster processing
7. **Event Chaining**: One event triggers another automatically
