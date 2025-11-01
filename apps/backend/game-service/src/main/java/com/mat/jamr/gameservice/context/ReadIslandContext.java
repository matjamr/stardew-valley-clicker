package com.mat.jamr.gameservice.context;

import com.mat.jamr.gameservice.api.ReadIslandRequest;
import com.mat.jamr.gameservice.api.ReadIslandResponse;
import com.mat.jamr.gameservice.api.db.Island;
import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true, fluent = false)
public class ReadIslandContext implements IslandIdAware, IslandAware {
    private ReadIslandRequest request;
    private ReadIslandResponse response;
    private Island island;

    @Override
    public String getIslandId() {
        return request != null ? request.getIslandId() : null;
    }

    @Override
    public Island getIsland() {
        return island;
    }

    @Override
    public void setIsland(Island island) {
        this.island = island;
    }
}
