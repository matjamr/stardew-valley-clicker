package com.mat.jamr.gameservice.service.event.common.notification;

import com.mat.jamr.gameservice.context.EventAware;
import lombok.RequiredArgsConstructor;
import org.springframework.kafka.core.KafkaTemplate;

import java.util.function.Consumer;

@RequiredArgsConstructor
public class EventNotificationProducer<T extends EventAware> implements Consumer<T> {


    private final KafkaTemplate<String, String> kafkaTemplate;

    @Override
    public void accept(T t) {
        kafkaTemplate.send("events", t.getEvent().toString());
    }

}
