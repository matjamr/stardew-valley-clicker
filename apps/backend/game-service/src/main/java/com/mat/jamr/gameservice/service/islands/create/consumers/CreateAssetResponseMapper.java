package com.mat.jamr.gameservice.service.islands.create.consumers;

import com.mat.jamr.gameservice.api.CreateAssetResponse;
import com.mat.jamr.gameservice.api.db.Asset;
import com.mat.jamr.gameservice.context.CreateAssetContext;
import org.mapstruct.Mapper;

import java.util.function.Consumer;

@Mapper(componentModel = "spring")
public abstract class CreateAssetResponseMapper implements Consumer<CreateAssetContext> {

    protected abstract com.mat.jamr.gameservice.api.Asset map(Asset asset);

    @Override
    public void accept(CreateAssetContext createAssetContext) {
        createAssetContext.setCreateAssetResponse(CreateAssetResponse.newBuilder().setAsset(map(createAssetContext.getAsset())).build());
    }
}
