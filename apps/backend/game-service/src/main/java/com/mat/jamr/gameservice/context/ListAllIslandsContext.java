package com.mat.jamr.gameservice.context;

import com.mat.jamr.gameservice.api.ListAllIslandsRequest;
import com.mat.jamr.gameservice.api.ListAllIslandsResponse;
import com.mat.jamr.gameservice.api.db.Island;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.List;

@Data
@Accessors(chain = true, fluent = false)
public class ListAllIslandsContext implements OwnerIdAware, IslandsAware {
    private ListAllIslandsRequest request;
    private ListAllIslandsResponse response;
    private List<Island> islands;

    @Override
    public String getOwnerId() {
        return request != null ? request.getOwnerId() : null;
    }

    @Override
    public List<Island> getIslands() {
        return islands;
    }

    @Override
    public void setIslands(List<Island> islands) {
        this.islands = islands;
    }
}
