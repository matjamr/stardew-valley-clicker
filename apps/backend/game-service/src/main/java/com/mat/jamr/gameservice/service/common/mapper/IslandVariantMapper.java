package com.mat.jamr.gameservice.service.common.mapper;

import org.mapstruct.CollectionMappingStrategy;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring", uses = { ProtobufStringMapper.class, AssetMapper.class, FarmMapper.class, BarnMapper.class, MinesMapper.class, FishingAreaMapper.class }, collectionMappingStrategy = CollectionMappingStrategy.ADDER_PREFERRED)
public interface IslandVariantMapper {

    com.mat.jamr.gameservice.api.IslandVariant map(com.mat.jamr.gameservice.api.db.IslandVariant islandVariant);

    com.mat.jamr.gameservice.api.db.IslandVariant map(com.mat.jamr.gameservice.api.IslandVariant islandVariant);
}
