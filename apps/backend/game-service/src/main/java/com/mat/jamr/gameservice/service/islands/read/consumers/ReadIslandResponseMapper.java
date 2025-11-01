package com.mat.jamr.gameservice.service.islands.read.consumers;

import com.mat.jamr.gameservice.api.ReadIslandResponse;
import com.mat.jamr.gameservice.context.IslandAware;
import com.mat.jamr.gameservice.context.ReadIslandContext;
import com.mat.jamr.gameservice.service.common.mapper.IslandMapper;
import lombok.RequiredArgsConstructor;

import java.util.function.Function;

@RequiredArgsConstructor
public class ReadIslandResponseMapper implements Function<ReadIslandContext, ReadIslandResponse> {

    private final IslandMapper islandMapper;

    @Override
    public ReadIslandResponse apply(ReadIslandContext context) {
        var island = context.getIsland();
        if (island == null) {
            throw new IllegalStateException("Island must be loaded before mapping response");
        }

        return ReadIslandResponse.newBuilder()
                .setIsland(islandMapper.toProto(island))
                .build();
    }
}
