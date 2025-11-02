package com.mat.jamr.gameservice.service.islands.update;

import com.mat.jamr.gameservice.api.UpdateIslandResponse;
import com.mat.jamr.gameservice.api.db.Island;
import com.mat.jamr.gameservice.context.UpdateIslandContext;
import com.mat.jamr.gameservice.service.common.mapper.IslandMapper;
import com.mat.jamr.gameservice.service.islands.update.consumers.MapIslandFromProtoConsumer;
import com.mat.jamr.gameservice.service.islands.update.consumers.SaveIslandToDbConsumer;
import com.mat.jamr.gameservice.service.islands.update.consumers.UpdateIslandResponseMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

import java.util.function.Consumer;
import java.util.function.Function;

@Configuration
@RequiredArgsConstructor
public class UpdateIslandBeanConfig {

    private final DynamoDbTable<Island> islandTable;
    private final IslandMapper islandMapper;

    @Bean
    public Function<UpdateIslandContext, UpdateIslandResponse> updateIslandStrategyBasedFlow(
            Consumer<UpdateIslandContext> mapIslandFromProto,
            Consumer<UpdateIslandContext> saveIslandToDb,
            Function<UpdateIslandContext, UpdateIslandResponse> updateIslandResponseMapper
    ) {
        return context -> {
            mapIslandFromProto.accept(context);
            saveIslandToDb.accept(context);
            return updateIslandResponseMapper.apply(context);
        };
    }

    @Bean
    public Consumer<UpdateIslandContext> mapIslandFromProto() {
        return new MapIslandFromProtoConsumer(islandMapper);
    }

    @Bean
    public Consumer<UpdateIslandContext> saveIslandToDb() {
        return new SaveIslandToDbConsumer(islandTable);
    }

    @Bean
    public Function<UpdateIslandContext, UpdateIslandResponse> updateIslandResponseMapper() {
        return new UpdateIslandResponseMapper();
    }
}
