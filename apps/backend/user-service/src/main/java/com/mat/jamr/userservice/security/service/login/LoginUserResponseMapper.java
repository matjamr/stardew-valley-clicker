package com.mat.jamr.userservice.security.service.login;

import com.mat.jamr.userservice.api.LoginUserResponse;

import java.util.function.Consumer;

public class LoginUserResponseMapper implements Consumer<LoginSecurityContext> {

    @Override
    public void accept(LoginSecurityContext loginSecurityContext) {
        loginSecurityContext.setLoginUserResponse(LoginUserResponse.newBuilder()
                .setAccessToken(loginSecurityContext.getAccessToken())
                .setRefreshToken(loginSecurityContext.getRefreshToken())
                .build());
    }
}
