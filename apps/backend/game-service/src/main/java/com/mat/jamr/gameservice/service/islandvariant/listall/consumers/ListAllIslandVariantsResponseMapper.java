package com.mat.jamr.gameservice.service.islandvariant.listall.consumers;

import com.mat.jamr.gameservice.api.ListAllIslandVariantsResponse;
import com.mat.jamr.gameservice.context.ListAllIslandVariantsContext;
import com.mat.jamr.gameservice.service.common.mapper.IslandVariantMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.function.Consumer;
import java.util.stream.Collectors;

@Component("listAllIslandVariantsResponseMapperImpl")
@RequiredArgsConstructor
public class ListAllIslandVariantsResponseMapper implements Consumer<ListAllIslandVariantsContext> {

    private final IslandVariantMapper islandVariantMapper;

    @Override
    public void accept(ListAllIslandVariantsContext context) {
        var variants = context.getIslandVariants().stream()
                .map(islandVariantMapper::map)
                .collect(Collectors.toList());

        context.setResponse(
                ListAllIslandVariantsResponse.newBuilder()
                        .addAllVariants(variants)
                        .build()
        );
    }
}
