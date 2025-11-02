package com.mat.jamr.gameservice.service.common.mapper;

import org.mapstruct.CollectionMappingStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.NullValueCheckStrategy;
import org.mapstruct.NullValuePropertyMappingStrategy;

@Mapper(
    componentModel = "spring",
    uses = {ProtobufStringMapper.class},
    collectionMappingStrategy = CollectionMappingStrategy.ADDER_PREFERRED,
    nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE,
    nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS
)
public interface BagMapper {

    @Mapping(target = "itemsList", source = "items")
    com.mat.jamr.gameservice.api.Bag toProto(com.mat.jamr.gameservice.api.db.Bag bag);

    @Mapping(target = "items", source = "itemsList")
    com.mat.jamr.gameservice.api.db.Bag toDb(com.mat.jamr.gameservice.api.Bag bag);

    @Mapping(target = "itemId", source = "itemId", qualifiedByName = "toProto")
    @Mapping(target = "name", source = "name", qualifiedByName = "toProto")
    @Mapping(target = "iconUrl", source = "iconUrl", qualifiedByName = "toProto")
    com.mat.jamr.gameservice.api.BagItem bagItemToProto(com.mat.jamr.gameservice.api.db.BagItem item);

    @Mapping(target = "itemId", source = "itemId", qualifiedByName = "fromProto")
    @Mapping(target = "name", source = "name", qualifiedByName = "fromProto")
    @Mapping(target = "iconUrl", source = "iconUrl", qualifiedByName = "fromProto")
    com.mat.jamr.gameservice.api.db.BagItem bagItemToDb(com.mat.jamr.gameservice.api.BagItem item);
}
