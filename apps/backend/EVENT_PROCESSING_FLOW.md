# Complete Event Processing Flow

## Overview
This document describes the complete end-to-end flow of scheduled event processing, from creation to notification delivery. The system ensures events are executed at precise times and users receive timely push notifications.

## Architecture

### Complete Flow Diagram
```
game-service              scheduling-worker              game-service              outbound
    |                            |                            |                         |
    | 1. Create Event            |                            |                         |
    |----> schedule-event -----> |                            |                         |
    |      (Kafka Topic)          |                            |                         |
                                  |                            |                         |
                                  | 2. Filter (5 min)          |                         |
                                  | 3. Store in RocksDB        |                         |
                                  |                            |                         |
                                  | 4. Wait for execution time |                         |
                                  |                            |                         |
                                  |----> delayed-notification-sender                     |
                                  |      (Kafka Topic)         |                         |
                                  |                            |                         |
                                  | 5. Wait DEFAULT_DURATION   |                         |
                                  |    (5 seconds)             |                         |
                                  |                            |                         |
                                  |----> event-change-processing                         |
                                  |      (Kafka Topic)         |                         |
                                                               |                         |
                                                               | 6. Update DB            |
                                                               | (status=COMPLETED)      |
                                                                                         |
                                                                                         | 7. Send Push
                                                                                         | Notification
```

## Flow Stages

### Stage 1: Event Creation (game-service)
**Component**: `BuildScheduledEventConsumer.java`

- Event is created with execution time
- Default duration: 5 seconds (`DEFAULT_DURATION_SECONDS`)
- Event is persisted to DynamoDB with status "PENDING"
- Event is published to `schedule-event` topic as JSON

**Files Involved**:
- `apps/backend/game-service/src/main/java/com/mat/jamr/gameservice/service/event/create/consumers/BuildScheduledEventConsumer.java`
- `apps/backend/game-service/src/main/java/com/mat/jamr/gameservice/service/event/common/notification/EventNotificationProducer.java`

### Stage 2: Event Filtering (scheduling-worker)
**Component**: `ScheduledEventFilterProcessor.java`

- Consumes from `schedule-event` topic
- Filters events based on execution time
- Only accepts events within 5 minutes of execution
- Events > 5 minutes away are ignored
- Past events are ignored

**Files Involved**:
- `apps/backend/scheduling-worker/src/main/java/com/mat/jamr/schedulingworker/processor/ScheduledEventFilterProcessor.java`

### Stage 3: Delayed Storage (scheduling-worker)
**Component**: `DelayedEventProcessor.java`

- Accepted events are stored in RocksDB state store
- State is backed by Kafka changelog topic
- Punctuator checks every 1 second for ready events
- When `executionDate <= now`, event is forwarded

**Files Involved**:
- `apps/backend/scheduling-worker/src/main/java/com/mat/jamr/schedulingworker/processor/DelayedEventProcessor.java`
- `apps/backend/scheduling-worker/src/main/java/com/mat/jamr/schedulingworker/config/ScheduledEventStreamConfig.java`

**State Store**:
- Name: `delayed-events-store`
- Type: Persistent RocksDB
- Changelog: `scheduled-event-distribution-delayed-events-store-changelog`

### Stage 4: Execution Time Reached (scheduling-worker)
**Component**: `DelayedEventProcessor.java`

- Event is forwarded to `delayed-notification-sender` topic
- Event is removed from state store

### Stage 5: Processing Delay (scheduling-worker)
**Component**: `DelayedNotificationConsumer.java`

- Consumes from `delayed-notification-sender` topic
- Waits for `DEFAULT_DURATION_SECONDS` (5 seconds) after execution time
- Calculates: `processingTime = executionTime + 5 seconds`
- Publishes to `event-change-processing` topic

**Files Involved**:
- `apps/backend/scheduling-worker/src/main/java/com/mat/jamr/schedulingworker/consumer/DelayedNotificationConsumer.java`

**Why the delay?**
This 5-second delay ensures the event processing (like resource collection) completes before notifications are sent.

### Stage 6: Database Update (game-service)
**Component**: `EventChangeProcessingConsumer.java`

- Consumes from `event-change-processing` topic
- Loads event from DynamoDB by ID
- Updates event status to "COMPLETED"
- Persists changes back to DynamoDB

**Files Involved**:
- `apps/backend/game-service/src/main/java/com/mat/jamr/gameservice/service/event/processing/EventChangeProcessingConsumer.java`

### Stage 7: Push Notification (outbound)
**Component**: `PushNotificationService.java`

- Consumes from `event-change-processing` topic
- Prepares push notification payload
- Sends notification to Apple Push Notification service (APNs)
- User receives notification on Flutter app

**Files Involved**:
- `apps/backend/outbound/src/main/java/com/mat/jamr/outbound/notification/PushNotificationService.java`

**Push Notification Structure**:
```json
{
  "aps": {
    "alert": {
      "title": "Event Completed",
      "body": "Your scheduled event has been completed!"
    },
    "sound": "default",
    "badge": 1
  },
  "eventId": "550e8400-e29b-41d4-a716-446655440000",
  "islandId": "island-123"
}
```

## Kafka Topics

### 1. schedule-event
- **Producer**: game-service
- **Consumer**: scheduling-worker (Kafka Streams)
- **Purpose**: New scheduled events
- **Partitions**: 1
- **Replication**: 1

### 2. delayed-notification-sender
- **Producer**: scheduling-worker (DelayedEventProcessor)
- **Consumer**: scheduling-worker (DelayedNotificationConsumer)
- **Purpose**: Events ready for execution
- **Partitions**: 1
- **Replication**: 1

### 3. event-change-processing
- **Producer**: scheduling-worker (DelayedNotificationConsumer)
- **Consumers**:
  - game-service (EventChangeProcessingConsumer)
  - outbound (PushNotificationService)
- **Purpose**: Events ready for completion and notification
- **Partitions**: 1
- **Replication**: 1

## Timing Example

Let's say an event is created at T=0 with a 3-minute execution time:

```
T=0:00     - Event created with executionDate = T+3:00
T=0:00     - Event published to schedule-event
T=0:00     - Event passes 5-minute filter (3 min < 5 min ✓)
T=0:00     - Event stored in RocksDB state store
T+3:00     - Punctuator detects executionDate reached
T+3:00     - Event sent to delayed-notification-sender
T+3:00     - DelayedNotificationConsumer receives event
T+3:00-05  - Wait 5 seconds (DEFAULT_DURATION_SECONDS)
T+3:05     - Event sent to event-change-processing
T+3:05     - game-service updates DB status to COMPLETED
T+3:05     - outbound sends push notification to user
T+3:05     - User receives notification on device
```

## Configuration

### scheduling-worker
**application.yml**:
```yaml
spring:
  application:
    name: scheduling-worker
  kafka:
    bootstrap-servers: localhost:9092
```

### game-service
**application.yml**:
```yaml
spring:
  kafka:
    bootstrap-servers: localhost:9092
```

### outbound
**application.yml**:
```yaml
spring:
  kafka:
    bootstrap-servers: localhost:9092
```

## Consumer Groups

| Service | Group ID | Topic |
|---------|----------|-------|
| scheduling-worker | scheduled-event-distribution | schedule-event (Kafka Streams) |
| scheduling-worker | scheduling-worker-group | delayed-notification-sender |
| game-service | game-service-group | event-change-processing |
| outbound | outbound-push-notification-group | event-change-processing |

## Error Handling

### scheduling-worker
- **Invalid JSON**: Logged and skipped
- **Past events**: Logged and sent immediately
- **Thread interruption**: Thread interrupted flag set, error logged

### game-service
- **Event not found**: Warning logged, creates new entry
- **DB update failure**: Exception thrown, consumer will retry

### outbound
- **Push notification failure**: Exception thrown, consumer will retry
- **Invalid payload**: Logged and exception thrown

## Monitoring & Logging

### Key Log Messages

**scheduling-worker**:
```
INFO  - Event {id} scheduled for {executionDate} is within 5 minutes threshold
INFO  - Stored event {id} in state store for execution in {seconds} seconds
INFO  - Sent event {id} to delayed-notification-sender topic
INFO  - Received event {id}, will process after 5 seconds
INFO  - Sent event {id} to event-change-processing topic
```

**game-service**:
```
INFO  - Processing event change for event ID: {id}
INFO  - Successfully updated event {id} status to COMPLETED
```

**outbound**:
```
INFO  - Received event change for push notification: {message}
INFO  - Sending Apple Push Notification for user {userId}
INFO  - Successfully processed push notification for event {id}
```

## Future Enhancements

1. **APNs Integration**: Implement actual Apple Push Notification service integration
2. **Device Token Management**: Store and retrieve user device tokens
3. **Retry Logic**: Implement exponential backoff for failed notifications
4. **Dead Letter Queue**: Handle permanently failed messages
5. **Metrics**: Add Prometheus metrics for:
   - Event processing latency
   - Notification delivery success rate
   - Consumer lag
   - Error rates
6. **Batch Processing**: Process multiple notifications in batches
7. **Priority Queues**: Support different priority levels for events
8. **Multi-Platform Support**: Add Android (FCM) push notification support

## Testing

### Manual Testing

1. **Start all services**:
```bash
# Terminal 1 - Kafka
docker-compose up kafka

# Terminal 2 - scheduling-worker
cd apps/backend/scheduling-worker
mvn spring-boot:run

# Terminal 3 - game-service
cd apps/backend/game-service
mvn spring-boot:run

# Terminal 4 - outbound
cd apps/backend/outbound
mvn spring-boot:run
```

2. **Create a test event** via game-service gRPC endpoint

3. **Monitor logs** in all services for the complete flow

4. **Verify**:
   - Event appears in schedule-event topic
   - Event is filtered and stored
   - Event reaches delayed-notification-sender at execution time
   - Event sent to event-change-processing after 5 seconds
   - DB status updated to COMPLETED
   - Push notification logged

## Dependencies

### scheduling-worker
- Spring Kafka
- Kafka Streams
- Jackson (JSON processing)
- RocksDB (via Kafka Streams)

### game-service
- Spring Kafka
- DynamoDB Enhanced Client
- Jackson

### outbound
- Spring Kafka
- Jackson

## Architecture Decisions

### Why Kafka Streams for Delay?
- **Persistent**: State survives restarts
- **Scalable**: Can handle millions of events
- **Fault-tolerant**: Automatic recovery from failures
- **No external dependencies**: Uses built-in Kafka

### Why Separate Consumers?
- **Separation of Concerns**: Each service handles its domain
- **Scalability**: Services can scale independently
- **Reliability**: Failure in one doesn't affect others
- **Flexibility**: Easy to add new consumers for same events

### Why 5-Second Processing Delay?
- Ensures event processing (resource collection, etc.) completes
- Prevents race conditions
- Allows game state to settle before notification
- Configurable via `DEFAULT_DURATION_SECONDS`
