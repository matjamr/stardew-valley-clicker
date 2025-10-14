package com.mat.jamr.gameservice.service.assets.create.consumers;

import com.mat.jamr.gameservice.api.CreateAssetRequest;
import com.mat.jamr.gameservice.api.db.Asset;
import com.mat.jamr.gameservice.context.CreateAssetContext;
import com.mat.jamr.gameservice.service.common.mapper.ProtobufStringMapper;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.util.UUID;
import java.util.function.Consumer;

@Mapper(componentModel = "spring", uses = {ProtobufStringMapper.class})
public abstract class CreateAssetRequestMapper implements Consumer<CreateAssetContext> {

    @Mapping(target = "name", source = "name", qualifiedByName = "fromProto")
    @Mapping(target = "description", source = "description", qualifiedByName = "fromProto")
    protected abstract Asset map(CreateAssetRequest request);

    @Override
    public void accept(CreateAssetContext createAssetContext) {
        var asset = map(createAssetContext.getCreateAssetRequest());
        asset.setId(UUID.randomUUID().toString());

        createAssetContext.setAsset(asset);
    }
}
