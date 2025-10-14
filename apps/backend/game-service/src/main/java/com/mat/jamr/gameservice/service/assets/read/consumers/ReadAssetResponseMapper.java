package com.mat.jamr.gameservice.service.assets.read.consumers;

import com.mat.jamr.gameservice.api.ReadAssetResponse;
import com.mat.jamr.gameservice.api.db.Asset;
import com.mat.jamr.gameservice.context.ReadAssetContext;
import com.mat.jamr.gameservice.service.common.mapper.AssetMapper;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.util.function.Consumer;

@Mapper(componentModel = "spring", uses = {AssetMapper.class})
public abstract class ReadAssetResponseMapper implements Consumer<ReadAssetContext> {

    @Mapping(source = ".", target = "asset")
    protected abstract ReadAssetResponse map(Asset asset);

    @Override
    public void accept(ReadAssetContext context) {
        context.setResponse(map(context.getAsset()));
    }
}
