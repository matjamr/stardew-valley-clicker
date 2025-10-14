package com.mat.jamr.gameservice.service.common.mapper;

import com.mat.jamr.gameservice.api.db.TerrainTile;
import org.mapstruct.CollectionMappingStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Named;

import java.util.List;

@Mapper(componentModel = "spring", uses = { AssetMapper.class, ProtobufStringMapper.class }, collectionMappingStrategy = CollectionMappingStrategy.ADDER_PREFERRED)
public interface TerrainTileMapper {

    com.mat.jamr.gameservice.api.TerrainTile map(TerrainTile terrainTile);
    TerrainTile map(com.mat.jamr.gameservice.api.TerrainTile terrainTile);

    default List<com.mat.jamr.gameservice.api.TerrainTile> mapCollection(List<TerrainTile> terrainTiles) {
        return terrainTiles.stream()
                .map(this::map)
                .toList();
    }

    default List<TerrainTile> mapCollection2(List<com.mat.jamr.gameservice.api.TerrainTile> terrainTiles) {
        return terrainTiles.stream()
                .map(this::map)
                .toList();
    }
}
