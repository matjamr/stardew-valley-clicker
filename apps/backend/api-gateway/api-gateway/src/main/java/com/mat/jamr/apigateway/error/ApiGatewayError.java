package com.mat.jamr.apigateway.error;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum ApiGatewayError {
    SERVICE_NOT_AVAILABLE("Downstream service is not available.", 1);

    private final String message;
    private final int code;
}
