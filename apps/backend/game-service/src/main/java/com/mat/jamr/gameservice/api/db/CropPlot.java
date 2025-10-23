package com.mat.jamr.gameservice.api.db;

import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbAttribute;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbBean;

@DynamoDbBean
public class CropPlot {
    private Integer x;
    private Integer y;
    private Integer sizeX;
    private Integer sizeY;
    private Asset asset;
    private String cropId;
    private String plantedAt;
    private Integer growthStage;
    private Boolean isWatered;

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

    @DynamoDbAttribute("cropId")
    public String getCropId() { return cropId; }
    public void setCropId(String cropId) { this.cropId = cropId; }

    @DynamoDbAttribute("plantedAt")
    public String getPlantedAt() { return plantedAt; }
    public void setPlantedAt(String plantedAt) { this.plantedAt = plantedAt; }

    @DynamoDbAttribute("growthStage")
    public Integer getGrowthStage() { return growthStage; }
    public void setGrowthStage(Integer growthStage) { this.growthStage = growthStage; }

    @DynamoDbAttribute("isWatered")
    public Boolean getIsWatered() { return isWatered; }
    public void setIsWatered(Boolean watered) { isWatered = watered; }
}
