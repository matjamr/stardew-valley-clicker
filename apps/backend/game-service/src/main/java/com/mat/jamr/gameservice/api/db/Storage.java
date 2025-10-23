package com.mat.jamr.gameservice.api.db;

import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbAttribute;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbBean;

@DynamoDbBean
public class Storage {
    private Integer x;
    private Integer y;
    private Integer sizeX;
    private Integer sizeY;
    private Asset asset;
    private String storageId;
    private Integer capacity;

    @DynamoDbAttribute("x")
    public Integer getX() { return x; }
    public void setX(Integer x) { this.x = x; }

    @DynamoDbAttribute("y")
    public Integer getY() { return y; }
    public void setY(Integer y) { this.y = y; }

    @DynamoDbAttribute("sizeX")
    public Integer getSizeX() { return sizeX; }
    public void setSizeX(Integer sizeX) { this.sizeX = sizeX; }

    @DynamoDbAttribute("sizeY")
    public Integer getSizeY() { return sizeY; }
    public void setSizeY(Integer sizeY) { this.sizeY = sizeY; }

    @DynamoDbAttribute("asset")
    public Asset getAsset() { return asset; }
    public void setAsset(Asset asset) { this.asset = asset; }

    @DynamoDbAttribute("storageId")
    public String getStorageId() { return storageId; }
    public void setStorageId(String storageId) { this.storageId = storageId; }

    @DynamoDbAttribute("capacity")
    public Integer getCapacity() { return capacity; }
    public void setCapacity(Integer capacity) { this.capacity = capacity; }
}
