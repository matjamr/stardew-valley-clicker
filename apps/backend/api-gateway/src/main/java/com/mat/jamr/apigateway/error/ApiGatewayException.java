package com.mat.jamr.apigateway.error;

import lombok.Getter;

public class ApiGatewayException extends RuntimeException {

    @Getter
    private final ApiGatewayError apiGatewayError;

    public ApiGatewayException(ApiGatewayError error) {
        super(error.getMessage());
        this.apiGatewayError = error;
    }
}
