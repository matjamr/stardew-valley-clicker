package com.mat.jamr.gameservice.service.islands.read;

import com.mat.jamr.gameservice.api.ReadIslandResponse;
import com.mat.jamr.gameservice.api.db.Island;
import com.mat.jamr.gameservice.context.ReadIslandContext;
import com.mat.jamr.gameservice.service.common.mapper.IslandMapper;
import com.mat.jamr.gameservice.service.islands.read.consumers.LoadIslandFromDbConsumer;
import com.mat.jamr.gameservice.service.islands.read.consumers.ReadIslandResponseMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

import java.util.function.Consumer;
import java.util.function.Function;

@Configuration
@RequiredArgsConstructor
public class ReadIslandBeanConfig {

    private final DynamoDbTable<Island> islandTable;
    private final IslandMapper islandMapper;

    @Bean
    public Function<ReadIslandContext, ReadIslandResponse> readIslandStrategyBasedFlow(
            Consumer<ReadIslandContext> loadIslandFromDb,
            Function<ReadIslandContext, ReadIslandResponse> readIslandResponseMapper
    ) {
        return context -> {
            loadIslandFromDb.accept(context);
            return readIslandResponseMapper.apply(context);
        };
    }

    @Bean
    public Consumer<ReadIslandContext> loadIslandFromDb() {
        return new LoadIslandFromDbConsumer<>(islandTable);
    }

    @Bean
    public Function<ReadIslandContext, ReadIslandResponse> readIslandResponseMapper() {
        return new ReadIslandResponseMapper(islandMapper);
    }
}
