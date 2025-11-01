package com.mat.jamr.gameservice.context;

import com.mat.jamr.gameservice.api.CreateIslandRequest;
import com.mat.jamr.gameservice.api.CreateIslandResponse;
import com.mat.jamr.gameservice.api.db.Island;
import com.mat.jamr.gameservice.api.db.IslandVariant;
import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true, fluent = false)
public class CreateIslandContext implements IslandVariantIdAware, IslandVariantAware, IslandAware {
    private CreateIslandRequest request;
    private CreateIslandResponse response;
    private IslandVariant islandVariant;
    private Island island;

    @Override
    public String getIslandVariantId() {
        return request != null ? request.getVariantId() : null;
    }

    @Override
    public void setIslandVariant(IslandVariant variant) {
        this.islandVariant = variant;
    }

    @Override
    public void setIsland(Island island) {
        this.island = island;
    }
}
