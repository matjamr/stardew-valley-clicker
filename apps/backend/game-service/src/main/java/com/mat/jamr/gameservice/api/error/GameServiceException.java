package com.mat.jamr.gameservice.api.error;

import lombok.Getter;

public class GameServiceException extends RuntimeException {

    @Getter
    private final Error error;

    public GameServiceException(Error error) {
        super(error.getMessage());
        this.error = error;
    }
}
