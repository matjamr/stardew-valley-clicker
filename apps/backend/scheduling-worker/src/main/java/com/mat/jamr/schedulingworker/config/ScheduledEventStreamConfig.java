package com.mat.jamr.schedulingworker.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mat.jamr.schedulingworker.processor.DelayedEventProcessor;
import com.mat.jamr.schedulingworker.processor.ScheduledEventFilterProcessor;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.common.serialization.Serdes;
import org.apache.kafka.streams.StreamsBuilder;
import org.apache.kafka.streams.kstream.Consumed;
import org.apache.kafka.streams.kstream.KStream;
import org.apache.kafka.streams.kstream.Produced;
import org.apache.kafka.streams.state.KeyValueStore;
import org.apache.kafka.streams.state.StoreBuilder;
import org.apache.kafka.streams.state.Stores;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Slf4j
@Configuration
@RequiredArgsConstructor
public class ScheduledEventStreamConfig {

    private static final String SCHEDULE_EVENT_TOPIC = "schedule-event";
    private static final String DELAYED_NOTIFICATION_SENDER_TOPIC = "delayed-notification-sender";

    private final ScheduledEventFilterProcessor filterProcessor;
    private final ObjectMapper objectMapper;

    @Bean
    public KStream<String, String> scheduleEventStream(StreamsBuilder streamsBuilder) {
        // Create a persistent key-value store for delayed events
        StoreBuilder<KeyValueStore<String, String>> storeBuilder = Stores
                .keyValueStoreBuilder(
                        Stores.persistentKeyValueStore(DelayedEventProcessor.DELAYED_EVENTS_STORE),
                        Serdes.String(),
                        Serdes.String()
                );

        streamsBuilder.addStateStore(storeBuilder);

        // Create the stream from schedule-event topic
        KStream<String, String> stream = streamsBuilder.stream(
                SCHEDULE_EVENT_TOPIC,
                Consumed.with(Serdes.String(), Serdes.String())
        );

        // Filter events that are within 5 minutes
        KStream<String, String> filteredStream = stream
                .filter((key, value) -> {
                    boolean shouldProcess = filterProcessor.shouldProcess(value);
                    if (!shouldProcess) {
                        log.trace("Event filtered out: {}", value);
                    }
                    return shouldProcess;
                });

        // Process filtered events with DelayedEventProcessor
        // This processor stores events in the state store and uses a punctuator
        // to periodically check and send ready events
        KStream<String, String> readyEvents = filteredStream
                .process(() -> new DelayedEventProcessor(objectMapper),
                        DelayedEventProcessor.DELAYED_EVENTS_STORE);

        // Send ready events to the delayed-notification-sender topic
        readyEvents.to(DELAYED_NOTIFICATION_SENDER_TOPIC,
                Produced.with(Serdes.String(), Serdes.String()));

        log.info("Kafka Streams topology configured: {} -> filter -> state store -> {}",
                SCHEDULE_EVENT_TOPIC, DELAYED_NOTIFICATION_SENDER_TOPIC);

        return stream;
    }
}

