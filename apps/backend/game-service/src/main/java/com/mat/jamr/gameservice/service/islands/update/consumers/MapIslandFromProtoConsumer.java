package com.mat.jamr.gameservice.service.islands.update.consumers;

import com.mat.jamr.gameservice.context.UpdateIslandContext;
import com.mat.jamr.gameservice.service.common.mapper.IslandMapper;
import lombok.RequiredArgsConstructor;

import java.util.function.Consumer;

@RequiredArgsConstructor
public class MapIslandFromProtoConsumer implements Consumer<UpdateIslandContext> {

    private final IslandMapper islandMapper;

    @Override
    public void accept(UpdateIslandContext context) {
        var protoIsland = context.getRequest().getIsland();
        var dbIsland = islandMapper.toDb(protoIsland);

        // Ensure the ID from the request is used
        dbIsland.setId(context.getRequest().getIslandId());

        context.setIsland(dbIsland);
    }
}
