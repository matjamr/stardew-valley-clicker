package com.mat.jamr.gameservice.service.islandvariant;

import com.mat.jamr.gameservice.api.IslandVariant;
import com.mat.jamr.gameservice.api.IslandVariantServiceGrpc;
import com.mat.jamr.gameservice.api.ReadIslandVariantRequest;
import com.mat.jamr.gameservice.context.ReadIslandVariantContext;
import io.grpc.stub.StreamObserver;
import lombok.RequiredArgsConstructor;
import net.devh.boot.grpc.server.service.GrpcService;

import java.util.function.Function;

@GrpcService
@RequiredArgsConstructor
public class IslandVariantService extends IslandVariantServiceGrpc.IslandVariantServiceImplBase {

    private final Function<ReadIslandVariantContext, IslandVariant> readIslandVariantStrategyBasedFlow;

    @Override
    public void read(ReadIslandVariantRequest request, StreamObserver<IslandVariant> responseObserver) {
        responseObserver.onNext(readIslandVariantStrategyBasedFlow.apply(new ReadIslandVariantContext().setRequest(request)));
        responseObserver.onCompleted();
    }
}
