package com.mat.jamr.gameservice.service.islands.collectterraincollectable.consumers;

import com.mat.jamr.gameservice.api.db.Island;
import com.mat.jamr.gameservice.context.CollectTerrainCollectableContext;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

import java.util.function.Consumer;

@Slf4j
@RequiredArgsConstructor
public class SaveIslandAfterCollectConsumer implements Consumer<CollectTerrainCollectableContext> {

    private final DynamoDbTable<Island> islandTable;

    @Override
    public void accept(CollectTerrainCollectableContext context) {
        var island = context.getIsland();
        log.info("Saving island {} to DynamoDB", island.getId());
        log.info("Island farm has {} terrain collectables before save",
            island.getFarm() != null && island.getFarm().getTerrainCollectables() != null ?
            island.getFarm().getTerrainCollectables().size() : 0);

        islandTable.putItem(island);

        log.info("Island saved successfully to DynamoDB");
    }
}
