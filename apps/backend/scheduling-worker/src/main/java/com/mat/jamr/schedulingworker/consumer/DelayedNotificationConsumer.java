package com.mat.jamr.schedulingworker.consumer;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mat.jamr.schedulingworker.dto.ScheduledEventDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Component;

import java.time.Duration;
import java.time.Instant;

@Slf4j
@Component
@RequiredArgsConstructor
public class DelayedNotificationConsumer {

    private static final String EVENT_CHANGE_PROCESSING_TOPIC = "event-change-processing";
    private static final long DEFAULT_DURATION_SECONDS = 5;

    private final KafkaTemplate<String, String> kafkaTemplate;
    private final ObjectMapper objectMapper;

    @KafkaListener(topics = "delayed-notification-sender", groupId = "scheduling-worker-group")
    public void consumeDelayedNotification(String message) {
        try {
            ScheduledEventDto event = objectMapper.readValue(message, ScheduledEventDto.class);

            log.info("Received event {} from delayed-notification-sender, will process after {} seconds",
                    event.getId(), DEFAULT_DURATION_SECONDS);

            // Calculate remaining time until execution + processing duration
            Instant executionTime = Instant.parse(event.getExecutionDate());
            Instant processingTime = executionTime.plusSeconds(DEFAULT_DURATION_SECONDS);
            Instant now = Instant.now();

            long delayMillis = Duration.between(now, processingTime).toMillis();

            // If we're past the processing time, send immediately
            if (delayMillis > 0) {
                log.debug("Waiting {} ms before sending event {} to event-change-processing",
                        delayMillis, event.getId());
                Thread.sleep(delayMillis);
            } else {
                log.warn("Event {} is past its processing time by {} ms, sending immediately",
                        event.getId(), -delayMillis);
            }

            // Send to event-change-processing topic
            kafkaTemplate.send(EVENT_CHANGE_PROCESSING_TOPIC, event.getId(), message);

            log.info("Sent event {} to {} topic after processing delay",
                    event.getId(), EVENT_CHANGE_PROCESSING_TOPIC);

        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            log.error("Thread interrupted while waiting for event processing: {}", message, e);
        } catch (Exception e) {
            log.error("Failed to process delayed notification: {}", message, e);
        }
    }
}
