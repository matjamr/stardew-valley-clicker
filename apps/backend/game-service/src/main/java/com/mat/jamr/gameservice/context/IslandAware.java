package com.mat.jamr.gameservice.context;

import com.mat.jamr.gameservice.api.db.Island;

public interface IslandAware {
    Island getIsland();
    void setIsland(Island island);
}
