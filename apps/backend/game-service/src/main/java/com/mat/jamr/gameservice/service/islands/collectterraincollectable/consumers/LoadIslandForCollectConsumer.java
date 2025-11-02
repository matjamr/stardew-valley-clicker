package com.mat.jamr.gameservice.service.islands.collectterraincollectable.consumers;

import com.mat.jamr.gameservice.api.db.Island;
import com.mat.jamr.gameservice.context.CollectTerrainCollectableContext;
import lombok.RequiredArgsConstructor;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;
import software.amazon.awssdk.enhanced.dynamodb.Key;

import java.util.function.Consumer;

@RequiredArgsConstructor
public class LoadIslandForCollectConsumer implements Consumer<CollectTerrainCollectableContext> {

    private final DynamoDbTable<Island> islandTable;

    @Override
    public void accept(CollectTerrainCollectableContext context) {
        var islandId = context.getRequest().getIslandId();

        var key = Key.builder()
                .partitionValue(islandId)
                .build();

        var island = islandTable.getItem(key);
        if (island == null) {
            throw new IllegalArgumentException("Island not found: " + islandId);
        }

        context.setIsland(island);
    }
}
