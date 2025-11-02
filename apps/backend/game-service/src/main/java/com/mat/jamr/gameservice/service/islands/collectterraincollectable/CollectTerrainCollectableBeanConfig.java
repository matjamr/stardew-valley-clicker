package com.mat.jamr.gameservice.service.islands.collectterraincollectable;

import com.mat.jamr.gameservice.api.CollectTerrainCollectableResponse;
import com.mat.jamr.gameservice.api.db.Island;
import com.mat.jamr.gameservice.context.CollectTerrainCollectableContext;
import com.mat.jamr.gameservice.service.common.mapper.AssetMapper;
import com.mat.jamr.gameservice.service.islands.collectterraincollectable.consumers.*;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

import java.util.function.Consumer;
import java.util.function.Function;

@Configuration
@RequiredArgsConstructor
public class CollectTerrainCollectableBeanConfig {

    private final DynamoDbTable<Island> islandTable;
    private final AssetMapper assetMapper;

    @Bean
    public Function<CollectTerrainCollectableContext, CollectTerrainCollectableResponse> collectTerrainCollectableStrategyBasedFlow(
            Consumer<CollectTerrainCollectableContext> loadIslandForCollect,
            Consumer<CollectTerrainCollectableContext> findCollectable,
            Consumer<CollectTerrainCollectableContext> extractRewards,
            Consumer<CollectTerrainCollectableContext> markCollectableCollected,
            Consumer<CollectTerrainCollectableContext> saveIslandAfterCollect,
            Function<CollectTerrainCollectableContext, CollectTerrainCollectableResponse> collectResponseMapper
    ) {
        return context -> {
            loadIslandForCollect.accept(context);
            findCollectable.accept(context);
            extractRewards.accept(context);
            markCollectableCollected.accept(context);
            saveIslandAfterCollect.accept(context);
            return collectResponseMapper.apply(context);
        };
    }

    @Bean
    public Consumer<CollectTerrainCollectableContext> loadIslandForCollect() {
        return new LoadIslandForCollectConsumer(islandTable);
    }

    @Bean
    public Consumer<CollectTerrainCollectableContext> findCollectable() {
        return new FindCollectableConsumer();
    }

    @Bean
    public Consumer<CollectTerrainCollectableContext> extractRewards() {
        return new ExtractRewardsConsumer();
    }

    @Bean
    public Consumer<CollectTerrainCollectableContext> markCollectableCollected() {
        return new MarkCollectableCollectedConsumer();
    }

    @Bean
    public Consumer<CollectTerrainCollectableContext> saveIslandAfterCollect() {
        return new SaveIslandAfterCollectConsumer(islandTable);
    }

    @Bean
    public Function<CollectTerrainCollectableContext, CollectTerrainCollectableResponse> collectResponseMapper() {
        return new CollectResponseMapper(assetMapper);
    }
}
