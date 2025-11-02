package com.mat.jamr.gameservice.service.shop.purchase.consumers;

import com.mat.jamr.gameservice.api.db.ShopItem;
import com.mat.jamr.gameservice.context.PurchaseItemContext;
import lombok.RequiredArgsConstructor;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;
import software.amazon.awssdk.enhanced.dynamodb.Key;

import java.util.function.Consumer;

@RequiredArgsConstructor
public class LoadShopItemConsumer implements Consumer<PurchaseItemContext> {

    private final DynamoDbTable<ShopItem> shopItemTable;

    @Override
    public void accept(PurchaseItemContext context) {
        String itemId = context.getRequest().getItemId();

        Key key = Key.builder()
                .partitionValue(itemId)
                .build();

        ShopItem shopItem = shopItemTable.getItem(key);

        if (shopItem == null) {
            throw new IllegalArgumentException("Shop item not found: " + itemId);
        }

        context.setShopItem(shopItem);
    }
}
