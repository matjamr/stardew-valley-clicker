package com.mat.jamr.gameservice.context;

import com.mat.jamr.gameservice.api.db.Asset;

public interface AssetAware {
    Asset getAsset();
    void setAsset(Asset asset);
}
