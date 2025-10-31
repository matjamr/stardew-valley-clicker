package com.mat.jamr.schedulingworker.processor;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mat.jamr.schedulingworker.dto.ScheduledEventDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.time.Duration;
import java.time.Instant;

@Slf4j
@Component
@RequiredArgsConstructor
public class ScheduledEventFilterProcessor {

    private static final Duration THRESHOLD_DURATION = Duration.ofMinutes(5);
    private final ObjectMapper objectMapper;

    /**
     * Checks if the scheduled event should be processed based on its execution time.
     * Returns true if the event's execution time is less than 5 minutes from now.
     *
     * @param message The JSON message containing the scheduled event
     * @return true if the event should be processed, false otherwise
     */
    public boolean shouldProcess(String message) {
        try {
            ScheduledEventDto event = objectMapper.readValue(message, ScheduledEventDto.class);

            if (event.getExecutionDate() == null) {
                log.warn("Event {} has no execution date, skipping", event.getId());
                return false;
            }

            Instant executionTime = Instant.parse(event.getExecutionDate());
            Instant now = Instant.now();
            Duration timeUntilExecution = Duration.between(now, executionTime);

            boolean shouldProcess = !timeUntilExecution.isNegative()
                    && timeUntilExecution.compareTo(THRESHOLD_DURATION) <= 0;

            if (shouldProcess) {
                log.info("Event {} scheduled for {} is within 5 minutes threshold, forwarding for processing",
                        event.getId(), event.getExecutionDate());
            } else {
                log.debug("Event {} scheduled for {} is not within threshold ({}), skipping",
                        event.getId(), event.getExecutionDate(), timeUntilExecution);
            }

            return shouldProcess;
        } catch (Exception e) {
            log.error("Failed to parse or process event: {}", message, e);
            return false;
        }
    }
}
