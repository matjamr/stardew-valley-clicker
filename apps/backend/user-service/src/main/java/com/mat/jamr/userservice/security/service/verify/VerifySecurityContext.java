package com.mat.jamr.userservice.security.service.verify;


import com.mat.jamr.userservice.api.VerifyUserRequest;
import com.mat.jamr.userservice.security.service.common.AccessTokenAware;
import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true, fluent = true)
public class VerifySecurityContext implements AccessTokenAware {

    private String accessToken;

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
}
