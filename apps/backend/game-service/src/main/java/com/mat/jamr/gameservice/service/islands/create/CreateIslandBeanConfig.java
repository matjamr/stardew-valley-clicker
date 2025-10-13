package com.mat.jamr.gameservice.service.islands.create;

import com.mat.jamr.gameservice.api.CreateAssetResponse;
import com.mat.jamr.gameservice.api.db.Asset;
import com.mat.jamr.gameservice.context.CreateAssetContext;
import com.mat.jamr.gameservice.service.common.MinioFileService;
import com.mat.jamr.gameservice.service.islands.create.consumers.AssetFileAppender;
import com.mat.jamr.gameservice.service.islands.create.consumers.SaveAssetInDbConsumer;
import com.matjamr.commonutils.StrategyBasedConsumer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbEnhancedClient;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

import java.util.List;
import java.util.function.Consumer;
import java.util.function.Function;

@Configuration
public class CreateIslandBeanConfig {

    @Bean
    public Function<CreateAssetContext, CreateAssetResponse> createUserStrategyBasedFlow(
            final Consumer<CreateAssetContext> saveAssetInDbConsumer,
            final Consumer<CreateAssetContext> createAssetRequestMapperImpl,
            final Consumer<CreateAssetContext> createAssetResponseMapperImpl,
            final Consumer<CreateAssetContext> assetFileAppender
    ) {
        return new StrategyBasedConsumer<>(List.of(createAssetRequestMapperImpl, assetFileAppender, saveAssetInDbConsumer, createAssetResponseMapperImpl),
                CreateAssetContext::getCreateAssetResponse);
    }

    @Bean
    public Consumer<CreateAssetContext> saveAssetInDbConsumer(
            final DynamoDbTable<Asset> assetTable,
            final DynamoDbEnhancedClient dynamoDbEnhancedClient
    ) {
        return new SaveAssetInDbConsumer(assetTable, dynamoDbEnhancedClient);
    }

    @Bean
    public Consumer<CreateAssetContext> assetFileAppender(
            final MinioFileService minioFileService
    ) {
        return new AssetFileAppender(minioFileService);
    }
}
