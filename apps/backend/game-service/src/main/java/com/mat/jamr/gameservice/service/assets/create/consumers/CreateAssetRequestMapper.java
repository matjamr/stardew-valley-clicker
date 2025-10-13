package com.mat.jamr.gameservice.service.assets.create.consumers;

import com.mat.jamr.gameservice.api.CreateAssetRequest;
import com.mat.jamr.gameservice.api.db.Asset;
import com.mat.jamr.gameservice.context.CreateAssetContext;
import org.mapstruct.Mapper;

import java.util.UUID;
import java.util.function.Consumer;

@Mapper(componentModel = "spring")
public abstract class CreateAssetRequestMapper implements Consumer<CreateAssetContext> {

    protected abstract Asset map(CreateAssetRequest request);

    @Override
    public void accept(CreateAssetContext createAssetContext) {
        var asset = map(createAssetContext.getCreateAssetRequest());
        asset.setId(UUID.randomUUID().toString());

        createAssetContext.setAsset(asset);
    }
}
