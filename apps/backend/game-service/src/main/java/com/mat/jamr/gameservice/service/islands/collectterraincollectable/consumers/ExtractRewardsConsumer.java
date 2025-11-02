package com.mat.jamr.gameservice.service.islands.collectterraincollectable.consumers;

import com.mat.jamr.gameservice.context.CollectTerrainCollectableContext;

import java.util.function.Consumer;

public class ExtractRewardsConsumer implements Consumer<CollectTerrainCollectableContext> {

    @Override
    public void accept(CollectTerrainCollectableContext context) {
        var collectable = context.getCollectable();

        if (collectable.getAsset() == null || collectable.getAsset().getOnClickAction() == null) {
            throw new IllegalStateException("Terrain collectable has no rewards configured");
        }

        var rewardInfo = collectable.getAsset().getOnClickAction().getRewardInfo();
        if (rewardInfo == null) {
            throw new IllegalStateException("Terrain collectable has no reward info");
        }

        context.setRewards(rewardInfo);
    }
}
