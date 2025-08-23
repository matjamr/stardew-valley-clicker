package com.mat.jamr.userservice.common;

import com.mat.jamr.userservice.api.UserServiceException;
import io.grpc.Status;
import net.devh.boot.grpc.server.advice.GrpcAdvice;
import net.devh.boot.grpc.server.advice.GrpcExceptionHandler;

@GrpcAdvice
public class GlobalErrorHandler {

    @GrpcExceptionHandler
    public io.grpc.Status handleUserServiceException(UserServiceException exception) {
        return Status.fromCodeValue(exception.getError().getCode()).withDescription(exception.getMessage());
    }

    @GrpcExceptionHandler
    public io.grpc.Status handleUserServiceException(Exception error) {
        return Status.INTERNAL.withDescription(error.getMessage());
    }
}
