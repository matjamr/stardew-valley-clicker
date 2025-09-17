package com.mat.jamr.apigateway.service.user.common;

import com.mat.jamr.userservice.api.UserServiceGrpc;
import net.devh.boot.grpc.client.channelfactory.GrpcChannelFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class BeanConfig {

    @Bean
    public UserServiceGrpc.UserServiceBlockingStub userServiceClient(GrpcChannelFactory channels) {
        return UserServiceGrpc.newBlockingStub(channels.createChannel("user-service"));
    }
}
