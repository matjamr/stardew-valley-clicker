package com.mat.jamr.gameservice.api.db;

import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbAttribute;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbBean;

import java.util.List;

@DynamoDbBean
public class FishingArea {
    private String id;
    private String name;
    private Integer sizeX;
    private Integer sizeY;
    private Integer blockSize;
    private List<FishingSpot> spots;
    private List<String> availableFishIds;

    @DynamoDbAttribute("id")
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    @DynamoDbAttribute("name")
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    @DynamoDbAttribute("sizeX")
    public Integer getSizeX() { return sizeX; }
    public void setSizeX(Integer sizeX) { this.sizeX = sizeX; }

    @DynamoDbAttribute("sizeY")
    public Integer getSizeY() { return sizeY; }
    public void setSizeY(Integer sizeY) { this.sizeY = sizeY; }

    @DynamoDbAttribute("blockSize")
    public Integer getBlockSize() { return blockSize; }
    public void setBlockSize(Integer blockSize) { this.blockSize = blockSize; }

    @DynamoDbAttribute("spots")
    public List<FishingSpot> getSpots() { return spots; }
    public void setSpots(List<FishingSpot> spots) { this.spots = spots; }

    @DynamoDbAttribute("availableFishIds")
    public List<String> getAvailableFishIds() { return availableFishIds; }
    public void setAvailableFishIds(List<String> availableFishIds) { this.availableFishIds = availableFishIds; }
}
