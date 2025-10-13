package com.mat.jamr.gameservice.api.db;

import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbAttribute;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbBean;

import java.util.List;

@DynamoDbBean
public class Terrain {

    private String id;
    private String name;
    private List<TerrainTile> tiles;
    private Integer blockSize;
    private Integer sizeX;
    private Integer sizeY;

    @DynamoDbAttribute("id")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @DynamoDbAttribute("name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @DynamoDbAttribute("tiles")
    public List<TerrainTile> getTiles() {
        return tiles;
    }

    public void setTiles(List<TerrainTile> tiles) {
        this.tiles = tiles;
    }

    @DynamoDbAttribute("blockSize")
    public Integer getBlockSize() {
        return blockSize;
    }

    public void setBlockSize(Integer blockSize) {
        this.blockSize = blockSize;
    }

    @DynamoDbAttribute("sizeX")
    public Integer getSizeX() {
        return sizeX;
    }

    public void setSizeX(Integer sizeX) {
        this.sizeX = sizeX;
    }

    @DynamoDbAttribute("sizeY")
    public Integer getSizeY() {
        return sizeY;
    }

    public void setSizeY(Integer sizeY) {
        this.sizeY = sizeY;
    }
}
