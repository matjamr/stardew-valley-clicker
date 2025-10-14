package com.mat.jamr.apigateway.service.game;

import com.mat.jamr.apigateway.service.game.mapper.IslandApiMapper;
import com.mat.jamr.externalapi.model.CreateIslandRequest;
import com.mat.jamr.externalapi.model.CreateIslandResponse;
import com.mat.jamr.externalapi.model.ReadIslandResponse;
import com.mat.jamr.gameservice.api.IslandServiceGrpc;
import com.mat.jamr.gameservice.api.ReadIslandRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/islands")
@RequiredArgsConstructor
public class IslandController {

    private final IslandServiceGrpc.IslandServiceBlockingStub islandServiceClient;
    private final IslandApiMapper islandApiMapper;

    @PostMapping
    public CreateIslandResponse create(@RequestBody CreateIslandRequest request) {
        var grpcReq = islandApiMapper.toGrpc(request);
        var grpcResp = islandServiceClient.create(grpcReq);
        return islandApiMapper.toExternal(grpcResp);
    }

    @GetMapping("/{id}")
    public ReadIslandResponse read(@PathVariable String id) {
        var grpcResp = islandServiceClient.read(ReadIslandRequest.newBuilder().setIslandId(id).build());
        return islandApiMapper.toExternal(grpcResp);
    }
}
