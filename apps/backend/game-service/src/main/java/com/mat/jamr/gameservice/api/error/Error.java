package com.mat.jamr.gameservice.api.error;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum Error {
    ASSET_NOT_FOUND("Asset not found", 1);
    private final String message;
    private final int code;
}
