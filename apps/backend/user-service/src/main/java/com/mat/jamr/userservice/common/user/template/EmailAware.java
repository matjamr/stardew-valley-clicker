package com.mat.jamr.userservice.common.user.template;

public interface EmailAware {
    String getEmail();

    default void setEmail(String email) {

    }
}
