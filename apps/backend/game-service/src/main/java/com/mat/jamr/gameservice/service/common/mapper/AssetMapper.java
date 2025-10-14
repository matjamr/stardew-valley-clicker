package com.mat.jamr.gameservice.service.common.mapper;

import com.mat.jamr.gameservice.api.db.Asset;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring", uses = {ProtobufStringMapper.class})
public interface AssetMapper {

    com.mat.jamr.gameservice.api.Asset map(Asset asset);
    Asset map(com.mat.jamr.gameservice.api.Asset asset);
}
