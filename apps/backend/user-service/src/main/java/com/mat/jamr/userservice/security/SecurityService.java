package com.mat.jamr.userservice.security;

import com.mat.jamr.userservice.api.*;
import io.grpc.stub.StreamObserver;
import org.springframework.grpc.server.service.GrpcService;

@GrpcService
public class SecurityService extends SecurityServiceGrpc.SecurityServiceImplBase {

    @Override
    public void login(LoginUserRequest request, StreamObserver<LoginUserResponse> responseObserver) {
        super.login(request, responseObserver);
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
