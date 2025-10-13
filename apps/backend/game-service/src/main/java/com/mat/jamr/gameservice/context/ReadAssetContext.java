package com.mat.jamr.gameservice.context;

import com.mat.jamr.gameservice.api.CreateAssetRequest;
import com.mat.jamr.gameservice.api.CreateAssetResponse;
import com.mat.jamr.gameservice.api.ReadAssetRequest;
import com.mat.jamr.gameservice.api.ReadAssetResponse;
import com.mat.jamr.gameservice.api.db.Asset;
import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class ReadAssetContext implements AssetAware, AssetIdAware {
    private ReadAssetRequest request;
    private ReadAssetResponse response;
    private Asset asset;

    @Override
    public String getAssetId() {
        return request.getId();
    }


    public ReadAssetRequest getRequest() {
        return request;
    }

    public void setRequest(ReadAssetRequest request) {
        this.request = request;
    }

    public ReadAssetContext request(ReadAssetRequest request) {
        this.request = request;
        return this;
    }

    public ReadAssetResponse getResponse() {
        return response;
    }

    public void setResponse(ReadAssetResponse response) {
        this.response = response;
    }

    public Asset getAsset() {
        return asset;
    }

    public void setAsset(Asset asset) {
        this.asset = asset;
    }
}
