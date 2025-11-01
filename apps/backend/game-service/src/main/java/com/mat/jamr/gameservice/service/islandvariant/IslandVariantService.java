package com.mat.jamr.gameservice.service.islandvariant;

import com.mat.jamr.gameservice.api.IslandVariant;
import com.mat.jamr.gameservice.api.IslandVariantServiceGrpc;
import com.mat.jamr.gameservice.api.ListAllIslandVariantsRequest;
import com.mat.jamr.gameservice.api.ListAllIslandVariantsResponse;
import com.mat.jamr.gameservice.api.ReadIslandVariantRequest;
import com.mat.jamr.gameservice.context.ListAllIslandVariantsContext;
import com.mat.jamr.gameservice.context.ReadIslandVariantContext;
import io.grpc.stub.StreamObserver;
import lombok.RequiredArgsConstructor;
import net.devh.boot.grpc.server.service.GrpcService;

import java.util.function.Function;

@GrpcService
@RequiredArgsConstructor
public class IslandVariantService extends IslandVariantServiceGrpc.IslandVariantServiceImplBase {

    private final Function<ReadIslandVariantContext, IslandVariant> readIslandVariantStrategyBasedFlow;
    private final Function<ListAllIslandVariantsContext, ListAllIslandVariantsResponse> listAllIslandVariantsStrategyBasedFlow;

    @Override
    public void read(ReadIslandVariantRequest request, StreamObserver<IslandVariant> responseObserver) {
        responseObserver.onNext(readIslandVariantStrategyBasedFlow.apply(new ReadIslandVariantContext().setRequest(request)));
        responseObserver.onCompleted();
    }

    @Override
    public void listAll(ListAllIslandVariantsRequest request, StreamObserver<ListAllIslandVariantsResponse> responseObserver) {
        responseObserver.onNext(listAllIslandVariantsStrategyBasedFlow.apply(new ListAllIslandVariantsContext().setRequest(request)));
        responseObserver.onCompleted();
    }
}
