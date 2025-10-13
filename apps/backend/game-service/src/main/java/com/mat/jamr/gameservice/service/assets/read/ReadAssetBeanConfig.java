package com.mat.jamr.gameservice.service.assets.read;

import com.mat.jamr.gameservice.api.ReadAssetResponse;
import com.mat.jamr.gameservice.api.db.Asset;
import com.mat.jamr.gameservice.context.ReadAssetContext;
import com.mat.jamr.gameservice.service.assets.read.consumers.ReadAssetFromDbConsumer;
import com.matjamr.commonutils.StrategyBasedConsumer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

import java.util.List;
import java.util.function.Consumer;
import java.util.function.Function;

@Configuration
public class ReadAssetBeanConfig {

    @Bean
    public Function<ReadAssetContext, ReadAssetResponse> readAssetStrategyBasedFlow(
            final Consumer<ReadAssetContext> readAssetFromDbConsumer,
            final Consumer<ReadAssetContext> readAssetResponseMapperImpl
    ) {
        return new StrategyBasedConsumer<>(List.of(readAssetFromDbConsumer, readAssetResponseMapperImpl),
                ReadAssetContext::getResponse);
    }

    @Bean
    public Consumer<ReadAssetContext> readAssetFromDbConsumer(
            final DynamoDbTable<Asset> assetTable
    ) {
        return new ReadAssetFromDbConsumer(assetTable);
    }
}
