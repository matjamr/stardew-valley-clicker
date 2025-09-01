package com.mat.jamr.userservice.common.security;

import com.mat.jamr.userservice.security.service.common.AccessTokenAware;

public class TokenHolder implements AccessTokenAware {

    private String accessToken;

    @Override
    public String getAccessToken() {
        return accessToken;
    }

    @Override
    public void setAccessToken(String token) {
        this.accessToken = token;
    }
}
