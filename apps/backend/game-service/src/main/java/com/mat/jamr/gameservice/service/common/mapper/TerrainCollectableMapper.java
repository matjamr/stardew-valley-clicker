package com.mat.jamr.gameservice.service.common.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.NullValuePropertyMappingStrategy;
import org.mapstruct.NullValueCheckStrategy;
import org.mapstruct.Named;

@Mapper(
    componentModel = "spring",
    nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE,
    nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS
)
public interface TerrainCollectableMapper {

    @Named("typeToProto")
    default com.mat.jamr.gameservice.api.TerrainCollectableType mapTypeToProto(String type) {
        if (type == null) {
            return com.mat.jamr.gameservice.api.TerrainCollectableType.TERRAIN_COLLECTABLE_UNSPECIFIED;
        }
        try {
            return com.mat.jamr.gameservice.api.TerrainCollectableType.valueOf(type);
        } catch (IllegalArgumentException e) {
            return com.mat.jamr.gameservice.api.TerrainCollectableType.TERRAIN_COLLECTABLE_UNSPECIFIED;
        }
    }

    @Named("typeFromProto")
    default String mapTypeFromProto(com.mat.jamr.gameservice.api.TerrainCollectableType type) {
        if (type == null || type == com.mat.jamr.gameservice.api.TerrainCollectableType.TERRAIN_COLLECTABLE_UNSPECIFIED) {
            return null;
        }
        return type.name();
    }
}
