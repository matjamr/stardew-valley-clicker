package com.mat.jamr.gameservice.service.common.mapper;

import org.mapstruct.CollectionMappingStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring", uses = { AssetMapper.class, ProtobufStringMapper.class }, collectionMappingStrategy = CollectionMappingStrategy.ADDER_PREFERRED)
public interface FarmMapper {
    // Farm
    @Mapping(target = "plotsList", source = "plots")
    @Mapping(target = "decorationsList", source = "decorations")
    com.mat.jamr.gameservice.api.Farm map(com.mat.jamr.gameservice.api.db.Farm s);

    @Mapping(target = "plots", source = "plotsList")
    @Mapping(target = "decorations", source = "decorationsList")
    com.mat.jamr.gameservice.api.db.Farm map(com.mat.jamr.gameservice.api.Farm s);

    // CropPlot
    com.mat.jamr.gameservice.api.CropPlot map(com.mat.jamr.gameservice.api.db.CropPlot s);
    com.mat.jamr.gameservice.api.db.CropPlot map(com.mat.jamr.gameservice.api.CropPlot s);

    // Decoration
    com.mat.jamr.gameservice.api.Decoration map(com.mat.jamr.gameservice.api.db.Decoration s);
    com.mat.jamr.gameservice.api.db.Decoration map(com.mat.jamr.gameservice.api.Decoration s);
}
