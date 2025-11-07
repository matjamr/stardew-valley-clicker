package com.mat.jamr.apigateway.service.user.create;

import com.mat.jamr.externalapi.model.SaveUserRequest;
import com.mat.jamr.externalapi.model.SaveUserResponse;
import com.mat.jamr.userservice.api.UserServiceGrpc;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.function.Function;

@Service
@RequiredArgsConstructor
public class SaveUserService implements Function<SaveUserRequest, SaveUserResponse> {

    private final CreateUserMapper createUserMapper;
    private final UserServiceGrpc.UserServiceBlockingStub userServiceClient;

    @Override
    public SaveUserResponse apply(SaveUserRequest request) {
        var grpcRequest = createUserMapper.map(request);
        var grpcResponse = userServiceClient.saveUser(grpcRequest);

        return createUserMapper.map(grpcResponse);
    }
}
