package com.mat.jamr.gameservice.service.shop.purchase.consumers;

import com.mat.jamr.gameservice.api.db.Island;
import com.mat.jamr.gameservice.context.PurchaseItemContext;
import lombok.RequiredArgsConstructor;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

import java.util.function.Consumer;

@RequiredArgsConstructor
public class SaveIslandConsumer implements Consumer<PurchaseItemContext> {

    private final DynamoDbTable<Island> islandTable;

    @Override
    public void accept(PurchaseItemContext context) {
        Island island = context.getIsland();
        islandTable.putItem(island);
    }
}
