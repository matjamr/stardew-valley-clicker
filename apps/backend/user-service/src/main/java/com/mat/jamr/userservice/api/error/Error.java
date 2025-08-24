package com.mat.jamr.userservice.api.error;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum Error {
    USER_DOES_NOT_EXIST("User with given id does not exist", 1),
    EMAIL_DOES_NOT_EXIST("Email does not exist", 1),;

    private final String message;
    private final int code;
}
