package com.mat.jamr.userservice.security.service.verify;


import com.mat.jamr.userservice.api.User;
import com.mat.jamr.userservice.api.VerifyUserRequest;
import com.mat.jamr.userservice.api.VerifyUserResponse;
import com.mat.jamr.userservice.common.user.template.EmailAware;
import com.mat.jamr.userservice.common.user.template.UserAware;
import com.mat.jamr.userservice.security.service.common.AccessTokenAware;
import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true, fluent = true)
public class VerifySecurityContext implements AccessTokenAware, EmailAware, UserAware {

    private String accessToken;
    private User user;
    private String email;
    private VerifyUserResponse verifyUserResponse;

    public static VerifySecurityContext from(VerifyUserRequest verifyUserRequest) {
        return new VerifySecurityContext().accessToken(verifyUserRequest.getAccessToken());
    }

    @Override
    public String getAccessToken() {
        return accessToken;
    }

    @Override
    public void setAccessToken(String token) {
        this.accessToken = token;
    }

    @Override
    public String getEmail() {
        return email;
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
    public void setEmail(String email) {
        this.email = email;
    }
}
