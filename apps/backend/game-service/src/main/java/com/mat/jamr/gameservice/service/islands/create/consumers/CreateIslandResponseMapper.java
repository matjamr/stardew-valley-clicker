package com.mat.jamr.gameservice.service.islands.create.consumers;

import com.mat.jamr.gameservice.api.CreateIslandResponse;
import com.mat.jamr.gameservice.context.CreateIslandContext;
import org.springframework.stereotype.Component;

import java.util.function.Consumer;

@Component("createIslandResponseMapperImpl")
public class CreateIslandResponseMapper implements Consumer<CreateIslandContext> {

    @Override
    public void accept(CreateIslandContext context) {
        var island = context.getIsland();
        if (island == null) {
            throw new IllegalStateException("Island must be created before mapping response");
        }

        var response = CreateIslandResponse.newBuilder()
                .setId(island.getId())
                .build();

        context.setResponse(response);
    }
}
