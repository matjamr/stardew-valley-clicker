package com.mat.jamr.userservice.common;

import com.mat.jamr.userservice.api.error.UserServiceException;
import io.grpc.Status;
import io.grpc.StatusException;
import io.grpc.StatusRuntimeException;
import net.devh.boot.grpc.server.advice.GrpcAdvice;
import net.devh.boot.grpc.server.advice.GrpcExceptionHandler;


@GrpcAdvice
public class GlobalErrorHandler {

    @GrpcExceptionHandler
    public StatusRuntimeException handleUserServiceException(UserServiceException exception) {
        return Status.fromCodeValue(exception.getError().getCode()).withDescription(exception.getMessage())
                .asRuntimeException();
    }

//    @GrpcExceptionHandler
//    public StatusException handleUserServiceException(Exception error) {
//        return Status.INTERNAL.withDescription(error.getMessage()).asException();
//    }
}
