package com.mat.jamr.gameservice.service.islands.collectterraincollectable.consumers;

import com.mat.jamr.gameservice.api.db.Farm;
import com.mat.jamr.gameservice.api.db.TerrainCollectable;
import com.mat.jamr.gameservice.context.CollectTerrainCollectableContext;
import lombok.extern.slf4j.Slf4j;

import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;
import java.util.stream.Collectors;

@Slf4j
public class MarkCollectableCollectedConsumer implements Consumer<CollectTerrainCollectableContext> {

    @Override
    public void accept(CollectTerrainCollectableContext context) {
        var island = context.getIsland();
        var collectableId = context.getCollectable().getId();
        var farm = island.getFarm();

        log.info("Removing terrain collectable {} from island {}", collectableId, island.getId());
        log.info("Current collectables count: {}", farm.getTerrainCollectables() != null ? farm.getTerrainCollectables().size() : 0);

        // Remove the collected collectable from the list
        List<TerrainCollectable> updatedCollectables = farm.getTerrainCollectables().stream()
                .filter(tc -> !tc.getId().equals(collectableId))
                .collect(Collectors.toList());

        log.info("Updated collectables count after removal: {}", updatedCollectables.size());

        // Update farm with remaining collectables
        var updatedFarm = new Farm();
        updatedFarm.setId(farm.getId());
        updatedFarm.setName(farm.getName());
        updatedFarm.setBlockSize(farm.getBlockSize());
        updatedFarm.setSizeX(farm.getSizeX());
        updatedFarm.setSizeY(farm.getSizeY());
        updatedFarm.setPlots(farm.getPlots());
        updatedFarm.setDecorations(farm.getDecorations());
        updatedFarm.setTerrainCollectables(updatedCollectables);

        island.setFarm(updatedFarm);
        log.info("Farm updated on island, new collectables count: {}", island.getFarm().getTerrainCollectables().size());
    }
}
