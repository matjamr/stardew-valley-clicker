package com.mat.jamr.userservice.user.retrieve.service;

import com.mat.jamr.userservice.api.RetrieveUserRequest;
import com.mat.jamr.userservice.api.RetrieveUserResponse;
import com.mat.jamr.userservice.api.User;
import com.mat.jamr.userservice.common.user.template.UserAware;
import com.mat.jamr.userservice.common.user.template.UserIdAware;
import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class RetrieveUserContext implements UserAware, UserIdAware {

    private RetrieveUserRequest retrieveUserRequest;
    private RetrieveUserResponse retrieveUserResponse;
    private User user;

    @Override
    public String getUserId() {
        return retrieveUserRequest.getId();
    }

    @Override
    public User getUser() {
        return user;
    }

    @Override
    public void setUser(User user) {
        this.user = user;
    }

    public static RetrieveUserContext from(RetrieveUserRequest retrieveUserRequest) {
        return new RetrieveUserContext().setRetrieveUserRequest(retrieveUserRequest);
    }
}
