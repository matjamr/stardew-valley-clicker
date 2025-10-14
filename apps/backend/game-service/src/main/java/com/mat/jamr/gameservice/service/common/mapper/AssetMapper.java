package com.mat.jamr.gameservice.service.common.mapper;

import com.mat.jamr.gameservice.api.db.Asset;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring", uses = {ProtobufStringMapper.class})
public interface AssetMapper {

    // DB -> Proto: ensure null/blank strings become "" to satisfy protobuf setters
    @Mapping(target = "id", source = "id", qualifiedByName = "toProto")
    @Mapping(target = "name", source = "name", qualifiedByName = "toProto")
    @Mapping(target = "description", source = "description", qualifiedByName = "toProto")
    @Mapping(target = "url", source = "url", qualifiedByName = "toProto")
    com.mat.jamr.gameservice.api.Asset map(Asset asset);

    // Proto -> DB: ignore empty strings by converting them to null
    @Mapping(target = "id", source = "id", qualifiedByName = "fromProto")
    @Mapping(target = "name", source = "name", qualifiedByName = "fromProto")
    @Mapping(target = "description", source = "description", qualifiedByName = "fromProto")
    @Mapping(target = "url", source = "url", qualifiedByName = "fromProto")
    Asset map(com.mat.jamr.gameservice.api.Asset asset);
}
