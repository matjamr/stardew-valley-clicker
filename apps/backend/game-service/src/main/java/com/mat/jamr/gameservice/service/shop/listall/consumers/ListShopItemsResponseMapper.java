package com.mat.jamr.gameservice.service.shop.listall.consumers;

import com.mat.jamr.gameservice.api.ListShopItemsResponse;
import com.mat.jamr.gameservice.api.ShopCategoryInfo;
import com.mat.jamr.gameservice.api.ShopCategory;
import com.mat.jamr.gameservice.context.ShopItemsAware;
import com.mat.jamr.gameservice.service.common.mapper.ShopItemMapper;
import lombok.RequiredArgsConstructor;

import java.util.Arrays;
import java.util.function.Function;
import java.util.stream.Collectors;

@RequiredArgsConstructor
public class ListShopItemsResponseMapper<T extends ShopItemsAware> implements Function<T, ListShopItemsResponse> {

    private final ShopItemMapper shopItemMapper;

    @Override
    public ListShopItemsResponse apply(T context) {
        var items = context.getShopItems();

        var builder = ListShopItemsResponse.newBuilder();

        if (items != null && !items.isEmpty()) {
            var protoItems = items.stream()
                    .map(shopItemMapper::toProto)
                    .collect(Collectors.toList());
            builder.addAllItems(protoItems);
        }

        // Add category metadata
        builder.addAllCategories(getCategoryInfo());

        return builder.build();
    }

    private Iterable<ShopCategoryInfo> getCategoryInfo() {
        return Arrays.asList(
            ShopCategoryInfo.newBuilder()
                .setCategory(ShopCategory.SEEDS)
                .setName("Seeds")
                .setDescription("Plant and grow crops")
                .setIconUrl("assets/icons/categories/seeds.png")
                .setSortOrder(1)
                .build(),
            ShopCategoryInfo.newBuilder()
                .setCategory(ShopCategory.TOOLS)
                .setName("Tools")
                .setDescription("Upgrade your equipment")
                .setIconUrl("assets/icons/categories/tools.png")
                .setSortOrder(2)
                .build(),
            ShopCategoryInfo.newBuilder()
                .setCategory(ShopCategory.FOOD)
                .setName("Food")
                .setDescription("Restore energy and health")
                .setIconUrl("assets/icons/categories/food.png")
                .setSortOrder(3)
                .build(),
            ShopCategoryInfo.newBuilder()
                .setCategory(ShopCategory.ANIMALS)
                .setName("Animals")
                .setDescription("Livestock for your farm")
                .setIconUrl("assets/icons/categories/animals.png")
                .setSortOrder(4)
                .build(),
            ShopCategoryInfo.newBuilder()
                .setCategory(ShopCategory.BUILDINGS)
                .setName("Buildings")
                .setDescription("Structures and decorations")
                .setIconUrl("assets/icons/categories/buildings.png")
                .setSortOrder(5)
                .build(),
            ShopCategoryInfo.newBuilder()
                .setCategory(ShopCategory.FERTILIZER)
                .setName("Fertilizer")
                .setDescription("Enhance crop growth")
                .setIconUrl("assets/icons/categories/fertilizer.png")
                .setSortOrder(6)
                .build()
        );
    }
}
