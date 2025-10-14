package com.mat.jamr.gameservice.service.assets.create.consumers;

import com.mat.jamr.gameservice.api.CreateAssetResponse;
import com.mat.jamr.gameservice.api.db.Asset;
import com.mat.jamr.gameservice.context.CreateAssetContext;
import com.mat.jamr.gameservice.service.common.mapper.AssetMapper;
import org.mapstruct.Mapper;

import java.util.function.Consumer;

@Mapper(componentModel = "spring", uses = {AssetMapper.class})
public abstract class CreateAssetResponseMapper implements Consumer<CreateAssetContext> {

    protected abstract com.mat.jamr.gameservice.api.Asset map(Asset asset);

    @Override
    public void accept(CreateAssetContext createAssetContext) {
        createAssetContext.setCreateAssetResponse(CreateAssetResponse.newBuilder().setAsset(map(createAssetContext.getAsset())).build());
    }
}
