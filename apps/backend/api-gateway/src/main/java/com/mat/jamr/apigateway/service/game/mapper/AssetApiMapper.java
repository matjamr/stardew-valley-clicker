package com.mat.jamr.apigateway.service.game.mapper;

import com.google.protobuf.ByteString;
import com.mat.jamr.externalapi.model.CreateAssetRequest;
import com.mat.jamr.externalapi.model.CreateAssetResponse;
import com.mat.jamr.externalapi.model.ReadAssetResponse;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;
import org.mapstruct.ValueMapping;
import org.mapstruct.ValueMappings;
import org.mapstruct.MappingConstants;

@Mapper(componentModel = "spring", uses = { ProtoStringMapper.class })
public interface AssetApiMapper {

    @Mapping(target = "name", source = "name", qualifiedByName = "toProto")
    @Mapping(target = "description", source = "description", qualifiedByName = "toProto")
    @Mapping(target = "content", source = "content", qualifiedByName = "bytesToByteString")
    com.mat.jamr.gameservice.api.CreateAssetRequest toGrpc(CreateAssetRequest req);

    @Mapping(target = "asset", source = "asset")
    CreateAssetResponse toExternal(com.mat.jamr.gameservice.api.CreateAssetResponse resp);

    @Mapping(target = "asset", source = "asset")
    ReadAssetResponse toExternal(com.mat.jamr.gameservice.api.ReadAssetResponse resp);

    @Mapping(target = "content", source = "content", qualifiedByName = "byteStringToBytes")
    com.mat.jamr.externalapi.model.Asset map(com.mat.jamr.gameservice.api.Asset src);

    // Enum mapping to handle UNRECOGNIZED from protobuf enums
    @ValueMappings({
        @ValueMapping(source = "UNRECOGNIZED", target = MappingConstants.NULL)
    })
    com.mat.jamr.externalapi.model.AssetType mapAssetType(com.mat.jamr.gameservice.api.AssetType src);

    @Named("bytesToByteString")
    default ByteString bytesToByteString(byte[] bytes) {
        return (bytes == null || bytes.length == 0) ? ByteString.EMPTY : ByteString.copyFrom(bytes);
    }

    @Named("byteStringToBytes")
    default byte[] byteStringToBytes(ByteString byteString) {
        return byteString == null ? null : (byteString.isEmpty() ? null : byteString.toByteArray());
    }
}
