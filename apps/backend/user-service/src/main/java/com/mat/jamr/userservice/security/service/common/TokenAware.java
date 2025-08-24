package com.mat.jamr.userservice.security.service.common;

public interface TokenAware {
    String getAccessToken();
    void setAccessToken(String token);


    String getRefreshToken();
    void setRefreshToken(String token);
}
