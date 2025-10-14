package com.mat.jamr.gameservice.service.common.mapper;

import com.mat.jamr.gameservice.api.db.Terrain;
import org.mapstruct.CollectionMappingStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;

import java.util.List;

@Mapper(componentModel = "spring", uses = { TerrainTileMapper.class, ProtobufStringMapper.class }, collectionMappingStrategy = CollectionMappingStrategy.ADDER_PREFERRED)
public interface TerrainMapper {

    @Mapping(source = "tiles", target = "tilesList")
    com.mat.jamr.gameservice.api.Terrain map(Terrain terrain);

    @Mapping(source = "tilesList", target = "tiles")
    Terrain map(com.mat.jamr.gameservice.api.Terrain terrain);

}
