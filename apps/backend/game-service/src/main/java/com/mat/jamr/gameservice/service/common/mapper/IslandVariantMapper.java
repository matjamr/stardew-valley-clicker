package com.mat.jamr.gameservice.service.common.mapper;

import org.mapstruct.CollectionMappingStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring", uses = { TerrainMapper.class, AssetMapper.class, ProtobufStringMapper.class }, collectionMappingStrategy = CollectionMappingStrategy.ADDER_PREFERRED)
public interface IslandVariantMapper {


    @Mapping(source = "startingTerrains", target = "startingTerrainsList")
    com.mat.jamr.gameservice.api.IslandVariant map(com.mat.jamr.gameservice.api.db.IslandVariant islandVariant);

    @Mapping(source = "startingTerrainsList", target = "startingTerrains")
    com.mat.jamr.gameservice.api.db.IslandVariant map(com.mat.jamr.gameservice.api.IslandVariant islandVariant);
}
