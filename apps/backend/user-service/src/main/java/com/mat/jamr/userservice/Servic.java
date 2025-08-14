package com.mat.jamr.userservice;

import com.matjamr.api.internal.GreeterGrpc;
import com.matjamr.api.internal.HelloRequest;
import com.matjamr.api.internal.HelloResponse;
import io.grpc.stub.StreamObserver;
import org.springframework.stereotype.Service;

@Service
public class Servic extends GreeterGrpc.GreeterImplBase {

    @Override
    public void sayHello(HelloRequest request, StreamObserver<HelloResponse> responseObserver) {
        responseObserver.onNext(com.matjamr.api.internal.HelloResponse.newBuilder().setMessage("Ahoj!").build());
        responseObserver.onCompleted();
    }

}
