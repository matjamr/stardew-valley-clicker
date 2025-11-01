package com.mat.jamr.gameservice.service.islands.create.consumers;

import com.mat.jamr.gameservice.api.CreateIslandRequest;
import com.mat.jamr.gameservice.context.CreateIslandContext;
import lombok.RequiredArgsConstructor;

import java.util.function.Consumer;

@RequiredArgsConstructor
public class SetIslandMetadataConsumer implements Consumer<CreateIslandContext> {

    @Override
    public void accept(CreateIslandContext context) {
        var request = context.getRequest();
        var island = context.getIsland();

        if (island == null) {
            throw new IllegalStateException("Island must be created before setting metadata");
        }

        island.setName(request.getName());
        island.setOwnerId(request.getUserId());
    }
}
