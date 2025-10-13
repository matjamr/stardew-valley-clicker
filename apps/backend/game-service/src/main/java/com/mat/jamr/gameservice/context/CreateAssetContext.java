package com.mat.jamr.gameservice.context;

import com.mat.jamr.gameservice.api.CreateAssetRequest;
import com.mat.jamr.gameservice.api.CreateAssetResponse;
import com.mat.jamr.gameservice.api.db.Asset;
import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class CreateAssetContext implements AssetAware {
    private CreateAssetRequest createAssetRequest;
    private CreateAssetResponse createAssetResponse;

    private Asset asset;

    public void setAsset(Asset asset) {
        this.asset = asset;
    }
}
