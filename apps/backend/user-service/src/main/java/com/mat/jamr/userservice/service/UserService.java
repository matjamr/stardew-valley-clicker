package com.mat.jamr.userservice.service;

import com.mat.jamr.userservice.api.*;
import io.grpc.stub.StreamObserver;
import lombok.RequiredArgsConstructor;
import org.springframework.grpc.server.service.GrpcService;

@GrpcService
@RequiredArgsConstructor
public class UserService extends UserServiceGrpc.UserServiceImplBase {

    private final UserRepository userRepository;

    @Override
    public void saveUser(SaveUserRequest request, StreamObserver<SaveUserResponse> responseObserver) {
        userRepository.createCustomer(new User().setEmail("SAMPLE").setName("CZESC"));

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
