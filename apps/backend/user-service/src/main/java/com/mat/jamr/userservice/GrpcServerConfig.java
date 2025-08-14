package com.mat.jamr.userservice;

import io.grpc.Server;
import io.grpc.ServerBuilder;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.io.IOException;

@Configuration
@RequiredArgsConstructor
public class GrpcServerConfig {

    @Value("${spring.application.name}")
    private String applicationName;

    @Value("${grpc.server.port}")
    private int port;

    @Autowired
    Servic servic;

    @Bean
    public Server grpcServer() throws IOException {
        return ServerBuilder.forPort(port)
                .addService(servic)
                .build()
                .start();
    }
}