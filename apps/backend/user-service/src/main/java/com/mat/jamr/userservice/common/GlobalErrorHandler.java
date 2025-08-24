package com.mat.jamr.userservice.common;

import com.mat.jamr.userservice.api.error.UserServiceException;
import io.grpc.Status;
import lombok.extern.slf4j.Slf4j;
import net.devh.boot.grpc.server.advice.GrpcAdvice;
import net.devh.boot.grpc.server.advice.GrpcExceptionHandler;

@Slf4j
@GrpcAdvice
public class GlobalErrorHandler {

    @GrpcExceptionHandler
    public io.grpc.Status handleUserServiceException(UserServiceException exception) {
        log.error(exception.getCause().getMessage());
        return Status.fromCodeValue(exception.getError().getCode()).withDescription(exception.getMessage());
    }

    @GrpcExceptionHandler
    public io.grpc.Status handleUserServiceException(Exception error) {
        log.error(error.toString());
        return Status.INTERNAL.withDescription(error.getMessage());
    }
}
