package com.mat.jamr.userservice.security.service.refresh;

import com.mat.jamr.userservice.api.RefreshTokenRequest;
import com.mat.jamr.userservice.api.RefreshTokenResponse;
import com.mat.jamr.userservice.api.User;
import com.mat.jamr.userservice.common.user.template.EmailAware;
import com.mat.jamr.userservice.common.user.template.UserAware;
import com.mat.jamr.userservice.security.service.common.AccessTokenAware;
import com.mat.jamr.userservice.security.service.common.RefreshTokenAware;
import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true, fluent = true)
public class RefreshSecurityContext implements UserAware, RefreshTokenAware, EmailAware, AccessTokenAware {

    private RefreshTokenRequest refreshTokenRequest;
    private RefreshTokenResponse refreshTokenResponse;
    private String refreshToken;
    private User user;
    private String email;
    private String accessToken;

    public static RefreshSecurityContext from(RefreshTokenRequest request) {
        return new RefreshSecurityContext()
                .refreshTokenRequest(request)
                .refreshToken(request.getRefreshToken());
    }

    public RefreshTokenRequest getRefreshTokenRequest() {
        return refreshTokenRequest;
    }

    public void setRefreshTokenRequest(RefreshTokenRequest refreshTokenRequest) {
        this.refreshTokenRequest = refreshTokenRequest;
    }

    public RefreshTokenResponse getRefreshTokenResponse() {
        return refreshTokenResponse;
    }

    public void setRefreshTokenResponse(RefreshTokenResponse refreshTokenResponse) {
        this.refreshTokenResponse = refreshTokenResponse;
    }

    @Override
    public User getUser() {
        return user;
    }

    @Override
    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String getEmail() {
        return email;
    }

    @Override
    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String getRefreshToken() {
        return refreshToken;
    }

    @Override
    public void setRefreshToken(String token) {
        this.refreshToken = token;
    }

    @Override
    public String getAccessToken() {
        return accessToken;
    }

    @Override
    public void setAccessToken(String token) {
        this.accessToken = token;
    }
}
