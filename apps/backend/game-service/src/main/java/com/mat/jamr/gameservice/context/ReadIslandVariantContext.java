package com.mat.jamr.gameservice.context;

import com.mat.jamr.gameservice.api.ReadIslandVariantRequest;
import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class ReadIslandVariantContext implements IslandVariantAware, IslandVariantIdAware {
    private ReadIslandVariantRequest request;
    private com.mat.jamr.gameservice.api.IslandVariant response;
    private com.mat.jamr.gameservice.api.db.IslandVariant islandVariant;

    @Override
    public String getIslandVariantId() {
        return request.getId();
    }

    @Override
    public com.mat.jamr.gameservice.api.db.IslandVariant getIslandVariant() {
        return islandVariant;
    }

    @Override
    public void setIslandVariant(com.mat.jamr.gameservice.api.db.IslandVariant islandVariant) {
        this.islandVariant = islandVariant;
    }
}
