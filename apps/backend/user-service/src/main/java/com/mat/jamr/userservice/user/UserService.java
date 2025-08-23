package com.mat.jamr.userservice.user;

import com.mat.jamr.userservice.api.*;
import com.mat.jamr.userservice.user.retrieve.service.RetrieveUserContext;
import io.grpc.stub.StreamObserver;
import lombok.RequiredArgsConstructor;
import org.springframework.grpc.server.service.GrpcService;

import java.util.function.Function;

@GrpcService
@RequiredArgsConstructor
public class UserService extends UserServiceGrpc.UserServiceImplBase {

    private final UserRepository userRepository;
    private final Function<RetrieveUserContext, RetrieveUserResponse> retrieveUserStrategyBasedFlow;

    @Override
    public void saveUser(SaveUserRequest request, StreamObserver<SaveUserResponse> responseObserver) {
        var user = userRepository.createCustomer(new User().setEmail("SAMPLE").setName("CZESC").setPassword("PASSWORD"));

        responseObserver.onNext(SaveUserResponse.newBuilder()
                .setId("asda")
                .build());

        responseObserver.onCompleted();
    }

    @Override
    public void retrieveUser(RetrieveUserRequest request, StreamObserver<RetrieveUserResponse> responseObserver) {
        responseObserver.onNext(retrieveUserStrategyBasedFlow.apply(RetrieveUserContext.from(request)));
        responseObserver.onCompleted();
    }
}
