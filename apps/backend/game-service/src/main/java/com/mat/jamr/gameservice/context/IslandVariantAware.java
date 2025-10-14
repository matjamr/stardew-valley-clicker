package com.mat.jamr.gameservice.context;

import com.mat.jamr.gameservice.api.db.IslandVariant;

public interface IslandVariantAware {
    IslandVariant getIslandVariant();
    void setIslandVariant(IslandVariant islandVariant);
}
