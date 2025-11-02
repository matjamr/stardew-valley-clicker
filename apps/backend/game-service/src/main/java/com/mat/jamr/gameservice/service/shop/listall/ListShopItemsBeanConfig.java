package com.mat.jamr.gameservice.service.shop.listall;

import com.mat.jamr.gameservice.api.ListShopItemsResponse;
import com.mat.jamr.gameservice.api.db.ShopItem;
import com.mat.jamr.gameservice.context.ListShopItemsContext;
import com.mat.jamr.gameservice.service.common.mapper.ShopItemMapper;
import com.mat.jamr.gameservice.service.shop.listall.consumers.ListShopItemsResponseMapper;
import com.mat.jamr.gameservice.service.shop.listall.consumers.LoadShopItemsFromDbConsumer;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

import java.util.function.Consumer;
import java.util.function.Function;

@Configuration
@RequiredArgsConstructor
public class ListShopItemsBeanConfig {

    private final DynamoDbTable<ShopItem> shopItemTable;
    private final ShopItemMapper shopItemMapper;

    @Bean
    public Function<ListShopItemsContext, ListShopItemsResponse> listShopItemsStrategyBasedFlow(
            Function<ListShopItemsContext, ListShopItemsResponse> listShopItemsResponseMapper
    ) {
        return context -> {
            // Load shop items with optional category filter
            var categoryFilter = context.getCategoryFilter();
            var loadShopItems = new LoadShopItemsFromDbConsumer(shopItemTable, categoryFilter);
            loadShopItems.accept(context);

            return listShopItemsResponseMapper.apply(context);
        };
    }

    @Bean
    public Function<ListShopItemsContext, ListShopItemsResponse> listShopItemsResponseMapper() {
        return new ListShopItemsResponseMapper<>(shopItemMapper);
    }
}
