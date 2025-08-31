package com.mat.jamr.userservice.security.service.common;

public interface AccessTokenAware {
    String getAccessToken();
    void setAccessToken(String token);
}
