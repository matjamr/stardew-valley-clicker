package com.mat.jamr.gameservice.service.islands.update.consumers;

import com.mat.jamr.gameservice.api.db.Island;
import com.mat.jamr.gameservice.context.UpdateIslandContext;
import lombok.RequiredArgsConstructor;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

import java.util.function.Consumer;

@RequiredArgsConstructor
public class SaveIslandToDbConsumer implements Consumer<UpdateIslandContext> {

    private final DynamoDbTable<Island> islandTable;

    @Override
    public void accept(UpdateIslandContext context) {
        var island = context.getIsland();
        if (island == null) {
            throw new IllegalStateException("Island not found in context");
        }

        islandTable.putItem(island);
    }
}
