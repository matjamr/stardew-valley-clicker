package com.mat.jamr.userservice.security.service.login;

import com.mat.jamr.userservice.api.LoginUserRequest;
import com.mat.jamr.userservice.api.User;
import com.mat.jamr.userservice.common.user.template.EmailAware;
import com.mat.jamr.userservice.common.user.template.PasswordAware;
import com.mat.jamr.userservice.common.user.template.UserAware;
import com.mat.jamr.userservice.common.user.template.UserIdAware;
import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class LoginSecurityContext implements EmailAware, PasswordAware, UserAware {

    private LoginUserRequest loginUserRequest;
    private User user;

    public static LoginSecurityContext from(LoginUserRequest loginUserRequest) {
        return new LoginSecurityContext().setLoginUserRequest(loginUserRequest);
    }

    @Override
    public String getEmail() {
        return loginUserRequest.getEmail();
    }

    @Override
    public String getPassword() {
        return loginUserRequest.getPassword();
    }

    @Override
    public User getUser() {
        return user;
    }

    @Override
    public void setUser(User user) {
        this.user = user;
    }
}
