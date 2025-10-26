package com.mat.jamr.gameservice.service.event.create;

import com.mat.jamr.gameservice.context.TriggerEventContext;
import com.mat.jamr.gameservice.service.common.mapper.ScheduledEventMapper;
import com.mat.jamr.gameservice.service.event.common.notification.EventNotificationProducer;
import com.mat.jamr.gameservice.service.event.create.consumers.BuildScheduledEventConsumer;
import com.mat.jamr.gameservice.service.event.create.consumers.MapTriggerEventResponseConsumer;
import com.mat.jamr.gameservice.service.event.create.consumers.PersistScheduledEventConsumer;
import com.mat.jamr.gameservice.service.event.create.consumers.ValidateTriggerEventConsumer;
import com.matjamr.commonutils.StrategyBasedConsumer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.kafka.core.KafkaTemplate;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

import java.util.List;
import java.util.function.Consumer;
import java.util.function.Function;

@Configuration
public class CreateEventBeanConfig {

    @Bean
    public Function<TriggerEventContext, com.mat.jamr.gameservice.scheduler.api.TriggerEventResponse> createEventStrategyBasedFlow(
            final Consumer<TriggerEventContext> validateTriggerEventConsumer,
            final Consumer<TriggerEventContext> buildScheduledEventConsumer,
            final Consumer<TriggerEventContext> persistScheduledEventConsumer,
            final Consumer<TriggerEventContext> mapTriggerEventResponseConsumer,
            final Consumer<TriggerEventContext> eventNotificationProducerInCreateEvent
    ) {
        return new StrategyBasedConsumer<>(List.of(
                validateTriggerEventConsumer,
                buildScheduledEventConsumer,
                persistScheduledEventConsumer,
                eventNotificationProducerInCreateEvent,
                mapTriggerEventResponseConsumer
        ), TriggerEventContext::getResponse);
    }

    @Bean
    public Consumer<TriggerEventContext> validateTriggerEventConsumer() {
        return new ValidateTriggerEventConsumer();
    }

    @Bean
    public Consumer<TriggerEventContext> buildScheduledEventConsumer() {
        return new BuildScheduledEventConsumer();
    }

    @Bean
    public Consumer<TriggerEventContext> persistScheduledEventConsumer(
            final DynamoDbTable<com.mat.jamr.gameservice.api.db.ScheduledEvent> eventsTable
    ) {
        return new PersistScheduledEventConsumer(eventsTable);
    }

    @Bean
    public Consumer<TriggerEventContext> mapTriggerEventResponseConsumer(
            final ScheduledEventMapper scheduledEventMapper
    ) {
        return new MapTriggerEventResponseConsumer(scheduledEventMapper);
    }

    @Bean
    public Consumer<TriggerEventContext> eventNotificationProducerInCreateEvent(
            final KafkaTemplate<String, String> kafkaTemplate
            ) {
        return new EventNotificationProducer<>(kafkaTemplate);
    }
}
