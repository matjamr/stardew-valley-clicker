package com.mat.jamr.apigateway.service.game;

import com.mat.jamr.apigateway.service.game.mapper.IslandVariantApiMapper;
import com.mat.jamr.externalapi.model.IslandVariant;
import com.mat.jamr.gameservice.api.IslandVariantServiceGrpc;
import com.mat.jamr.gameservice.api.ListAllIslandVariantsRequest;
import com.mat.jamr.gameservice.api.ReadIslandVariantRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/island-variants")
@RequiredArgsConstructor
public class IslandVariantController {

    private final IslandVariantServiceGrpc.IslandVariantServiceBlockingStub islandVariantClient;
    private final IslandVariantApiMapper islandVariantApiMapper;

    @GetMapping
    public List<IslandVariant> listAll() {
        var resp = islandVariantClient.listAll(ListAllIslandVariantsRequest.newBuilder().build());
        return resp.getVariantsList().stream()
                .map(islandVariantApiMapper::map)
                .collect(Collectors.toList());
    }

    @GetMapping("/{id}")
    public IslandVariant read(@PathVariable String id) {
        var resp = islandVariantClient.read(ReadIslandVariantRequest.newBuilder().setId(id).build());
        return islandVariantApiMapper.map(resp);
    }
}
