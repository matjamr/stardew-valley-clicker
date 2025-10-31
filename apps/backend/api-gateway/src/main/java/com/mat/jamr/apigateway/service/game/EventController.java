package com.mat.jamr.apigateway.service.game;

import com.mat.jamr.apigateway.service.game.mapper.EventApiMapper;
import com.mat.jamr.externalapi.model.CreateEventRequest;
import com.mat.jamr.externalapi.model.CreateEventResponse;
import com.mat.jamr.externalapi.model.ReadEventResponse;
import com.mat.jamr.gameservice.scheduler.api.EventServiceGrpc;
import com.mat.jamr.gameservice.scheduler.api.ReadByIdParams;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("/events")
@RequiredArgsConstructor
public class EventController {

    private final EventServiceGrpc.EventServiceBlockingStub eventServiceClient;
    private final EventApiMapper eventApiMapper;

    @PostMapping
    public CreateEventResponse create(@RequestBody CreateEventRequest request) {
        log.info("Creating event for user {} on island {}", request.getUserId(), request.getIslandId());
        var grpcReq = eventApiMapper.toGrpc(request);
        var grpcResp = eventServiceClient.create(grpcReq);
        return eventApiMapper.toExternal(grpcResp);
    }

    @GetMapping("/{id}")
    public ReadEventResponse read(@PathVariable String id) {
        log.info("Reading event with ID: {}", id);
        var grpcResp = eventServiceClient.read(ReadByIdParams.newBuilder().setId(id).build());
        return eventApiMapper.toExternal(grpcResp, "userId123");
    }
}
