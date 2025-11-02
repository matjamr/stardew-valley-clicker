package com.mat.jamr.gameservice.service.islands.listall;

import com.mat.jamr.gameservice.api.ListAllIslandsResponse;
import com.mat.jamr.gameservice.api.db.Island;
import com.mat.jamr.gameservice.context.ListAllIslandsContext;
import com.mat.jamr.gameservice.service.common.mapper.IslandMapper;
import com.mat.jamr.gameservice.service.islands.listall.consumers.ListAllIslandsResponseMapper;
import com.mat.jamr.gameservice.service.islands.listall.consumers.LoadIslandsByOwnerIdConsumer;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

import java.util.function.Consumer;
import java.util.function.Function;

@Configuration
@RequiredArgsConstructor
public class ListAllIslandsBeanConfig {

    private final DynamoDbTable<Island> islandTable;
    private final IslandMapper islandMapper;

    @Bean
    public Function<ListAllIslandsContext, ListAllIslandsResponse> listAllIslandsStrategyBasedFlow(
            Consumer<ListAllIslandsContext> loadIslandsByOwnerId,
            Function<ListAllIslandsContext, ListAllIslandsResponse> listAllIslandsResponseMapper
    ) {
        return context -> {
            loadIslandsByOwnerId.accept(context);
            return listAllIslandsResponseMapper.apply(context);
        };
    }

    @Bean
    public Consumer<ListAllIslandsContext> loadIslandsByOwnerId() {
        return new LoadIslandsByOwnerIdConsumer<>(islandTable);
    }

    @Bean
    public Function<ListAllIslandsContext, ListAllIslandsResponse> listAllIslandsResponseMapper() {
        return new ListAllIslandsResponseMapper<>(islandMapper);
    }
}
