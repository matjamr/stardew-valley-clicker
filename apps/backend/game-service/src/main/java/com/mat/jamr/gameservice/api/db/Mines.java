package com.mat.jamr.gameservice.api.db;

import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbAttribute;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbBean;

import java.util.List;

@DynamoDbBean
public class Mines {
    private String id;
    private String name;
    private Integer currentLevel;
    private Integer maxLevel;
    private List<MineLevel> levels;

    @DynamoDbAttribute("id")
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    @DynamoDbAttribute("name")
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    @DynamoDbAttribute("currentLevel")
    public Integer getCurrentLevel() { return currentLevel; }
    public void setCurrentLevel(Integer currentLevel) { this.currentLevel = currentLevel; }

    @DynamoDbAttribute("maxLevel")
    public Integer getMaxLevel() { return maxLevel; }
    public void setMaxLevel(Integer maxLevel) { this.maxLevel = maxLevel; }

    @DynamoDbAttribute("levels")
    public List<MineLevel> getLevels() { return levels; }
    public void setLevels(List<MineLevel> levels) { this.levels = levels; }
}
