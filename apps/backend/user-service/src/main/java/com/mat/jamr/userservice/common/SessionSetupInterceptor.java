package com.mat.jamr.userservice.common;

import com.mat.jamr.userservice.common.security.TokenHolder;
import io.grpc.*;
import lombok.RequiredArgsConstructor;
import net.devh.boot.grpc.server.interceptor.GrpcGlobalServerInterceptor;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Optional;

@GrpcGlobalServerInterceptor
@RequiredArgsConstructor
public class SessionSetupInterceptor implements ServerInterceptor {

    @Autowired
    private TokenHolder tokenHolder;

    @Override
    public <ReqT, RespT> ServerCall.Listener<ReqT> interceptCall(ServerCall<ReqT, RespT> serverCall, Metadata metadata, ServerCallHandler<ReqT, RespT> serverCallHandler) {
        ServerCall.Listener<ReqT> delegate = null;
        Optional.ofNullable(Metadata.Key.of("Authorization", Metadata.ASCII_STRING_MARSHALLER))
                .map(metadata::get)
                .ifPresent(token -> tokenHolder.setAccessToken(token.replace("Bearer ", "")));


        try {
            delegate = serverCallHandler.startCall(serverCall, metadata);
        } catch (Exception ex) {
            return new ServerCall.Listener<ReqT>() {
            };
        }
        return new ForwardingServerCallListener.SimpleForwardingServerCallListener<ReqT>(delegate) {
            @Override
            public void onHalfClose() {
                try {
                    super.onHalfClose();
                } catch (Exception ex) {
                    System.out.println(ex.getMessage());
                }
            }
        };
    }
}
