package com.mat.jamr.gameservice.service.event.processing;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mat.jamr.gameservice.api.db.ScheduledEvent;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;
import software.amazon.awssdk.enhanced.dynamodb.Key;

import java.time.Instant;

@Slf4j
@Component
@RequiredArgsConstructor
public class EventChangeProcessingConsumer {

    private final DynamoDbTable<ScheduledEvent> eventsTable;
    private final ObjectMapper objectMapper;

    @KafkaListener(topics = "event-change-processing", groupId = "game-service-group")
    public void consumeEventChange(String message) {
        try {
            // Parse the event from JSON
            ScheduledEvent event = objectMapper.readValue(message, ScheduledEvent.class);

            log.info("Processing event change for event ID: {}", event.getId());

            // Load the current event from database
            Key key = Key.builder()
                    .partitionValue(event.getId())
                    .build();

            ScheduledEvent currentEvent = eventsTable.getItem(key);

            if (currentEvent == null) {
                log.warn("Event {} not found in database, creating new entry", event.getId());
                currentEvent = event;
            }

            // Update the event status to COMPLETED
            currentEvent.setStatus("COMPLETED");

            // Update the event in DynamoDB
            eventsTable.updateItem(currentEvent);

            log.info("Successfully updated event {} status to COMPLETED", event.getId());

        } catch (Exception e) {
            log.error("Failed to process event change: {}", message, e);
            throw new RuntimeException("Event processing failed", e);
        }
    }
}
