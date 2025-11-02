package com.mat.jamr.gameservice.context;

import com.mat.jamr.gameservice.api.UpdateIslandRequest;
import com.mat.jamr.gameservice.api.UpdateIslandResponse;
import com.mat.jamr.gameservice.api.db.Island;
import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true, fluent = false)
public class UpdateIslandContext {
    private UpdateIslandRequest request;
    private UpdateIslandResponse response;
    private Island island;
}
