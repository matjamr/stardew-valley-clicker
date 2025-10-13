package com.mat.jamr.gameservice.api.db;

import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbAttribute;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbBean;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbPartitionKey;

import java.util.List;

@DynamoDbBean
public class IslandVariant {

    private String id;
    private IslandVariantType type;
    private String name;
    private String description;
    private List<Terrain> startingTerrains;

    @DynamoDbPartitionKey
    @DynamoDbAttribute("id")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @DynamoDbAttribute("type")
    public String getType() {
        return type != null ? type.name() : null;
    }

    public void setType(String type) {
        this.type = type != null ? IslandVariantType.valueOf(type) : null;
    }

    @DynamoDbAttribute("name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @DynamoDbAttribute("description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @DynamoDbAttribute("startingTerrains")
    public List<Terrain> getStartingTerrains() {
        return startingTerrains;
    }

    public void setStartingTerrains(List<Terrain> startingTerrains) {
        this.startingTerrains = startingTerrains;
    }
}
