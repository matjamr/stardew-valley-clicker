package com.mat.jamr.gameservice.service.islands.generatecollectables;

import com.mat.jamr.gameservice.api.GenerateCollectablesResponse;
import com.mat.jamr.gameservice.api.db.Island;
import com.mat.jamr.gameservice.context.GenerateCollectablesContext;
import com.mat.jamr.gameservice.service.islands.generatecollectables.consumers.*;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

import java.util.function.Consumer;
import java.util.function.Function;

@Configuration
@RequiredArgsConstructor
public class GenerateCollectablesBeanConfig {

    private final DynamoDbTable<Island> islandTable;

    @Bean
    public Function<GenerateCollectablesContext, GenerateCollectablesResponse> generateCollectablesStrategyBasedFlow(
            Consumer<GenerateCollectablesContext> loadIsland,
            Consumer<GenerateCollectablesContext> generateCollectables,
            Consumer<GenerateCollectablesContext> saveIsland,
            Function<GenerateCollectablesContext, GenerateCollectablesResponse> generateCollectablesResponseMapper
    ) {
        return context -> {
            loadIsland.accept(context);
            generateCollectables.accept(context);
            saveIsland.accept(context);
            return generateCollectablesResponseMapper.apply(context);
        };
    }

    @Bean
    public Consumer<GenerateCollectablesContext> loadIsland() {
        return new LoadIslandConsumer(islandTable);
    }

    @Bean
    public Consumer<GenerateCollectablesContext> generateCollectables() {
        return new GenerateCollectablesConsumer();
    }

    @Bean
    public Consumer<GenerateCollectablesContext> saveIsland() {
        return new SaveIslandConsumer(islandTable);
    }

    @Bean
    public Function<GenerateCollectablesContext, GenerateCollectablesResponse> generateCollectablesResponseMapper() {
        return new GenerateCollectablesResponseMapper();
    }
}
