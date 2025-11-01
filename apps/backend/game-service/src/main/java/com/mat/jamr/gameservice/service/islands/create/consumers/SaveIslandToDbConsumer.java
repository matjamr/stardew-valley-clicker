package com.mat.jamr.gameservice.service.islands.create.consumers;

import com.mat.jamr.gameservice.api.db.Island;
import com.mat.jamr.gameservice.context.IslandAware;
import lombok.RequiredArgsConstructor;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

import java.util.function.Consumer;

@RequiredArgsConstructor
public class SaveIslandToDbConsumer<T extends IslandAware> implements Consumer<T> {
    private final DynamoDbTable<Island> islandTable;

    @Override
    public void accept(T context) {
        var island = context.getIsland();
        if (island == null) {
            throw new IllegalStateException("Island must be set before saving");
        }

        islandTable.putItem(island);
    }
}
