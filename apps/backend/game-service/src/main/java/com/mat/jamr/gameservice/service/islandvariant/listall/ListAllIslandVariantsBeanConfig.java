package com.mat.jamr.gameservice.service.islandvariant.listall;

import com.mat.jamr.gameservice.context.ListAllIslandVariantsContext;
import com.mat.jamr.gameservice.service.islandvariant.listall.consumers.ListAllIslandVariantsFromDbConsumer;
import com.matjamr.commonutils.StrategyBasedConsumer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

import java.util.List;
import java.util.function.Consumer;
import java.util.function.Function;

@Configuration
public class ListAllIslandVariantsBeanConfig {

    @Bean
    public Function<ListAllIslandVariantsContext, com.mat.jamr.gameservice.api.ListAllIslandVariantsResponse> listAllIslandVariantsStrategyBasedFlow(
            final Consumer<ListAllIslandVariantsContext> listAllIslandVariantsFromDbConsumer,
            final Consumer<ListAllIslandVariantsContext> listAllIslandVariantsResponseMapperImpl
    ) {
        return new StrategyBasedConsumer<>(List.of(listAllIslandVariantsFromDbConsumer, listAllIslandVariantsResponseMapperImpl),
                ListAllIslandVariantsContext::getResponse);
    }

    @Bean
    public Consumer<ListAllIslandVariantsContext> listAllIslandVariantsFromDbConsumer(
            final DynamoDbTable<com.mat.jamr.gameservice.api.db.IslandVariant> islandVariantTable
    ) {
        return new ListAllIslandVariantsFromDbConsumer(islandVariantTable);
    }
}
