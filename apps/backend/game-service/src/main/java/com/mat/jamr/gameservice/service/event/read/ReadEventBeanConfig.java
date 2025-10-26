package com.mat.jamr.gameservice.service.event.read;

import com.mat.jamr.gameservice.context.ReadEventContext;
import com.mat.jamr.gameservice.service.common.mapper.ScheduledEventMapper;
import com.mat.jamr.gameservice.service.event.read.consumers.LoadScheduledEventFromDbConsumer;
import com.mat.jamr.gameservice.service.event.read.consumers.MapScheduledEventResponseConsumer;
import com.matjamr.commonutils.StrategyBasedConsumer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

import java.util.List;
import java.util.function.Consumer;
import java.util.function.Function;

@Configuration
public class ReadEventBeanConfig {

    @Bean
    public Function<ReadEventContext, com.mat.jamr.gameservice.scheduler.api.ScheduledEvent> readEventStrategyBasedFlow(
            final Consumer<ReadEventContext> loadScheduledEventFromDbConsumer,
            final Consumer<ReadEventContext> mapScheduledEventResponseConsumer
    ) {
        return new StrategyBasedConsumer<>(List.of(
                loadScheduledEventFromDbConsumer,
                mapScheduledEventResponseConsumer
        ), ReadEventContext::getResponse);
    }

    @Bean
    public Consumer<ReadEventContext> loadScheduledEventFromDbConsumer(
            final DynamoDbTable<com.mat.jamr.gameservice.api.db.ScheduledEvent> eventsTable
    ) {
        return new LoadScheduledEventFromDbConsumer(eventsTable);
    }

    @Bean
    public Consumer<ReadEventContext> mapScheduledEventResponseConsumer(
            final ScheduledEventMapper scheduledEventMapper
    ) {
        return new MapScheduledEventResponseConsumer(scheduledEventMapper);
    }
}
