package com.mat.jamr.userservice.security.service.common;

public interface RefreshTokenAware {
    String getRefreshToken();
    void setRefreshToken(String token);
}
