package com.mat.jamr.gameservice.service.common.mapper;

import org.mapstruct.CollectionMappingStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring", uses = { AssetMapper.class, ProtobufStringMapper.class }, collectionMappingStrategy = CollectionMappingStrategy.ADDER_PREFERRED)
public interface FishingAreaMapper {
    // FishingArea
    @Mapping(target = "spotsList", source = "spots")
    @Mapping(target = "availableFishIdsList", source = "availableFishIds")
    com.mat.jamr.gameservice.api.FishingArea map(com.mat.jamr.gameservice.api.db.FishingArea s);

    @Mapping(target = "spots", source = "spotsList")
    @Mapping(target = "availableFishIds", source = "availableFishIdsList")
    com.mat.jamr.gameservice.api.db.FishingArea map(com.mat.jamr.gameservice.api.FishingArea s);

    // FishingSpot
    com.mat.jamr.gameservice.api.FishingSpot map(com.mat.jamr.gameservice.api.db.FishingSpot s);
    com.mat.jamr.gameservice.api.db.FishingSpot map(com.mat.jamr.gameservice.api.FishingSpot s);
}
