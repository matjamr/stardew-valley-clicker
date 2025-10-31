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

    @Mapping(target = "id", source = "id")
    @Mapping(target = "name", source = "name")
    @Mapping(target = "ownerId", source = "ownerId")
    @Mapping(target = "namedVariant", source = "namedVariant")
    @Mapping(target = "farmTemplate", source = "farmTemplate")
    @Mapping(target = "barnTemplate", source = "barnTemplate")
    @Mapping(target = "minesTemplate", source = "minesTemplate")
    @Mapping(target = "fishingAreaTemplate", source = "fishingAreaTemplate")
    com.mat.jamr.externalapi.model.IslandVariant map(com.mat.jamr.gameservice.api.IslandVariant variant);

    // Farm mapping
    @Mapping(target = "plots", source = "plotsList")
    @Mapping(target = "decorations", source = "decorationsList")
    com.mat.jamr.externalapi.model.Farm mapFarm(com.mat.jamr.gameservice.api.Farm farm);

    com.mat.jamr.externalapi.model.CropPlot mapCropPlot(com.mat.jamr.gameservice.api.CropPlot plot);

    // Barn mapping
    @Mapping(target = "pens", source = "pensList")
    @Mapping(target = "storageUnits", source = "storageUnitsList")
    com.mat.jamr.externalapi.model.Barn mapBarn(com.mat.jamr.gameservice.api.Barn barn);

    @Mapping(target = "animalIds", source = "animalIdsList")
    com.mat.jamr.externalapi.model.AnimalPen mapAnimalPen(com.mat.jamr.gameservice.api.AnimalPen pen);

    com.mat.jamr.externalapi.model.Storage mapStorage(com.mat.jamr.gameservice.api.Storage storage);

    // Mines mapping
    @Mapping(target = "levels", source = "levelsList")
    com.mat.jamr.externalapi.model.Mines mapMines(com.mat.jamr.gameservice.api.Mines mines);

    @Mapping(target = "tiles", source = "tilesList")
    @Mapping(target = "resourceIds", source = "resourceIdsList")
    com.mat.jamr.externalapi.model.MineLevel mapMineLevel(com.mat.jamr.gameservice.api.MineLevel level);

    com.mat.jamr.externalapi.model.MineTile mapMineTile(com.mat.jamr.gameservice.api.MineTile tile);

    // Fishing area mapping
    @Mapping(target = "spots", source = "spotsList")
    @Mapping(target = "availableFishIds", source = "availableFishIdsList")
    com.mat.jamr.externalapi.model.FishingArea mapFishingArea(com.mat.jamr.gameservice.api.FishingArea area);

    @Mapping(target = "specificFishIds", source = "specificFishIdsList")
    com.mat.jamr.externalapi.model.FishingSpot mapFishingSpot(com.mat.jamr.gameservice.api.FishingSpot spot);

    // Decoration mapping
    com.mat.jamr.externalapi.model.Decoration mapDecoration(com.mat.jamr.gameservice.api.Decoration decoration);

    // Terrain mapping (for Islands, not IslandVariant)
//    @Mapping(target = "tiles", source = "tilesList")
//    com.mat.jamr.externalapi.model.Terrain mapTerrain(com.mat.jamr.gameservice.api.Terrain terrain);
//
//    com.mat.jamr.externalapi.model.TerrainTile mapTerrainTile(com.mat.jamr.gameservice.api.TerrainTile tile);

    // Asset mapping
    @Mapping(target = "content", source = "content", qualifiedByName = "byteStringToBytes")
    com.mat.jamr.externalapi.model.Asset mapAsset(com.mat.jamr.gameservice.api.Asset asset);

    @ValueMappings({
        @ValueMapping(source = "UNRECOGNIZED", target = MappingConstants.NULL)
    })
    com.mat.jamr.externalapi.model.AssetType mapAssetType(com.mat.jamr.gameservice.api.AssetType type);

    @Named("byteStringToBytes")
    default byte[] byteStringToBytes(ByteString byteString) {
        return byteString == null ? null : (byteString.isEmpty() ? null : byteString.toByteArray());
    }
}
