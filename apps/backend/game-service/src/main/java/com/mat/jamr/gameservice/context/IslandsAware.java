package com.mat.jamr.gameservice.context;

import com.mat.jamr.gameservice.api.db.Island;

import java.util.List;

public interface IslandsAware {
    List<Island> getIslands();
    void setIslands(List<Island> islands);
}
