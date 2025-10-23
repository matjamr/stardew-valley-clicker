package com.mat.jamr.gameservice.api.db;

import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbAttribute;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbBean;

import java.util.List;

@DynamoDbBean
public class MineLevel {
    private Integer level;
    private Integer sizeX;
    private Integer sizeY;
    private Integer blockSize;
    private List<MineTile> tiles;
    private List<String> resourceIds;
    private Integer difficulty;

    @DynamoDbAttribute("level")
    public Integer getLevel() { return level; }
    public void setLevel(Integer level) { this.level = level; }

    @DynamoDbAttribute("sizeX")
    public Integer getSizeX() { return sizeX; }
    public void setSizeX(Integer sizeX) { this.sizeX = sizeX; }

    @DynamoDbAttribute("sizeY")
    public Integer getSizeY() { return sizeY; }
    public void setSizeY(Integer sizeY) { this.sizeY = sizeY; }

    @DynamoDbAttribute("blockSize")
    public Integer getBlockSize() { return blockSize; }
    public void setBlockSize(Integer blockSize) { this.blockSize = blockSize; }

    @DynamoDbAttribute("tiles")
    public List<MineTile> getTiles() { return tiles; }
    public void setTiles(List<MineTile> tiles) { this.tiles = tiles; }

    @DynamoDbAttribute("resourceIds")
    public List<String> getResourceIds() { return resourceIds; }
    public void setResourceIds(List<String> resourceIds) { this.resourceIds = resourceIds; }

    @DynamoDbAttribute("difficulty")
    public Integer getDifficulty() { return difficulty; }
    public void setDifficulty(Integer difficulty) { this.difficulty = difficulty; }
}
