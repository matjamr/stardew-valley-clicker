package com.mat.jamr.gameservice.service.islandvariant.read;

import com.mat.jamr.gameservice.context.ReadIslandVariantContext;
import com.mat.jamr.gameservice.service.islandvariant.read.consumers.ReadIslandVariantFromDbConsumer;
import com.mat.jamr.gameservice.service.islandvariant.read.consumers.ReadIslandVariantResponseMapper;
import com.matjamr.commonutils.StrategyBasedConsumer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

import java.util.List;
import java.util.function.Consumer;
import java.util.function.Function;

@Configuration
public class ReadIslandVariantBeanConfig {

    @Bean
    public Function<ReadIslandVariantContext, com.mat.jamr.gameservice.api.IslandVariant> readIslandVariantStrategyBasedFlow(
            final Consumer<ReadIslandVariantContext> readIslandVariantFromDbConsumer,
            final Consumer<ReadIslandVariantContext> readIslandVariantResponseMapperImpl
    ) {
        return new StrategyBasedConsumer<>(List.of(readIslandVariantFromDbConsumer, readIslandVariantResponseMapperImpl),
                ReadIslandVariantContext::getResponse);
    }

    @Bean
    public Consumer<ReadIslandVariantContext> readIslandVariantFromDbConsumer(
            final DynamoDbTable<com.mat.jamr.gameservice.api.db.IslandVariant> islandVariantTable
    ) {
        return new ReadIslandVariantFromDbConsumer(islandVariantTable);
    }
}
