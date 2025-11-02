package com.mat.jamr.gameservice.service.shop.purchase;

import com.mat.jamr.gameservice.api.PurchaseItemResponse;
import com.mat.jamr.gameservice.api.db.Island;
import com.mat.jamr.gameservice.api.db.ShopItem;
import com.mat.jamr.gameservice.context.PurchaseItemContext;
import com.mat.jamr.gameservice.service.shop.purchase.consumers.*;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

import java.util.function.Function;

@Configuration
@RequiredArgsConstructor
public class PurchaseItemBeanConfig {

    private final DynamoDbTable<Island> islandTable;
    private final DynamoDbTable<ShopItem> shopItemTable;

    @Bean
    public Function<PurchaseItemContext, PurchaseItemResponse> purchaseItemStrategyBasedFlow(
            Function<PurchaseItemContext, PurchaseItemResponse> purchaseItemResponseMapper
    ) {
        return context -> {
            // Load island
            var loadIsland = new LoadIslandConsumer(islandTable);
            loadIsland.accept(context);

            // Load shop item
            var loadShopItem = new LoadShopItemConsumer(shopItemTable);
            loadShopItem.accept(context);


            System.out.println(loadShopItem);
            // Add item to bag
            var addItemToBag = new AddItemToBagConsumer();
            addItemToBag.accept(context);
            System.out.println(addItemToBag);
            // Save island with updated bag
            var saveIsland = new SaveIslandConsumer(islandTable);
            saveIsland.accept(context);

            return purchaseItemResponseMapper.apply(context);
        };
    }

    @Bean
    public Function<PurchaseItemContext, PurchaseItemResponse> purchaseItemResponseMapper() {
        return new PurchaseItemResponseMapper();
    }
}
