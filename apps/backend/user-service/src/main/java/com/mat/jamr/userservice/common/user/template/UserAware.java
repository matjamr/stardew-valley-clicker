package com.mat.jamr.userservice.common.user.template;

import com.mat.jamr.userservice.api.User;

public interface UserAware {
    User getUser();
    void setUser(User user);
}
