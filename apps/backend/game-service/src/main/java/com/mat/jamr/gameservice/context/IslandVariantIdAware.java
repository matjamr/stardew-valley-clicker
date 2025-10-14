package com.mat.jamr.gameservice.context;

public interface IslandVariantIdAware {
    String getIslandVariantId();
    default void setIslandVariantId(String id) {}
}
