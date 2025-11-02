package com.mat.jamr.gameservice.service.common.mapper;

import com.mat.jamr.gameservice.api.CurrencyType;
import com.mat.jamr.gameservice.api.ShopCategory;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;

@Mapper(componentModel = "spring", uses = {ProtobufStringMapper.class})
public interface ShopItemMapper {

    default com.mat.jamr.gameservice.api.ShopItem toProto(com.mat.jamr.gameservice.api.db.ShopItem dbItem) {
        if (dbItem == null) {
            return null;
        }

        var builder = com.mat.jamr.gameservice.api.ShopItem.newBuilder();

        if (dbItem.getId() != null) {
            builder.setId(dbItem.getId());
        }
        if (dbItem.getName() != null) {
            builder.setName(dbItem.getName());
        }
        if (dbItem.getDescription() != null) {
            builder.setDescription(dbItem.getDescription());
        }
        builder.setCategory(mapCategoryToProto(dbItem.getCategory()));
        if (dbItem.getPrice() != null) {
            builder.setPrice(dbItem.getPrice());
        }
        builder.setCurrency(mapCurrencyToProto(dbItem.getCurrency()));
        if (dbItem.getIconUrl() != null) {
            builder.setIconUrl(dbItem.getIconUrl());
        }
        if (dbItem.getStackSize() != null) {
            builder.setStackSize(dbItem.getStackSize());
        }
        if (dbItem.getMetadata() != null) {
            builder.putAllMetadata(dbItem.getMetadata());
        }
        if (dbItem.getAvailable() != null) {
            builder.setAvailable(dbItem.getAvailable());
        }
        if (dbItem.getStock() != null) {
            builder.setStock(dbItem.getStock());
        }

        return builder.build();
    }

    @Mapping(target = "id", source = "id", qualifiedByName = "fromProto")
    @Mapping(target = "name", source = "name", qualifiedByName = "fromProto")
    @Mapping(target = "description", source = "description", qualifiedByName = "fromProto")
    @Mapping(target = "category", expression = "java(mapCategoryToDb(protoItem.getCategory()))")
    @Mapping(target = "currency", expression = "java(mapCurrencyToDb(protoItem.getCurrency()))")
    @Mapping(target = "iconUrl", source = "iconUrl", qualifiedByName = "fromProto")
    @Mapping(target = "metadata", source = "metadataMap")
    com.mat.jamr.gameservice.api.db.ShopItem toDb(com.mat.jamr.gameservice.api.ShopItem protoItem);

    @Named("mapCategoryToProto")
    default ShopCategory mapCategoryToProto(String category) {
        if (category == null) return ShopCategory.CATEGORY_UNSPECIFIED;
        try {
            return ShopCategory.valueOf(category);
        } catch (IllegalArgumentException e) {
            return ShopCategory.CATEGORY_UNSPECIFIED;
        }
    }

    @Named("mapCategoryToDb")
    default String mapCategoryToDb(ShopCategory category) {
        if (category == null || category == ShopCategory.CATEGORY_UNSPECIFIED) return null;
        return category.name();
    }

    @Named("mapCurrencyToProto")
    default CurrencyType mapCurrencyToProto(String currency) {
        if (currency == null) return CurrencyType.CURRENCY_UNSPECIFIED;
        try {
            return CurrencyType.valueOf(currency);
        } catch (IllegalArgumentException e) {
            return CurrencyType.CURRENCY_UNSPECIFIED;
        }
    }

    @Named("mapCurrencyToDb")
    default String mapCurrencyToDb(CurrencyType currency) {
        if (currency == null || currency == CurrencyType.CURRENCY_UNSPECIFIED) return null;
        return currency.name();
    }
}
