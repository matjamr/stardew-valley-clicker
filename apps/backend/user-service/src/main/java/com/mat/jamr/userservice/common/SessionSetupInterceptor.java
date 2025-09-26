package com.mat.jamr.userservice.common;

import com.mat.jamr.userservice.common.security.TokenHolder;
import io.grpc.Metadata;
import io.grpc.ServerCall;
import io.grpc.ServerCallHandler;
import io.grpc.ServerInterceptor;
import lombok.RequiredArgsConstructor;
import net.devh.boot.grpc.server.interceptor.GrpcGlobalServerInterceptor;

import java.util.Optional;

@GrpcGlobalServerInterceptor
@RequiredArgsConstructor
public class SessionSetupInterceptor implements ServerInterceptor {

    private final TokenHolder tokenHolder;

    @Override
    public <ReqT, RespT> ServerCall.Listener<ReqT> interceptCall(ServerCall<ReqT, RespT> serverCall, Metadata metadata, ServerCallHandler<ReqT, RespT> serverCallHandler) {
        Optional.ofNullable(Metadata.Key.of("Authorization", Metadata.ASCII_STRING_MARSHALLER))
                .map(metadata::get)
                .ifPresent(token -> tokenHolder.setAccessToken(token.replace("Bearer ", "")));

        return serverCallHandler.startCall(serverCall, metadata);
    }
}
