package com.mat.jamr.gameservice.service.islandvariant.read.consumers;

import com.mat.jamr.gameservice.context.ReadIslandVariantContext;
import com.mat.jamr.gameservice.service.common.mapper.AssetMapper;
import com.mat.jamr.gameservice.service.common.mapper.IslandVariantMapper;
import com.mat.jamr.gameservice.service.common.mapper.TerrainMapper;
import com.mat.jamr.gameservice.service.common.mapper.TerrainTileMapper;
import lombok.RequiredArgsConstructor;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.springframework.stereotype.Component;

import java.util.function.Consumer;

@Component("readIslandVariantResponseMapperImpl")
@RequiredArgsConstructor
public class ReadIslandVariantResponseMapper implements Consumer<ReadIslandVariantContext> {

    private final IslandVariantMapper islandVariantMapper;

    @Override
    public void accept(ReadIslandVariantContext context) {
        context.setResponse(islandVariantMapper.map(context.getIslandVariant()));
    }
}
