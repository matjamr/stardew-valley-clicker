package com.mat.jamr.gameservice.service.assets;

import com.mat.jamr.gameservice.api.*;
import com.mat.jamr.gameservice.context.CreateAssetContext;
import com.mat.jamr.gameservice.context.ReadAssetContext;
import io.grpc.stub.StreamObserver;
import lombok.RequiredArgsConstructor;
import net.devh.boot.grpc.server.service.GrpcService;

import java.util.function.Function;

@GrpcService
@RequiredArgsConstructor
public class AssetsService extends AssetServiceGrpc.AssetServiceImplBase {

    private final Function<CreateAssetContext, CreateAssetResponse> createUserStrategyBasedFlow;
    private final Function<ReadAssetContext, ReadAssetResponse> readAssetStrategyBasedFlow;

    @Override
    public void create(CreateAssetRequest request, StreamObserver<CreateAssetResponse> responseObserver) {
        responseObserver.onNext(createUserStrategyBasedFlow.apply(new CreateAssetContext().setCreateAssetRequest(request)));
        responseObserver.onCompleted();
    }

    @Override
    public void read(ReadAssetRequest request, StreamObserver<ReadAssetResponse> responseObserver) {
        responseObserver.onNext(readAssetStrategyBasedFlow.apply(new ReadAssetContext().request(request)));
        responseObserver.onCompleted();
    }

    @Override
    public void readMany(ReadManyAssetsRequest request, StreamObserver<ReadManyAssetsResponse> responseObserver) {
        super.readMany(request, responseObserver);
    }

    @Override
    public void delete(DeleteAssetRequest request, StreamObserver<DeleteAssetResponse> responseObserver) {
        super.delete(request, responseObserver);
    }

    @Override
    public void update(UpdateAssetRequest request, StreamObserver<UpdateAssetResponse> responseObserver) {
        super.update(request, responseObserver);
    }
}
