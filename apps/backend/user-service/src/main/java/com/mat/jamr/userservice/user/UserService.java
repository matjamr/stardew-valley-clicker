package com.mat.jamr.userservice.user;

import com.mat.jamr.userservice.api.*;
import com.mat.jamr.userservice.user.create.service.CreateUserContext;
import com.mat.jamr.userservice.user.retrieve.service.RetrieveUserContext;
import io.grpc.stub.StreamObserver;
import lombok.RequiredArgsConstructor;
import net.devh.boot.grpc.server.service.GrpcService;

import java.util.function.Function;

@GrpcService
@RequiredArgsConstructor
public class UserService extends UserServiceGrpc.UserServiceImplBase {

    private final Function<RetrieveUserContext, RetrieveUserResponse> retrieveUserStrategyBasedFlow;
    private final Function<CreateUserContext, SaveUserResponse> createUserStrategyBasedFlow;

    @Override
    public void saveUser(SaveUserRequest request, StreamObserver<SaveUserResponse> responseObserver) {
        var a = createUserStrategyBasedFlow.apply(CreateUserContext.from(request));
        responseObserver.onNext(a);
        responseObserver.onCompleted();
    }

    @Override
    public void retrieveUser(RetrieveUserRequest request, StreamObserver<RetrieveUserResponse> responseObserver) {
        responseObserver.onNext(retrieveUserStrategyBasedFlow.apply(RetrieveUserContext.from(request)));
        responseObserver.onCompleted();
    }
}
