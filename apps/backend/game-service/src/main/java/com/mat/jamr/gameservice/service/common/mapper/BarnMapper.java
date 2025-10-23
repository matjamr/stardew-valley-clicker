package com.mat.jamr.gameservice.service.common.mapper;

import org.mapstruct.CollectionMappingStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring", uses = { AssetMapper.class, ProtobufStringMapper.class }, collectionMappingStrategy = CollectionMappingStrategy.ADDER_PREFERRED)
public interface BarnMapper {
    // Barn
    @Mapping(target = "pensList", source = "pens")
    @Mapping(target = "storageUnitsList", source = "storageUnits")
    com.mat.jamr.gameservice.api.Barn map(com.mat.jamr.gameservice.api.db.Barn s);

    @Mapping(target = "pens", source = "pensList")
    @Mapping(target = "storageUnits", source = "storageUnitsList")
    com.mat.jamr.gameservice.api.db.Barn map(com.mat.jamr.gameservice.api.Barn s);

    // AnimalPen
    com.mat.jamr.gameservice.api.AnimalPen map(com.mat.jamr.gameservice.api.db.AnimalPen s);
    com.mat.jamr.gameservice.api.db.AnimalPen map(com.mat.jamr.gameservice.api.AnimalPen s);

    // Storage
    com.mat.jamr.gameservice.api.Storage map(com.mat.jamr.gameservice.api.db.Storage s);
    com.mat.jamr.gameservice.api.db.Storage map(com.mat.jamr.gameservice.api.Storage s);
}
