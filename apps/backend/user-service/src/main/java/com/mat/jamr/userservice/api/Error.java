package com.mat.jamr.userservice.api;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum Error {
    USER_ALREADY_EXISTS("User with given id does not exist", 1);

    private final String message;
    private final int code;
}
