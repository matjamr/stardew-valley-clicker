package com.mat.jamr.gameservice.context;

import com.mat.jamr.gameservice.api.GenerateCollectablesRequest;
import com.mat.jamr.gameservice.api.GenerateCollectablesResponse;
import com.mat.jamr.gameservice.api.db.Island;
import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true, fluent = false)
public class GenerateCollectablesContext {
    private GenerateCollectablesRequest request;
    private GenerateCollectablesResponse response;
    private Island island;
    private int generatedCount;
}
