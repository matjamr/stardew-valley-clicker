package com.mat.jamr.gameservice.service.islands.create;

import com.mat.jamr.gameservice.api.CreateIslandResponse;
import com.mat.jamr.gameservice.api.db.Island;
import com.mat.jamr.gameservice.api.db.IslandVariant;
import com.mat.jamr.gameservice.context.CreateIslandContext;
import com.mat.jamr.gameservice.service.islands.create.consumers.*;
import com.matjamr.commonutils.StrategyBasedConsumer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

import java.util.List;
import java.util.function.Consumer;
import java.util.function.Function;

@Configuration
public class CreateIslandBeanConfig {

    @Bean
    public Function<CreateIslandContext, CreateIslandResponse> createIslandStrategyBasedFlow(
            final Consumer<CreateIslandContext> loadIslandVariantConsumer,
            final Consumer<CreateIslandContext> createIslandFromVariantConsumer,
            final Consumer<CreateIslandContext> setIslandMetadataConsumer,
            final Consumer<CreateIslandContext> saveIslandToDbConsumer,
            final Consumer<CreateIslandContext> createIslandResponseMapperImpl
    ) {
        return new StrategyBasedConsumer<>(
                List.of(
                        loadIslandVariantConsumer,
                        createIslandFromVariantConsumer,
                        setIslandMetadataConsumer,
                        saveIslandToDbConsumer,
                        createIslandResponseMapperImpl
                ),
                CreateIslandContext::getResponse
        );
    }

    @Bean
    public Consumer<CreateIslandContext> loadIslandVariantConsumer(
            final DynamoDbTable<IslandVariant> islandVariantTable
    ) {
        return new LoadIslandVariantConsumer<>(islandVariantTable);
    }

    @Bean
    public Consumer<CreateIslandContext> createIslandFromVariantConsumer() {
        return new CreateIslandFromVariantConsumer<>();
    }

    @Bean
    public Consumer<CreateIslandContext> setIslandMetadataConsumer() {
        return new SetIslandMetadataConsumer();
    }

    @Bean
    public Consumer<CreateIslandContext> saveIslandToDbConsumer(
            final DynamoDbTable<Island> islandTable
    ) {
        return new SaveIslandToDbConsumer<>(islandTable);
    }
}
