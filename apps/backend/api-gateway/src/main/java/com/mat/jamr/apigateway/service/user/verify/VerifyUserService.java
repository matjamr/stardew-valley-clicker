package com.mat.jamr.apigateway.service.user.verify;


import com.mat.jamr.externalapi.model.VerifyUserRequest;
import com.mat.jamr.externalapi.model.VerifyUserResponse;
import com.mat.jamr.userservice.api.SecurityServiceGrpc;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.function.Function;

@Service
@RequiredArgsConstructor
public class VerifyUserService implements Function<VerifyUserRequest, VerifyUserResponse> {

    private final VerifyUserMapper verifyUserMapper;
    private final SecurityServiceGrpc.SecurityServiceBlockingStub securityServiceClient;

    @Override
    public VerifyUserResponse apply(VerifyUserRequest request) {
        var returnedUser = securityServiceClient.verify(verifyUserMapper.map(request));

        return verifyUserMapper.map(returnedUser);
    }
}
