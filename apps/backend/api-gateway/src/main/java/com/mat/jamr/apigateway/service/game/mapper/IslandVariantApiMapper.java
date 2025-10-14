package com.mat.jamr.apigateway.service.game.mapper;

import com.google.protobuf.ByteString;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;
import org.mapstruct.ValueMapping;
import org.mapstruct.ValueMappings;
import org.mapstruct.MappingConstants;

@Mapper(componentModel = "spring")
public interface IslandVariantApiMapper {

    @Mapping(target = "startingTerrains", source = "startingTerrainsList")
    com.mat.jamr.externalapi.model.IslandVariant map(com.mat.jamr.gameservice.api.IslandVariant s);

    @ValueMappings({
        @ValueMapping(source = "UNRECOGNIZED", target = MappingConstants.NULL)
    })
    com.mat.jamr.externalapi.model.IslandVariant.TypeEnum mapVariantType(com.mat.jamr.gameservice.api.IslandVariantType type);

    @Mapping(target = "tiles", source = "tilesList")
    com.mat.jamr.externalapi.model.Terrain mapTerrain(com.mat.jamr.gameservice.api.Terrain s);

    com.mat.jamr.externalapi.model.TerrainTile mapTile(com.mat.jamr.gameservice.api.TerrainTile s);

    @Mapping(target = "content", source = "content", qualifiedByName = "byteStringToBytes")
    com.mat.jamr.externalapi.model.Asset mapAsset(com.mat.jamr.gameservice.api.Asset s);

    @ValueMappings({
        @ValueMapping(source = "UNRECOGNIZED", target = MappingConstants.NULL)
    })
    com.mat.jamr.externalapi.model.AssetType mapAssetType(com.mat.jamr.gameservice.api.AssetType src);

    @Named("byteStringToBytes")
    default byte[] byteStringToBytes(ByteString byteString) {
        return byteString == null ? null : (byteString.isEmpty() ? null : byteString.toByteArray());
    }
}
