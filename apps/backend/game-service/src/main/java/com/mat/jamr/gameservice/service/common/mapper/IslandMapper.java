package com.mat.jamr.gameservice.service.common.mapper;

import org.mapstruct.CollectionMappingStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(
    componentModel = "spring",
    uses = {
        FarmMapper.class,
        BarnMapper.class,
        MinesMapper.class,
        FishingAreaMapper.class,
        ProtobufStringMapper.class
    },
    collectionMappingStrategy = CollectionMappingStrategy.ADDER_PREFERRED
)
public interface IslandMapper {

    @Mapping(target = "allowedPlayersList", source = "allowedPlayers")
    com.mat.jamr.gameservice.api.Island toProto(com.mat.jamr.gameservice.api.db.Island island);

    @Mapping(target = "allowedPlayers", source = "allowedPlayersList")
    com.mat.jamr.gameservice.api.db.Island toDb(com.mat.jamr.gameservice.api.Island island);
}
