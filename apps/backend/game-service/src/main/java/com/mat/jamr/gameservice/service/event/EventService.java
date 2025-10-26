package com.mat.jamr.gameservice.service.event;

import com.mat.jamr.gameservice.context.ReadEventContext;
import com.mat.jamr.gameservice.context.TriggerEventContext;
import com.mat.jamr.gameservice.scheduler.api.*;
import io.grpc.stub.StreamObserver;
import lombok.RequiredArgsConstructor;
import net.devh.boot.grpc.server.service.GrpcService;

import java.util.function.Function;

@GrpcService
@RequiredArgsConstructor
public class EventService extends EventServiceGrpc.EventServiceImplBase {

    private final Function<TriggerEventContext, TriggerEventResponse> createEventStrategyBasedFlow;
    private final Function<ReadEventContext, com.mat.jamr.gameservice.scheduler.api.ScheduledEvent> readEventStrategyBasedFlow;

    @Override
    public void create(TriggerEventRequest request, StreamObserver<TriggerEventResponse> responseObserver) {
        var response = createEventStrategyBasedFlow.apply(new TriggerEventContext().withRequest(request));
        responseObserver.onNext(response);
        responseObserver.onCompleted();
    }

    @Override
    public void read(ReadByIdParams request, StreamObserver<com.mat.jamr.gameservice.scheduler.api.ScheduledEvent> responseObserver) {
        var response = readEventStrategyBasedFlow.apply(new ReadEventContext().setRequest(request));
        responseObserver.onNext(response);
        responseObserver.onCompleted();
    }
}
