package com.mat.jamr.apigateway.service.user.retrieve;


import com.mat.jamr.externalapi.model.RetrieveUserRequest;
import com.mat.jamr.externalapi.model.RetrieveUserResponse;
import com.mat.jamr.userservice.api.UserServiceGrpc;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.function.Function;

@Service
@RequiredArgsConstructor
public class RetrieveUserService implements Function<String, RetrieveUserResponse> {

    private final RetrieveUserMapper retrieveUserMapper;
    private final UserServiceGrpc.UserServiceBlockingStub userServiceClient;

    @Override
    public RetrieveUserResponse apply(String s) {
        var returnedUser = userServiceClient.retrieveUser(retrieveUserMapper.map(new RetrieveUserRequest().id(s)));

        return retrieveUserMapper.map(returnedUser);
    }
}
