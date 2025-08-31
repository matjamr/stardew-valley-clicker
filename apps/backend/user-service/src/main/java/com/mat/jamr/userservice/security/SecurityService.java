package com.mat.jamr.userservice.security;

import com.mat.jamr.userservice.api.*;
import com.mat.jamr.userservice.security.service.login.LoginSecurityContext;
import com.mat.jamr.userservice.security.service.verify.VerifySecurityContext;
import io.grpc.stub.StreamObserver;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.devh.boot.grpc.server.service.GrpcService;

import java.util.function.Function;

@Slf4j
@GrpcService
@RequiredArgsConstructor
public class SecurityService extends SecurityServiceGrpc.SecurityServiceImplBase {
    private final Function<LoginSecurityContext, LoginUserResponse> loginUserStrategyBasedFlow;
    private final Function<VerifySecurityContext, VerifyUserResponse> verifyUserStrategyBasedFlow;

    @Override
    public void login(LoginUserRequest request, StreamObserver<LoginUserResponse> responseObserver) {
        responseObserver.onNext(loginUserStrategyBasedFlow.apply(LoginSecurityContext.from(request)));
        responseObserver.onCompleted();
    }

    @Override
    public void verify(VerifyUserRequest request, StreamObserver<VerifyUserResponse> responseObserver) {
        responseObserver.onNext(verifyUserStrategyBasedFlow.apply(VerifySecurityContext.from(request)));
    }

    @Override
    public void refresh(RefreshTokenRequest request, StreamObserver<RefreshTokenResponse> responseObserver) {
        super.refresh(request, responseObserver);
    }
}
