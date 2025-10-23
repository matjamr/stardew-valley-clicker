package com.mat.jamr.gameservice.api.db;

import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbAttribute;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbBean;

import java.util.List;

@DynamoDbBean
public class Farm {
    private String id;
    private String name;
    private Integer sizeX;
    private Integer sizeY;
    private Integer blockSize;
    private List<CropPlot> plots;
    private List<Decoration> decorations;

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

    @DynamoDbAttribute("plots")
    public List<CropPlot> getPlots() { return plots; }
    public void setPlots(List<CropPlot> plots) { this.plots = plots; }

    @DynamoDbAttribute("decorations")
    public List<Decoration> getDecorations() { return decorations; }
    public void setDecorations(List<Decoration> decorations) { this.decorations = decorations; }
}
