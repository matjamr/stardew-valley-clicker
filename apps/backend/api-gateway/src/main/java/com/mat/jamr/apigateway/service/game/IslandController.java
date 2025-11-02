package com.mat.jamr.apigateway.service.game;

import com.mat.jamr.apigateway.service.game.mapper.IslandApiMapper;
import com.mat.jamr.externalapi.model.CollectTerrainCollectableResponse;
import com.mat.jamr.externalapi.model.CreateIslandRequest;
import com.mat.jamr.externalapi.model.CreateIslandResponse;
import com.mat.jamr.externalapi.model.GenerateCollectablesResponse;
import com.mat.jamr.externalapi.model.ReadIslandResponse;
import com.mat.jamr.externalapi.model.UpdateIslandRequest;
import com.mat.jamr.externalapi.model.UpdateIslandResponse;
import com.mat.jamr.gameservice.api.CollectTerrainCollectableRequest;
import com.mat.jamr.gameservice.api.GenerateCollectablesRequest;
import com.mat.jamr.gameservice.api.IslandServiceGrpc;
import com.mat.jamr.gameservice.api.ListAllIslandsRequest;
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

    @GetMapping
    public com.mat.jamr.externalapi.model.ListAllIslandsResponse listAll(@RequestParam(required = false) String ownerId) {
        var requestBuilder = ListAllIslandsRequest.newBuilder();
        if (ownerId != null && !ownerId.isEmpty()) {
            requestBuilder.setOwnerId(ownerId);
        }
        var grpcResp = islandServiceClient.listAll(requestBuilder.build());
        return islandApiMapper.toExternal(grpcResp);
    }

    @PutMapping("/{id}")
    public UpdateIslandResponse update(@PathVariable String id, @RequestBody UpdateIslandRequest request) {
        var grpcReq = islandApiMapper.toGrpc(request, id);
        var grpcResp = islandServiceClient.update(grpcReq);
        return islandApiMapper.toExternal(grpcResp);
    }

    @PostMapping("/{id}/generate-collectables")
    public GenerateCollectablesResponse generateCollectables(
            @PathVariable String id,
            @RequestParam(required = false, defaultValue = "0") Integer count
    ) {
        var grpcReq = GenerateCollectablesRequest.newBuilder()
                .setIslandId(id)
                .setCount(count != null ? count : 0)
                .build();
        var grpcResp = islandServiceClient.generateCollectables(grpcReq);

        var response = new GenerateCollectablesResponse();
        response.setSuccess(grpcResp.getSuccess());
        response.setMessage(grpcResp.getMessage());
        response.setCount(grpcResp.getCount());
        return response;
    }

    @PostMapping("/{id}/terrain-collectables/{collectableId}/collect")
    public CollectTerrainCollectableResponse collectTerrainCollectable(
            @PathVariable String id,
            @PathVariable String collectableId
    ) {
        var grpcReq = CollectTerrainCollectableRequest.newBuilder()
                .setIslandId(id)
                .setCollectableId(collectableId)
                .build();
        var grpcResp = islandServiceClient.collectTerrainCollectable(grpcReq);

        var response = new CollectTerrainCollectableResponse();
        response.setSuccess(grpcResp.getSuccess());
        response.setMessage(grpcResp.getMessage());
        if (grpcResp.hasRewards()) {
            response.setRewards(islandApiMapper.mapRewardInfoToExternal(grpcResp.getRewards()));
        }
        return response;
    }

}
