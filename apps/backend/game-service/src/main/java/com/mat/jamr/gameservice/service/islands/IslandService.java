package com.mat.jamr.gameservice.service.islands;

import com.mat.jamr.gameservice.api.CreateIslandRequest;
import com.mat.jamr.gameservice.api.CreateIslandResponse;
import com.mat.jamr.gameservice.api.IslandServiceGrpc;
import com.mat.jamr.gameservice.api.ReadIslandRequest;
import com.mat.jamr.gameservice.api.ReadIslandResponse;
import com.mat.jamr.gameservice.context.CreateIslandContext;
import com.mat.jamr.gameservice.context.ReadIslandContext;
import io.grpc.stub.StreamObserver;
import lombok.RequiredArgsConstructor;
import net.devh.boot.grpc.server.service.GrpcService;

import java.util.function.Function;

@GrpcService
@RequiredArgsConstructor
public class IslandService extends IslandServiceGrpc.IslandServiceImplBase {

    private final Function<CreateIslandContext, CreateIslandResponse> createIslandStrategyBasedFlow;
    private final Function<ReadIslandContext, ReadIslandResponse> readIslandStrategyBasedFlow;

    @Override
    public void create(CreateIslandRequest request, StreamObserver<CreateIslandResponse> responseObserver) {
        var response = createIslandStrategyBasedFlow.apply(
                new CreateIslandContext().setRequest(request)
        );
        responseObserver.onNext(response);
        responseObserver.onCompleted();
    }

    @Override
    public void read(ReadIslandRequest request, StreamObserver<ReadIslandResponse> responseObserver) {
        var response = readIslandStrategyBasedFlow.apply(
                new ReadIslandContext().setRequest(request)
        );
        responseObserver.onNext(response);
        responseObserver.onCompleted();
    }
}
