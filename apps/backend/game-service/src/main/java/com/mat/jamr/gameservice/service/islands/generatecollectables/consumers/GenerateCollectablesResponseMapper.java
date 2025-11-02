package com.mat.jamr.gameservice.service.islands.generatecollectables.consumers;

import com.mat.jamr.gameservice.api.GenerateCollectablesResponse;
import com.mat.jamr.gameservice.context.GenerateCollectablesContext;

import java.util.function.Function;

public class GenerateCollectablesResponseMapper implements Function<GenerateCollectablesContext, GenerateCollectablesResponse> {

    @Override
    public GenerateCollectablesResponse apply(GenerateCollectablesContext context) {
        return GenerateCollectablesResponse.newBuilder()
                .setSuccess(true)
                .setMessage("Successfully generated " + context.getGeneratedCount() + " terrain collectables")
                .setCount(context.getGeneratedCount())
                .build();
    }
}
