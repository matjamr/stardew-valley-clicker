package com.mat.jamr.gameservice.service.event.common.notification;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mat.jamr.gameservice.context.EventAware;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.core.KafkaTemplate;

import java.util.function.Consumer;

@Slf4j
@RequiredArgsConstructor
public class EventNotificationProducer<T extends EventAware> implements Consumer<T> {

    private final KafkaTemplate<String, String> kafkaTemplate;
    private final ObjectMapper objectMapper;

    @Override
    public void accept(T t) {
        try {
            String eventJson = objectMapper.writeValueAsString(t.getEvent());
            kafkaTemplate.send("schedule-event", eventJson);
            log.debug("Published event to schedule-event topic: {}", eventJson);
        } catch (Exception e) {
            log.error("Failed to serialize and publish event: {}", t.getEvent(), e);
            throw new RuntimeException("Failed to publish event to Kafka", e);
        }
    }

}
