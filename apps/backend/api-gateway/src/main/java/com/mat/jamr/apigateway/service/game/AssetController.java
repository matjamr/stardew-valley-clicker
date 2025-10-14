package com.mat.jamr.apigateway.service.game;

import com.mat.jamr.apigateway.service.game.mapper.AssetApiMapper;
import com.mat.jamr.externalapi.model.CreateAssetRequest;
import com.mat.jamr.externalapi.model.CreateAssetResponse;
import com.mat.jamr.externalapi.model.ReadAssetResponse;
import com.mat.jamr.gameservice.api.AssetServiceGrpc;
import com.mat.jamr.gameservice.api.ReadAssetRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/assets")
@RequiredArgsConstructor
public class AssetController {

    private final AssetServiceGrpc.AssetServiceBlockingStub assetServiceClient;
    private final AssetApiMapper assetApiMapper;

    @PostMapping
    public CreateAssetResponse create(@RequestBody CreateAssetRequest request) {
        var grpcReq = assetApiMapper.toGrpc(request);
        var grpcResp = assetServiceClient.create(grpcReq);
        return assetApiMapper.toExternal(grpcResp);
    }

    @GetMapping("/{id}")
    public ReadAssetResponse read(@PathVariable String id) {
        var grpcResp = assetServiceClient.read(ReadAssetRequest.newBuilder().setId(id).build());
        return assetApiMapper.toExternal(grpcResp);
    }
}
