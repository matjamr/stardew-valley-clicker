package com.mat.jamr.apigateway.service.game.mapper;

import com.mat.jamr.externalapi.model.CreateIslandRequest;
import com.mat.jamr.externalapi.model.CreateIslandResponse;
import com.mat.jamr.externalapi.model.ReadIslandResponse;
import com.google.protobuf.ByteString;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;
import org.mapstruct.ValueMapping;
import org.mapstruct.ValueMappings;
import org.mapstruct.MappingConstants;

@Mapper(componentModel = "spring")
public interface IslandApiMapper {

    com.mat.jamr.gameservice.api.CreateIslandRequest toGrpc(CreateIslandRequest req);

    @Mapping(target = "id", source = "id")
    CreateIslandResponse toExternal(com.mat.jamr.gameservice.api.CreateIslandResponse resp);

    @Mapping(target = "island", source = "island")
    ReadIslandResponse toExternal(com.mat.jamr.gameservice.api.ReadIslandResponse resp);

    // Nested mappings
    @Mapping(target = "allowedPlayers", source = "allowedPlayersList")
    @Mapping(target = "terrains", source = "terrainsList")
    com.mat.jamr.externalapi.model.Island mapIsland(com.mat.jamr.gameservice.api.Island s);

    @Mapping(target = "tiles", source = "tilesList")
    com.mat.jamr.externalapi.model.Terrain mapTerrain(com.mat.jamr.gameservice.api.Terrain s);

    com.mat.jamr.externalapi.model.TerrainTile mapTile(com.mat.jamr.gameservice.api.TerrainTile s);

    @Mapping(target = "content", source = "content", qualifiedByName = "byteStringToBytes")
    com.mat.jamr.externalapi.model.Asset mapAsset(com.mat.jamr.gameservice.api.Asset s);

    // Enum mapping to handle UNRECOGNIZED from protobuf enums
    @ValueMappings({
        @ValueMapping(source = "UNRECOGNIZED", target = MappingConstants.NULL)
    })
    com.mat.jamr.externalapi.model.AssetType mapAssetType(com.mat.jamr.gameservice.api.AssetType src);

    @Named("byteStringToBytes")
    default byte[] byteStringToBytes(ByteString byteString) {
        return byteString == null ? null : (byteString.isEmpty() ? null : byteString.toByteArray());
    }
}
