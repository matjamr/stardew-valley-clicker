package com.mat.jamr.apigateway.error;

import com.mat.jamr.externalapi.model.Error;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@Slf4j
@RequiredArgsConstructor
@ControllerAdvice
public class ErrorHandlingController {

    private final ErrorMapper errorMapper;

    @ExceptionHandler
    public Error handleError(ApiGatewayException e) {
        log.error("Error occurred: {}", e.getMessage(), e);

        return errorMapper.mapError(e.getApiGatewayError());
    }
}
