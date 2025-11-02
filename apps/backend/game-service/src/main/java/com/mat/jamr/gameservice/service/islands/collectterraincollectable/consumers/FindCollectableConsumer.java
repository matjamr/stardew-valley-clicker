package com.mat.jamr.gameservice.service.islands.collectterraincollectable.consumers;

import com.mat.jamr.gameservice.context.CollectTerrainCollectableContext;

import java.util.function.Consumer;

public class FindCollectableConsumer implements Consumer<CollectTerrainCollectableContext> {

    @Override
    public void accept(CollectTerrainCollectableContext context) {
        var island = context.getIsland();
        var collectableId = context.getRequest().getCollectableId();

        if (island.getFarm() == null || island.getFarm().getTerrainCollectables() == null) {
            throw new IllegalStateException("Island has no terrain collectables");
        }

        var collectable = island.getFarm().getTerrainCollectables().stream()
                .filter(tc -> tc.getId().equals(collectableId))
                .findFirst()
                .orElseThrow(() -> new IllegalArgumentException("Terrain collectable not found: " + collectableId));

        if (collectable.getIsCollected() != null && collectable.getIsCollected()) {
            throw new IllegalStateException("Terrain collectable already collected: " + collectableId);
        }

        context.setCollectable(collectable);
    }
}
