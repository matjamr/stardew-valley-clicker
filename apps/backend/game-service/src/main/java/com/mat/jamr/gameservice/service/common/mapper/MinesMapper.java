package com.mat.jamr.gameservice.service.common.mapper;

import org.mapstruct.CollectionMappingStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring", uses = { AssetMapper.class, ProtobufStringMapper.class }, collectionMappingStrategy = CollectionMappingStrategy.ADDER_PREFERRED)
public interface MinesMapper {
    // Mines
    @Mapping(target = "levelsList", source = "levels")
    com.mat.jamr.gameservice.api.Mines map(com.mat.jamr.gameservice.api.db.Mines s);

    @Mapping(target = "levels", source = "levelsList")
    com.mat.jamr.gameservice.api.db.Mines map(com.mat.jamr.gameservice.api.Mines s);

    // MineLevel
    @Mapping(target = "tilesList", source = "tiles")
    @Mapping(target = "resourceIdsList", source = "resourceIds")
    com.mat.jamr.gameservice.api.MineLevel map(com.mat.jamr.gameservice.api.db.MineLevel s);

    @Mapping(target = "tiles", source = "tilesList")
    @Mapping(target = "resourceIds", source = "resourceIdsList")
    com.mat.jamr.gameservice.api.db.MineLevel map(com.mat.jamr.gameservice.api.MineLevel s);

    // MineTile
    com.mat.jamr.gameservice.api.MineTile map(com.mat.jamr.gameservice.api.db.MineTile s);
    com.mat.jamr.gameservice.api.db.MineTile map(com.mat.jamr.gameservice.api.MineTile s);
}
