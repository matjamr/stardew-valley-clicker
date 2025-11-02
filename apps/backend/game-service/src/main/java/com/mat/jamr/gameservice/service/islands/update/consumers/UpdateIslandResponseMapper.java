package com.mat.jamr.gameservice.service.islands.update.consumers;

import com.mat.jamr.gameservice.api.UpdateIslandResponse;
import com.mat.jamr.gameservice.context.UpdateIslandContext;

import java.util.function.Function;

public class UpdateIslandResponseMapper implements Function<UpdateIslandContext, UpdateIslandResponse> {

    @Override
    public UpdateIslandResponse apply(UpdateIslandContext context) {
        return UpdateIslandResponse.newBuilder()
                .setSuccess(true)
                .setMessage("Island updated successfully")
                .build();
    }
}
