package com.mat.jamr.gameservice.service.islands.listall.consumers;

import com.mat.jamr.gameservice.api.ListAllIslandsResponse;
import com.mat.jamr.gameservice.context.IslandsAware;
import com.mat.jamr.gameservice.service.common.mapper.IslandMapper;
import lombok.RequiredArgsConstructor;

import java.util.function.Function;
import java.util.stream.Collectors;

@RequiredArgsConstructor
public class ListAllIslandsResponseMapper<T extends IslandsAware> implements Function<T, ListAllIslandsResponse> {

    private final IslandMapper islandMapper;

    @Override
    public ListAllIslandsResponse apply(T context) {
        var islands = context.getIslands();

        if (islands == null || islands.isEmpty()) {
            return ListAllIslandsResponse.newBuilder().build();
        }

        var protoIslands = islands.stream()
                .map(islandMapper::toProto)
                .collect(Collectors.toList());

        return ListAllIslandsResponse.newBuilder()
                .addAllIslands(protoIslands)
                .build();
    }
}
