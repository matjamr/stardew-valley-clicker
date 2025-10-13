package com.mat.jamr.gameservice.context;

public interface AssetIdAware {
    String getAssetId();
    default void setAssetId(String assetId) {};
}
