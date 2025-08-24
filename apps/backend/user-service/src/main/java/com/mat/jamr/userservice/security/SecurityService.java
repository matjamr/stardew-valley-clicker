package com.mat.jamr.userservice.security;

import com.mat.jamr.userservice.api.*;
import com.mat.jamr.userservice.security.service.JwtService;
import com.mat.jamr.userservice.security.service.login.LoginSecurityContext;
import io.grpc.stub.StreamObserver;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.devh.boot.grpc.server.service.GrpcService;

@Slf4j
@GrpcService
@RequiredArgsConstructor
public class SecurityService extends SecurityServiceGrpc.SecurityServiceImplBase {

    private final JwtService jwtService;

    @Override
    public void login(LoginUserRequest request, StreamObserver<LoginUserResponse> responseObserver) {

        log.info(jwtService.generateToken(new SecuredUser(new User().email("asdasda"))));
        LoginSecurityContext.from(request);
        responseObserver.onNext(LoginUserResponse.newBuilder().build());
        responseObserver.onCompleted();
    }

    @Override
    public void verify(VerifyUserRequest request, StreamObserver<VerifyUserResponse> responseObserver) {
        super.verify(request, responseObserver);
    }

    @Override
    public void refresh(RefreshTokenRequest request, StreamObserver<RefreshTokenResponse> responseObserver) {
        super.refresh(request, responseObserver);
    }
}
