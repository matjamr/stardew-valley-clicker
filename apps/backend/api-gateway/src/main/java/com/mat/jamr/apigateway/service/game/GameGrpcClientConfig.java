package com.mat.jamr.apigateway.service.game;

import com.mat.jamr.gameservice.api.AssetServiceGrpc;
import com.mat.jamr.gameservice.api.IslandServiceGrpc;
import com.mat.jamr.gameservice.api.IslandVariantServiceGrpc;
import com.mat.jamr.gameservice.scheduler.api.EventServiceGrpc;
import net.devh.boot.grpc.client.channelfactory.GrpcChannelFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class GameGrpcClientConfig {

    @Bean
    public AssetServiceGrpc.AssetServiceBlockingStub assetServiceClient(GrpcChannelFactory channels) {
        return AssetServiceGrpc.newBlockingStub(channels.createChannel("game-service"));
    }

    @Bean
    public IslandServiceGrpc.IslandServiceBlockingStub islandServiceClient(GrpcChannelFactory channels) {
        return IslandServiceGrpc.newBlockingStub(channels.createChannel("game-service"));
    }

    @Bean
    public IslandVariantServiceGrpc.IslandVariantServiceBlockingStub islandVariantServiceClient(GrpcChannelFactory channels) {
        return IslandVariantServiceGrpc.newBlockingStub(channels.createChannel("game-service"));
    }

    @Bean
    public EventServiceGrpc.EventServiceBlockingStub eventServiceClient(GrpcChannelFactory channels) {
        return EventServiceGrpc.newBlockingStub(channels.createChannel("game-service"));
    }
}
