package com.mat.jamr.gameservice.context;

import com.mat.jamr.gameservice.api.CollectTerrainCollectableRequest;
import com.mat.jamr.gameservice.api.CollectTerrainCollectableResponse;
import com.mat.jamr.gameservice.api.db.Island;
import com.mat.jamr.gameservice.api.db.TerrainCollectable;
import com.mat.jamr.gameservice.api.db.RewardInfo;
import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true, fluent = false)
public class CollectTerrainCollectableContext {
    private CollectTerrainCollectableRequest request;
    private CollectTerrainCollectableResponse response;
    private Island island;
    private TerrainCollectable collectable;
    private RewardInfo rewards;
}
