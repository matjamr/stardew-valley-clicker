package com.mat.jamr.userservice.service;

import io.grpc.Status;
import net.devh.boot.grpc.server.advice.GrpcAdvice;
import net.devh.boot.grpc.server.advice.GrpcExceptionHandler;

@GrpcAdvice
public class GlobalGrpcExceptionHandler {

    @GrpcExceptionHandler
    public Status handleGrpcValidationException(GrpcValidationException e) {
        return Status.INVALID_ARGUMENT.withDescription(e.getMessage()).withCause(e);
    }

    @GrpcExceptionHandler
    public Status handleException(Exception e) {
        return Status.INTERNAL.withDescription(e.getMessage()).withCause(e);
    }
}
