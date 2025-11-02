package com.mat.jamr.apigateway.service.game.mapper;

import com.mat.jamr.externalapi.model.CreateIslandRequest;
import com.mat.jamr.externalapi.model.CreateIslandResponse;
import com.mat.jamr.externalapi.model.ListAllIslandsResponse;
import com.mat.jamr.externalapi.model.ReadIslandResponse;
import com.mat.jamr.externalapi.model.UpdateIslandRequest;
import com.mat.jamr.externalapi.model.UpdateIslandResponse;
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

    @Mapping(target = "islands", source = "islandsList")
    ListAllIslandsResponse toExternal(com.mat.jamr.gameservice.api.ListAllIslandsResponse resp);

    UpdateIslandResponse toExternal(com.mat.jamr.gameservice.api.UpdateIslandResponse resp);

    // Nested mappings
    @Mapping(target = "allowedPlayers", source = "allowedPlayersList")
    @Mapping(target = "farm", source = "farm")
    @Mapping(target = "barn", source = "barn")
    @Mapping(target = "mines", source = "mines")
    @Mapping(target = "fishingArea", source = "fishingArea")
    @Mapping(target = "bag", source = "bag")
    com.mat.jamr.externalapi.model.Island mapIsland(com.mat.jamr.gameservice.api.Island s);

    // Farm mapping
    @Mapping(target = "plots", source = "plotsList")
    @Mapping(target = "decorations", source = "decorationsList")
    @Mapping(target = "terrainCollectables", source = "terrainCollectablesList")
    com.mat.jamr.externalapi.model.Farm mapFarm(com.mat.jamr.gameservice.api.Farm farm);

    com.mat.jamr.externalapi.model.CropPlot mapCropPlot(com.mat.jamr.gameservice.api.CropPlot plot);

    // TerrainCollectable mapping
    com.mat.jamr.externalapi.model.TerrainCollectable mapTerrainCollectable(com.mat.jamr.gameservice.api.TerrainCollectable tc);

    @ValueMappings({
        @ValueMapping(source = "UNRECOGNIZED", target = MappingConstants.NULL)
    })
    com.mat.jamr.externalapi.model.TerrainCollectableType mapTerrainCollectableType(com.mat.jamr.gameservice.api.TerrainCollectableType type);

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

    // Bag mapping
    @Mapping(target = "items", source = "itemsList")
    com.mat.jamr.externalapi.model.Bag mapBag(com.mat.jamr.gameservice.api.Bag bag);

    com.mat.jamr.externalapi.model.BagItem mapBagItem(com.mat.jamr.gameservice.api.BagItem item);

    @Mapping(target = "content", source = "content", qualifiedByName = "byteStringToBytes")
    com.mat.jamr.externalapi.model.Asset mapAsset(com.mat.jamr.gameservice.api.Asset s);

    // Enum mapping to handle UNRECOGNIZED from protobuf enums
    @ValueMappings({
        @ValueMapping(source = "UNRECOGNIZED", target = MappingConstants.NULL)
    })
    com.mat.jamr.externalapi.model.AssetType mapAssetType(com.mat.jamr.gameservice.api.AssetType src);

    @ValueMappings({
        @ValueMapping(source = "UNRECOGNIZED", target = MappingConstants.NULL)
    })
    com.mat.jamr.externalapi.model.ActionType mapActionType(com.mat.jamr.gameservice.api.ActionType src);

    @Named("byteStringToBytes")
    default byte[] byteStringToBytes(ByteString byteString) {
        return byteString == null ? null : (byteString.isEmpty() ? null : byteString.toByteArray());
    }

    // Reverse mappings for update flow (external -> gRPC)
    @Mapping(target = "farm", source = "farm")
    @Mapping(target = "barn", source = "barn")
    @Mapping(target = "mines", source = "mines")
    @Mapping(target = "fishingArea", source = "fishingArea")
    @Mapping(target = "bag", source = "bag")
    @Mapping(target = "allowedPlayersList", ignore = true)
    com.mat.jamr.gameservice.api.Island mapIslandToGrpc(com.mat.jamr.externalapi.model.Island s);

    @Mapping(target = "plotsList", source = "plots")
    @Mapping(target = "decorationsList", source = "decorations")
    @Mapping(target = "terrainCollectablesList", source = "terrainCollectables")
    com.mat.jamr.gameservice.api.Farm mapFarmToGrpc(com.mat.jamr.externalapi.model.Farm farm);

    com.mat.jamr.gameservice.api.CropPlot mapCropPlotToGrpc(com.mat.jamr.externalapi.model.CropPlot plot);

    com.mat.jamr.gameservice.api.TerrainCollectable mapTerrainCollectableToGrpc(com.mat.jamr.externalapi.model.TerrainCollectable tc);

    com.mat.jamr.gameservice.api.TerrainCollectableType mapTerrainCollectableTypeToGrpc(com.mat.jamr.externalapi.model.TerrainCollectableType type);

    @Mapping(target = "pensList", source = "pens")
    @Mapping(target = "storageUnitsList", source = "storageUnits")
    com.mat.jamr.gameservice.api.Barn mapBarnToGrpc(com.mat.jamr.externalapi.model.Barn barn);

    @Mapping(target = "animalIdsList", ignore = true)
    com.mat.jamr.gameservice.api.AnimalPen mapAnimalPenToGrpc(com.mat.jamr.externalapi.model.AnimalPen pen);

    com.mat.jamr.gameservice.api.Storage mapStorageToGrpc(com.mat.jamr.externalapi.model.Storage storage);

    @Mapping(target = "levelsList", source = "levels")
    com.mat.jamr.gameservice.api.Mines mapMinesToGrpc(com.mat.jamr.externalapi.model.Mines mines);

    @Mapping(target = "tilesList", source = "tiles")
    @Mapping(target = "resourceIdsList", ignore = true)
    com.mat.jamr.gameservice.api.MineLevel mapMineLevelToGrpc(com.mat.jamr.externalapi.model.MineLevel level);

    com.mat.jamr.gameservice.api.MineTile mapMineTileToGrpc(com.mat.jamr.externalapi.model.MineTile tile);

    @Mapping(target = "spotsList", source = "spots")
    @Mapping(target = "availableFishIdsList", ignore = true)
    com.mat.jamr.gameservice.api.FishingArea mapFishingAreaToGrpc(com.mat.jamr.externalapi.model.FishingArea area);

    @Mapping(target = "specificFishIdsList", ignore = true)
    com.mat.jamr.gameservice.api.FishingSpot mapFishingSpotToGrpc(com.mat.jamr.externalapi.model.FishingSpot spot);

    com.mat.jamr.gameservice.api.Decoration mapDecorationToGrpc(com.mat.jamr.externalapi.model.Decoration decoration);

    @Mapping(target = "itemsList", source = "items")
    com.mat.jamr.gameservice.api.Bag mapBagToGrpc(com.mat.jamr.externalapi.model.Bag bag);

    com.mat.jamr.gameservice.api.BagItem mapBagItemToGrpc(com.mat.jamr.externalapi.model.BagItem item);

    @Mapping(target = "content", source = "content", qualifiedByName = "bytesToByteString")
    @Mapping(target = "onClickAction", ignore = true)
    com.mat.jamr.gameservice.api.Asset mapAssetToGrpc(com.mat.jamr.externalapi.model.Asset s);

    com.mat.jamr.gameservice.api.AssetType mapAssetTypeToGrpc(com.mat.jamr.externalapi.model.AssetType src);

    com.mat.jamr.gameservice.api.ActionType mapActionTypeToGrpc(com.mat.jamr.externalapi.model.ActionType src);

    @Named("bytesToByteString")
    default ByteString bytesToByteString(byte[] bytes) {
        return bytes == null ? ByteString.EMPTY : ByteString.copyFrom(bytes);
    }

    default com.mat.jamr.gameservice.api.UpdateIslandRequest toGrpc(UpdateIslandRequest req, String islandId) {
        if (req == null) {
            return null;
        }
        var islandBuilder = mapIslandToGrpc(req.getIsland()).toBuilder();

        // Handle allowedPlayers list
        if (req.getIsland().getAllowedPlayers() != null) {
            islandBuilder.clearAllowedPlayers();
            islandBuilder.addAllAllowedPlayers(req.getIsland().getAllowedPlayers());
        }

        return com.mat.jamr.gameservice.api.UpdateIslandRequest.newBuilder()
                .setIslandId(islandId)
                .setIsland(islandBuilder.build())
                .build();
    }

    // RewardInfo mapping for collect endpoint
    @Mapping(target = "resources", source = "resourcesList")
    com.mat.jamr.externalapi.model.RewardInfo mapRewardInfoToExternal(com.mat.jamr.gameservice.api.RewardInfo proto);

    com.mat.jamr.externalapi.model.ResourceReward mapResourceRewardToExternal(com.mat.jamr.gameservice.api.ResourceReward proto);
}
