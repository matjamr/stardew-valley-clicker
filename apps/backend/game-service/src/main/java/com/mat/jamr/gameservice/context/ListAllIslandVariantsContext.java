package com.mat.jamr.gameservice.context;

import com.mat.jamr.gameservice.api.ListAllIslandVariantsRequest;
import com.mat.jamr.gameservice.api.ListAllIslandVariantsResponse;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.ArrayList;
import java.util.List;

@Data
@Accessors(chain = true)
public class ListAllIslandVariantsContext {
    private ListAllIslandVariantsRequest request;
    private ListAllIslandVariantsResponse response;
    private List<com.mat.jamr.gameservice.api.db.IslandVariant> islandVariants = new ArrayList<>();
}
