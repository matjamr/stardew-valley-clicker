package com.mat.jamr.gameservice.service.islands.generatecollectables.consumers;

import com.mat.jamr.gameservice.api.db.Island;
import com.mat.jamr.gameservice.context.GenerateCollectablesContext;
import lombok.RequiredArgsConstructor;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

import java.util.function.Consumer;

@RequiredArgsConstructor
public class SaveIslandConsumer implements Consumer<GenerateCollectablesContext> {

    private final DynamoDbTable<Island> islandTable;

    @Override
    public void accept(GenerateCollectablesContext context) {
        var island = context.getIsland();
        if (island == null) {
            throw new IllegalStateException("Island not found in context");
        }

        islandTable.putItem(island);
    }
}
