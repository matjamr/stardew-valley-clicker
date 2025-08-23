package com.mat.jamr.userservice.api;

import lombok.Getter;

public class UserServiceException extends RuntimeException {

    @Getter
    private final Error error;

    public UserServiceException(Error error) {
        super(error.getMessage());
        this.error = error;
    }
}
