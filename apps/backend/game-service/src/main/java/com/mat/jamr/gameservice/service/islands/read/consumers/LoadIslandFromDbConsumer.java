package com.mat.jamr.gameservice.service.islands.read.consumers;

import com.mat.jamr.gameservice.api.db.Island;
import com.mat.jamr.gameservice.context.IslandAware;
import com.mat.jamr.gameservice.context.IslandIdAware;
import lombok.RequiredArgsConstructor;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

import java.util.function.Consumer;

@RequiredArgsConstructor
public class LoadIslandFromDbConsumer<T extends IslandIdAware & IslandAware> implements Consumer<T> {

    private final DynamoDbTable<Island> islandTable;

    @Override
    public void accept(T context) {
        var islandId = context.getIslandId();
        if (islandId == null || islandId.isEmpty()) {
            throw new IllegalArgumentException("Island ID must be provided");
        }

        var island = islandTable.getItem(r -> r.key(k -> k.partitionValue(islandId)));

        if (island == null) {
            throw new IllegalStateException("Island not found with id: " + islandId);
        }

        context.setIsland(island);
    }
}
