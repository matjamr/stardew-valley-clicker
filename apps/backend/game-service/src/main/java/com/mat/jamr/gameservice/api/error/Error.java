package com.mat.jamr.gameservice.api.error;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum Error {;
    private final String message;
    private final int code;
}
