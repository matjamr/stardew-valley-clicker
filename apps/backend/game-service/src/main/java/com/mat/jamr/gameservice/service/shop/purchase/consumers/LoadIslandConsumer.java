package com.mat.jamr.gameservice.service.shop.purchase.consumers;

import com.mat.jamr.gameservice.api.db.Island;
import com.mat.jamr.gameservice.context.PurchaseItemContext;
import lombok.RequiredArgsConstructor;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;
import software.amazon.awssdk.enhanced.dynamodb.Key;

import java.util.function.Consumer;

@RequiredArgsConstructor
public class LoadIslandConsumer implements Consumer<PurchaseItemContext> {

    private final DynamoDbTable<Island> islandTable;

    @Override
    public void accept(PurchaseItemContext context) {
        String islandId = context.getRequest().getIslandId();

        Key key = Key.builder()
                .partitionValue(islandId)
                .build();

        Island island = islandTable.getItem(key);

        if (island == null) {
            throw new IllegalArgumentException("Island not found: " + islandId);
        }

        context.setIsland(island);
    }
}
