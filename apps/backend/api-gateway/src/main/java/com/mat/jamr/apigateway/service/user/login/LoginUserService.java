package com.mat.jamr.apigateway.service.user.login;


import com.mat.jamr.apigateway.service.user.verify.VerifyUserMapper;
import com.mat.jamr.externalapi.model.LoginUserRequest;
import com.mat.jamr.externalapi.model.LoginUserResponse;
import com.mat.jamr.externalapi.model.VerifyUserRequest;
import com.mat.jamr.externalapi.model.VerifyUserResponse;
import com.mat.jamr.userservice.api.SecurityServiceGrpc;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.function.Function;

@Service
@RequiredArgsConstructor
public class LoginUserService implements Function<LoginUserRequest, LoginUserResponse> {

    private final LoginUserMapper loginUserMapper;
    private final SecurityServiceGrpc.SecurityServiceBlockingStub securityServiceClient;

    @Override
    public LoginUserResponse apply(LoginUserRequest request) {
        var returnedUser = securityServiceClient.login(loginUserMapper.map(request));

        return loginUserMapper.map(returnedUser);
    }
}
