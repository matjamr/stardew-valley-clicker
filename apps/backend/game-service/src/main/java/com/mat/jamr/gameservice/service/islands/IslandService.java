package com.mat.jamr.gameservice.service.islands;

import com.mat.jamr.gameservice.api.CollectTerrainCollectableRequest;
import com.mat.jamr.gameservice.api.CollectTerrainCollectableResponse;
import com.mat.jamr.gameservice.api.CreateIslandRequest;
import com.mat.jamr.gameservice.api.CreateIslandResponse;
import com.mat.jamr.gameservice.api.GenerateCollectablesRequest;
import com.mat.jamr.gameservice.api.GenerateCollectablesResponse;
import com.mat.jamr.gameservice.api.IslandServiceGrpc;
import com.mat.jamr.gameservice.api.ListAllIslandsRequest;
import com.mat.jamr.gameservice.api.ListAllIslandsResponse;
import com.mat.jamr.gameservice.api.ReadIslandRequest;
import com.mat.jamr.gameservice.api.ReadIslandResponse;
import com.mat.jamr.gameservice.api.UpdateIslandRequest;
import com.mat.jamr.gameservice.api.UpdateIslandResponse;
import com.mat.jamr.gameservice.context.CollectTerrainCollectableContext;
import com.mat.jamr.gameservice.context.CreateIslandContext;
import com.mat.jamr.gameservice.context.GenerateCollectablesContext;
import com.mat.jamr.gameservice.context.ListAllIslandsContext;
import com.mat.jamr.gameservice.context.ReadIslandContext;
import com.mat.jamr.gameservice.context.UpdateIslandContext;
import io.grpc.stub.StreamObserver;
import lombok.RequiredArgsConstructor;
import net.devh.boot.grpc.server.service.GrpcService;

import java.util.function.Function;

@GrpcService
@RequiredArgsConstructor
public class IslandService extends IslandServiceGrpc.IslandServiceImplBase {

    private final Function<CreateIslandContext, CreateIslandResponse> createIslandStrategyBasedFlow;
    private final Function<ReadIslandContext, ReadIslandResponse> readIslandStrategyBasedFlow;
    private final Function<UpdateIslandContext, UpdateIslandResponse> updateIslandStrategyBasedFlow;
    private final Function<ListAllIslandsContext, ListAllIslandsResponse> listAllIslandsStrategyBasedFlow;
    private final Function<GenerateCollectablesContext, GenerateCollectablesResponse> generateCollectablesStrategyBasedFlow;
    private final Function<CollectTerrainCollectableContext, CollectTerrainCollectableResponse> collectTerrainCollectableStrategyBasedFlow;

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

    @Override
    public void update(UpdateIslandRequest request, StreamObserver<UpdateIslandResponse> responseObserver) {
        try {
            var response = updateIslandStrategyBasedFlow.apply(
                    new UpdateIslandContext().setRequest(request)
            );
            responseObserver.onNext(response);
            responseObserver.onCompleted();
        } catch (Exception e) {
            var errorResponse = UpdateIslandResponse.newBuilder()
                    .setSuccess(false)
                    .setMessage("Update failed: " + e.getMessage())
                    .build();
            responseObserver.onNext(errorResponse);
            responseObserver.onCompleted();
        }
    }

    @Override
    public void listAll(ListAllIslandsRequest request, StreamObserver<ListAllIslandsResponse> responseObserver) {
        var response = listAllIslandsStrategyBasedFlow.apply(
                new ListAllIslandsContext().setRequest(request)
        );
        responseObserver.onNext(response);
        responseObserver.onCompleted();
    }

    @Override
    public void generateCollectables(GenerateCollectablesRequest request, StreamObserver<GenerateCollectablesResponse> responseObserver) {
        try {
            var response = generateCollectablesStrategyBasedFlow.apply(
                    new GenerateCollectablesContext().setRequest(request)
            );
            responseObserver.onNext(response);
            responseObserver.onCompleted();
        } catch (Exception e) {
            var errorResponse = GenerateCollectablesResponse.newBuilder()
                    .setSuccess(false)
                    .setMessage("Failed to generate collectables: " + e.getMessage())
                    .setCount(0)
                    .build();
            responseObserver.onNext(errorResponse);
            responseObserver.onCompleted();
        }
    }

    @Override
    public void collectTerrainCollectable(CollectTerrainCollectableRequest request, StreamObserver<CollectTerrainCollectableResponse> responseObserver) {
        try {
            var response = collectTerrainCollectableStrategyBasedFlow.apply(
                    new CollectTerrainCollectableContext().setRequest(request)
            );
            responseObserver.onNext(response);
            responseObserver.onCompleted();
        } catch (Exception e) {
            var errorResponse = CollectTerrainCollectableResponse.newBuilder()
                    .setSuccess(false)
                    .setMessage("Failed to collect terrain collectable: " + e.getMessage())
                    .build();
            responseObserver.onNext(errorResponse);
            responseObserver.onCompleted();
        }
    }
}
