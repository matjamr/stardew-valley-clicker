package com.mat.jamr.userservice.service;

import com.mat.jamr.userservice.api.*;
import io.grpc.stub.StreamObserver;
import net.devh.boot.grpc.server.service.GrpcService;

@GrpcService
public class UserRetrieveService extends UserServiceGrpc.UserServiceImplBase {

    @Override
    @GrpcValidation
    public void saveUser(SaveUserRequest request, StreamObserver<SaveUserResponse> responseObserver) {

        responseObserver.onNext(SaveUserResponse.newBuilder()
                .setId("asda")
                .build());
        responseObserver.onCompleted();
    }

    @Override
    public void retrieveUser(RetrieveUserRequest request, StreamObserver<RetrieveUserResponse> responseObserver) {
        super.retrieveUser(request, responseObserver);
    }
}
