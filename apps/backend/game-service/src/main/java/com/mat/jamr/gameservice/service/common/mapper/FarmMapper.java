package com.mat.jamr.gameservice.service.common.mapper;

import org.mapstruct.*;

@Mapper(
    componentModel = "spring",
    uses = { AssetMapper.class, ProtobufStringMapper.class, TerrainCollectableMapper.class },
    collectionMappingStrategy = CollectionMappingStrategy.ADDER_PREFERRED,
    nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE,
        nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS
)
public interface FarmMapper {
    // Farm
    @Mapping(target = "plotsList", source = "plots")
    @Mapping(target = "decorationsList", source = "decorations")
    @Mapping(target = "terrainCollectablesList", source = "terrainCollectables")
    com.mat.jamr.gameservice.api.Farm map(com.mat.jamr.gameservice.api.db.Farm s);

    @Mapping(target = "plots", source = "plotsList")
    @Mapping(target = "decorations", source = "decorationsList")
    @Mapping(target = "terrainCollectables", source = "terrainCollectablesList")
    com.mat.jamr.gameservice.api.db.Farm map(com.mat.jamr.gameservice.api.Farm s);

    // CropPlot
    com.mat.jamr.gameservice.api.CropPlot map(com.mat.jamr.gameservice.api.db.CropPlot s);
    com.mat.jamr.gameservice.api.db.CropPlot map(com.mat.jamr.gameservice.api.CropPlot s);

    // Decoration
    com.mat.jamr.gameservice.api.Decoration map(com.mat.jamr.gameservice.api.db.Decoration s);
    com.mat.jamr.gameservice.api.db.Decoration map(com.mat.jamr.gameservice.api.Decoration s);

    // TerrainCollectable
    @Mapping(target = "type", source = "type", qualifiedByName = "typeToProto")
    @Mapping(target = "id", source = "id", qualifiedByName = "toProto")
    @Mapping(target = "collectedAt", source = "collectedAt", qualifiedByName = "toProto")
    com.mat.jamr.gameservice.api.TerrainCollectable map(com.mat.jamr.gameservice.api.db.TerrainCollectable s);

    @Mapping(target = "type", source = "type", qualifiedByName = "typeFromProto")
    @Mapping(target = "id", source = "id", qualifiedByName = "fromProto")
    @Mapping(target = "collectedAt", source = "collectedAt", qualifiedByName = "fromProto")
    com.mat.jamr.gameservice.api.db.TerrainCollectable map(com.mat.jamr.gameservice.api.TerrainCollectable s);
}
