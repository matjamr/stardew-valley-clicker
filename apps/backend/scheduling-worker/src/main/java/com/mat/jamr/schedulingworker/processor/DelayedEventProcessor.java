package com.mat.jamr.schedulingworker.processor;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mat.jamr.schedulingworker.dto.ScheduledEventDto;
import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.streams.KeyValue;
import org.apache.kafka.streams.processor.PunctuationType;
import org.apache.kafka.streams.processor.api.Processor;
import org.apache.kafka.streams.processor.api.ProcessorContext;
import org.apache.kafka.streams.processor.api.Record;
import org.apache.kafka.streams.state.KeyValueIterator;
import org.apache.kafka.streams.state.KeyValueStore;

import java.time.Duration;
import java.time.Instant;

@Slf4j
public class DelayedEventProcessor implements Processor<String, String, String, String> {

    public static final String DELAYED_EVENTS_STORE = "delayed-events-store";
    private static final String DELAYED_NOTIFICATION_SENDER_TOPIC = "delayed-notification-sender";

    private ProcessorContext<String, String> context;
    private KeyValueStore<String, String> delayedEventsStore;
    private final ObjectMapper objectMapper;

    public DelayedEventProcessor(ObjectMapper objectMapper) {
        this.objectMapper = objectMapper;
    }

    @Override
    public void init(ProcessorContext<String, String> context) {
        this.context = context;
        this.delayedEventsStore = context.getStateStore(DELAYED_EVENTS_STORE);

        // Schedule a punctuator to check for ready events every 1 second
        context.schedule(
                Duration.ofSeconds(1),
                PunctuationType.WALL_CLOCK_TIME,
                timestamp -> processReadyEvents()
        );

        log.info("DelayedEventProcessor initialized with state store: {}", DELAYED_EVENTS_STORE);
    }

    @Override
    public void process(Record<String, String> record) {
        try {
            String eventJson = record.value();
            ScheduledEventDto event = objectMapper.readValue(eventJson, ScheduledEventDto.class);

            // Store the event using its ID as the key
            // The value contains both the event JSON and execution timestamp
            delayedEventsStore.put(event.getId(), eventJson);

            long delaySeconds = Instant.parse(event.getExecutionDate()).getEpochSecond()
                    - Instant.now().getEpochSecond();

            log.info("Stored event {} in state store for execution in {} seconds at {}",
                    event.getId(), delaySeconds, event.getExecutionDate());
        } catch (Exception e) {
            log.error("Failed to process and store event: {}", record.value(), e);
        }
    }

    /**
     * Called every second to check for events that are ready to be sent
     */
    private void processReadyEvents() {
        Instant now = Instant.now();
        int processedCount = 0;

        try (KeyValueIterator<String, String> iterator = delayedEventsStore.all()) {
            while (iterator.hasNext()) {
                KeyValue<String, String> entry = iterator.next();
                String eventId = entry.key;
                String eventJson = entry.value;

                try {
                    ScheduledEventDto event = objectMapper.readValue(eventJson, ScheduledEventDto.class);
                    Instant executionTime = Instant.parse(event.getExecutionDate());

                    // Check if the event is ready to be sent
                    if (!now.isBefore(executionTime)) {
                        // Send the event to the output topic
                        context.forward(new Record<>(eventId, eventJson, now.toEpochMilli()));

                        // Remove from state store
                        delayedEventsStore.delete(eventId);

                        log.info("Sent event {} to {} topic at execution time {}",
                                eventId, DELAYED_NOTIFICATION_SENDER_TOPIC, event.getExecutionDate());

                        processedCount++;
                    }
                } catch (Exception e) {
                    log.error("Failed to process event {} from state store", eventId, e);
                }
            }
        } catch (Exception e) {
            log.error("Error during ready events processing", e);
        }

        if (processedCount > 0) {
            log.debug("Processed and sent {} ready events", processedCount);
        }
    }

    @Override
    public void close() {
        // Cleanup if needed
        log.info("DelayedEventProcessor closed");
    }
}
