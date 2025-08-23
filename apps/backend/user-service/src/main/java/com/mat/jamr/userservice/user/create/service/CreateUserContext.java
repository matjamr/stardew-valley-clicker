package com.mat.jamr.userservice.user.create.service;

import com.mat.jamr.userservice.api.SaveUserRequest;
import com.mat.jamr.userservice.api.SaveUserResponse;
import com.mat.jamr.userservice.api.User;
import com.mat.jamr.userservice.common.user.template.UserAware;
import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class CreateUserContext implements UserAware {
    private SaveUserRequest saveUserRequest;
    private SaveUserResponse saveUserResponse;
    private User user;

    public static CreateUserContext from(SaveUserRequest request) {
        return new CreateUserContext().setSaveUserRequest(request);
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
