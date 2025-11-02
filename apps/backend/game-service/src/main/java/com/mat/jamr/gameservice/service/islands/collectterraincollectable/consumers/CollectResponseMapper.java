package com.mat.jamr.gameservice.service.islands.collectterraincollectable.consumers;

import com.mat.jamr.gameservice.api.CollectTerrainCollectableResponse;
import com.mat.jamr.gameservice.api.db.RewardInfo;
import com.mat.jamr.gameservice.context.CollectTerrainCollectableContext;
import com.mat.jamr.gameservice.service.common.mapper.AssetMapper;
import lombok.RequiredArgsConstructor;

import java.util.function.Function;

@RequiredArgsConstructor
public class CollectResponseMapper implements Function<CollectTerrainCollectableContext, CollectTerrainCollectableResponse> {

    private final AssetMapper assetMapper;

    @Override
    public CollectTerrainCollectableResponse apply(CollectTerrainCollectableContext context) {
        var rewardInfo = context.getRewards();

        var builder = CollectTerrainCollectableResponse.newBuilder()
                .setSuccess(true)
                .setMessage("Terrain collectable collected successfully");

        if (rewardInfo != null) {
            builder.setRewards(assetMapper.map(rewardInfo));
        }

        return builder.build();
    }
}
