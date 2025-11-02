package com.mat.jamr.apigateway.service.game.mapper;

import com.mat.jamr.externalapi.model.CurrencyType;
import com.mat.jamr.externalapi.model.ListShopItemsResponse;
import com.mat.jamr.externalapi.model.PurchaseItemRequest;
import com.mat.jamr.externalapi.model.PurchaseItemResponse;
import com.mat.jamr.externalapi.model.ShopCategory;
import com.mat.jamr.externalapi.model.ShopCategoryInfo;
import com.mat.jamr.externalapi.model.ShopItem;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingConstants;
import org.mapstruct.ValueMapping;
import org.mapstruct.ValueMappings;

@Mapper(componentModel = "spring")
public interface ShopApiMapper {

    @Mapping(target = "items", source = "itemsList")
    @Mapping(target = "categories", source = "categoriesList")
    ListShopItemsResponse toExternal(com.mat.jamr.gameservice.api.ListShopItemsResponse resp);

    ShopItem toExternal(com.mat.jamr.gameservice.api.ShopItem item);

    @Mapping(target = "category", source = "categoryValue")
    ShopCategoryInfo toExternal(com.mat.jamr.gameservice.api.ShopCategoryInfo info);

    @ValueMappings({
        @ValueMapping(source = "CATEGORY_UNSPECIFIED", target = MappingConstants.NULL),
        @ValueMapping(source = "UNRECOGNIZED", target = MappingConstants.NULL)
    })
    ShopCategory mapCategory(com.mat.jamr.gameservice.api.ShopCategory category);

    @ValueMappings({
        @ValueMapping(source = "CURRENCY_UNSPECIFIED", target = MappingConstants.NULL),
        @ValueMapping(source = "UNRECOGNIZED", target = MappingConstants.NULL)
    })
    CurrencyType mapCurrency(com.mat.jamr.gameservice.api.CurrencyType currency);

    com.mat.jamr.gameservice.api.PurchaseItemRequest toGrpc(PurchaseItemRequest req);

    PurchaseItemResponse toExternal(com.mat.jamr.gameservice.api.PurchaseItemResponse resp);
}
