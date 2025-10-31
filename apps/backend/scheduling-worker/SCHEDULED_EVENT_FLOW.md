# Scheduled Event Processing Flow

## Overview
The scheduling-worker consumes scheduled events from the `schedule-event` Kafka topic and filters them based on their execution time. Only events scheduled to execute within the next 5 minutes are accepted. These events are then stored in a Kafka Streams state store (persistent RocksDB backed by Kafka changelog topic) and sent to the `delayed-notification-sender` topic at their exact execution time, ensuring users receive timely and accurate notifications.

## Architecture

### Flow Diagram
```
game-service                scheduling-worker
    |                              |
    | EventNotificationProducer    |
    |----> schedule-event -------> | ScheduledEventStreamConfig
    |      (Kafka Topic)            |   |
                                    |   | Filter: executionDate <= now + 5 min
                                    |   |
                                    |   v
                                    | ScheduledEventFilterProcessor
                                    |   |
                                    |   v
                                    | DelayedEventProcessor
                                    |   |
                                    |   | Store in State Store
                                    |   v
                                    | RocksDB State Store
                                    | (Backed by Kafka Changelog)
                                    |   |
                                    |   | Punctuator checks every 1s
                                    |   | for executionDate <= now
                                    |   |
                                    |   v
                                    | delayed-notification-sender
                                    |   (Kafka Topic)
```

### Components

#### 1. EventNotificationProducer (game-service)
- **Location**: `apps/backend/game-service/src/main/java/com/mat/jamr/gameservice/service/event/common/notification/EventNotificationProducer.java`
- **Purpose**: Publishes ScheduledEvent objects as JSON to the `schedule-event` Kafka topic
- **Key Changes**: Updated to serialize events to JSON using ObjectMapper instead of toString()

#### 2. ScheduledEventDto (scheduling-worker)
- **Location**: `apps/backend/scheduling-worker/src/main/java/com/mat/jamr/schedulingworker/dto/ScheduledEventDto.java`
- **Purpose**: Data Transfer Object for deserializing scheduled events in the worker
- **Fields**:
  - `id`: Event identifier
  - `createdDate`: ISO-8601 timestamp when event was created
  - `executionDate`: ISO-8601 timestamp when event should execute
  - `islandId`: Associated island identifier
  - `assetId`: Associated asset identifier
  - `status`: Event status (e.g., "PENDING")
  - `userId`: Associated user identifier

#### 3. ScheduledEventFilterProcessor (scheduling-worker)
- **Location**: `apps/backend/scheduling-worker/src/main/java/com/mat/jamr/schedulingworker/processor/ScheduledEventFilterProcessor.java`
- **Purpose**: Business logic for filtering events based on execution time
- **Algorithm**:
  1. Parse JSON message to ScheduledEventDto
  2. Parse executionDate to Instant
  3. Calculate duration between now and executionDate
  4. Return true if 0 < duration <= 5 minutes
  5. Return false otherwise (including past events and events > 5 minutes away)

#### 4. ScheduledEventStreamConfig (scheduling-worker)
- **Location**: `apps/backend/scheduling-worker/src/main/java/com/mat/jamr/schedulingworker/config/ScheduledEventStreamConfig.java`
- **Purpose**: Kafka Streams topology configuration
- **Behavior**:
  - Creates a persistent state store using RocksDB
  - Consumes from `schedule-event` topic
  - Applies filter using ScheduledEventFilterProcessor
  - Routes filtered events to DelayedEventProcessor
  - Connects processor output to `delayed-notification-sender` topic

#### 5. DelayedEventProcessor (scheduling-worker)
- **Location**: `apps/backend/scheduling-worker/src/main/java/com/mat/jamr/schedulingworker/processor/DelayedEventProcessor.java`
- **Purpose**: Kafka Streams processor that manages delayed delivery of events using a persistent state store
- **Mechanism**:
  - Stores events in a RocksDB-backed Kafka state store
  - Uses a Kafka Streams Punctuator that runs every 1 second
  - Punctuator scans the state store for events where `executionDate <= now`
  - Forwards ready events to the output stream
  - Deletes processed events from the state store
- **Benefits**:
  - **Persistence**: Events survive application restarts via RocksDB and Kafka changelog
  - **Scalability**: Can handle large volumes of events
  - **Fault Tolerance**: State store is backed by Kafka changelog topic for recovery
  - **Precise Timing**: Users receive notifications exactly when scheduled (±1 second accuracy)
  - **Distributed Ready**: Can be scaled horizontally with Kafka Streams partitioning

## Configuration

### Kafka Topics
- **schedule-event**: Input topic for all scheduled events
- **delayed-notification-sender**: Output topic for events ready to be processed

### Application Properties
```yaml
spring:
  application:
    name: scheduling-worker
  kafka:
    bootstrap-servers: localhost:9092
```

### Kafka Streams Properties
- **Application ID**: `scheduled-event-distribution`
- **Key Serde**: String
- **Value Serde**: String

## Time Filtering Logic

The filter implements the following logic:

```java
Duration timeUntilExecution = Duration.between(now, executionDate);
boolean shouldProcess = !timeUntilExecution.isNegative()
                     && timeUntilExecution.compareTo(Duration.ofMinutes(5)) <= 0;
```

This means:
- Events in the past are **filtered out** (not processed)
- Events 0-5 minutes in the future are **accepted and scheduled for delayed delivery**
- Events more than 5 minutes in the future are **filtered out**

## Delayed Delivery Mechanism

Once an event passes the 5-minute filter, it is stored in a Kafka Streams state store:

1. **Storage**: Events are persisted in RocksDB (local disk)
2. **Changelog Backup**: State changes are backed up to a Kafka changelog topic
3. **Polling**: Kafka Streams Punctuator checks for ready events every 1 second
4. **Delivery**: When an event's execution time is reached, it's forwarded to the output stream
5. **Cleanup**: Processed events are deleted from the state store
6. **Precision**: Users receive notifications at the exact scheduled time (±1 second accuracy)

### Example Timeline

```
T=0:00  - Event created with executionDate = T+3:00
T=0:00  - Event published to schedule-event topic
T=0:00  - Scheduling-worker filters event (3 min < 5 min ✓)
T=0:00  - Event stored in RocksDB state store
T=0:00  - State change logged to Kafka changelog topic
T+3:00  - Punctuator finds event (executionDate <= now)
T+3:00  - Event forwarded to output stream
T+3:00  - Event sent to delayed-notification-sender topic
T+3:00  - Event deleted from state store
T+3:00  - User receives notification
```

## Example Event

### Input (schedule-event topic)
```json
{
  "id": "550e8400-e29b-41d4-a716-446655440000",
  "createdDate": "2025-10-31T10:00:00Z",
  "executionDate": "2025-10-31T10:03:00Z",
  "islandId": "island-123",
  "assetId": "asset-456",
  "status": "PENDING",
  "userId": "user-789"
}
```

### Processing Decision
If current time is `2025-10-31T10:00:00Z`:
- Time until execution: 3 minutes
- **Result**: Event is accepted and stored in state store
- **Delivery**: Event will be sent to `delayed-notification-sender` at `2025-10-31T10:03:00Z`

If current time is `2025-10-31T09:50:00Z`:
- Time until execution: 13 minutes
- **Result**: Event is filtered out (too far in the future)

## Logging

The system provides detailed logging at multiple stages:

### Filter Stage (ScheduledEventFilterProcessor)
- **INFO**: Events that pass the filter
- **DEBUG**: Events that don't pass the filter
- **WARN**: Events with missing execution dates
- **ERROR**: JSON parsing failures

### Processor Stage (DelayedEventProcessor)
- **INFO**: When processor initializes, when events are stored, and when they are sent
- **DEBUG**: Number of events processed in each punctuation cycle
- **ERROR**: Failures during event processing or sending

Example log output:
```
INFO  - DelayedEventProcessor initialized with state store: delayed-events-store
INFO  - Event 550e8400-e29b-41d4-a716-446655440000 scheduled for 2025-10-31T10:03:00Z is within 5 minutes threshold, forwarding for processing
INFO  - Stored event 550e8400-e29b-41d4-a716-446655440000 in state store for execution in 180 seconds at 2025-10-31T10:03:00Z
INFO  - Sent event 550e8400-e29b-41d4-a716-446655440000 to delayed-notification-sender topic at execution time 2025-10-31T10:03:00Z
DEBUG - Processed and sent 1 ready events
DEBUG - Event 550e8400-e29b-41d4-a716-446655440001 scheduled for 2025-10-31T10:20:00Z is not within threshold (PT17M), skipping
```

## Dependencies

### New Dependencies Added to pom.xml
```xml
<!-- Jackson for JSON processing -->
<dependency>
    <groupId>com.fasterxml.jackson.core</groupId>
    <artifactId>jackson-databind</artifactId>
</dependency>
<dependency>
    <groupId>com.fasterxml.jackson.datatype</groupId>
    <artifactId>jackson-datatype-jsr310</artifactId>
</dependency>
```

## Testing

To test the flow:

1. **Start Kafka**:
   ```bash
   # Ensure Kafka is running on localhost:9092
   ```

2. **Start the scheduling-worker**:
   ```bash
   cd apps/backend/scheduling-worker
   mvn spring-boot:run
   ```

3. **Publish a test event** (from game-service or manually):
   ```bash
   # Create an event with executionDate 2 minutes from now
   # The worker should pick it up and forward it
   ```

4. **Monitor logs**:
   - Watch for filter decisions in scheduling-worker logs
   - Check delayed-notification-sender topic for forwarded events

## Important Considerations

### Kafka Streams State Store
The DelayedEventProcessor uses a persistent Kafka Streams state store (RocksDB):

**Advantages:**
- **Persistent**: Events survive application restarts
- **Fault Tolerant**: State backed by Kafka changelog topic
- **Scalable**: Can handle millions of events
- **Distributed**: Supports horizontal scaling via partitioning
- **No External Dependencies**: Uses built-in Kafka Streams capabilities

**How it Works:**
1. **Local Storage**: RocksDB stores events on local disk
2. **Changelog**: All state changes are written to a Kafka changelog topic
3. **Recovery**: On restart, state is restored from local RocksDB if available, otherwise from changelog
4. **Partitioning**: State is partitioned by event ID, enabling parallel processing

**Configuration:**
- State store location: `${kafka.streams.state.dir}/scheduled-event-distribution/`
- Changelog topic: `scheduled-event-distribution-delayed-events-store-changelog`

### Performance Characteristics
- **Throughput**: Can handle thousands of events per second
- **Latency**: ±1 second delivery accuracy
- **Storage**: RocksDB efficiently stores events on disk
- **Memory Usage**: Minimal heap usage, primarily disk-based
- **Polling Overhead**: Minimal (punctuator runs every 1 second)

## Future Enhancements

Possible improvements:
1. **Configurable Threshold**: Make the 5-minute threshold configurable via application.yml
2. **Metrics/Monitoring**: Add Prometheus metrics for:
   - State store size (number of pending events)
   - Event throughput (events/second)
   - Filter rates (accepted vs rejected)
   - Delivery latency (actual vs scheduled time)
   - Punctuator execution time
3. **Error Handling**:
   - Implement retry logic for failed JSON parsing
   - Add dead letter queue for malformed events
   - Add circuit breaker for Kafka failures
   - Handle events that fail to send after multiple retries
4. **Dynamic Scheduling**: Allow different delay thresholds per event type
5. **Optimization**:
   - Implement indexed access to state store by execution time
   - Use range queries instead of full scans in punctuator
   - Adjust punctuation interval based on load
6. **Multi-Instance Coordination**: Proper Kafka Streams partitioning strategy for load balancing
