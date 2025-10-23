package com.mat.jamr.gameservice.api.db;

import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbAttribute;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbBean;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbPartitionKey;

@DynamoDbBean
public class IslandVariant {

    private String id;
    private String name;
    private String ownerId;
    private String namedVariant;
    private Farm farmTemplate;
    private Barn barnTemplate;
    private Mines minesTemplate;
    private FishingArea fishingAreaTemplate;

    @DynamoDbPartitionKey
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

    @DynamoDbAttribute("ownerId")
    public String getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(String ownerId) {
        this.ownerId = ownerId;
    }

    @DynamoDbAttribute("namedVariant")
    public String getNamedVariant() {
        return namedVariant;
    }

    public void setNamedVariant(String namedVariant) {
        this.namedVariant = namedVariant;
    }

    @DynamoDbAttribute("farmTemplate")
    public Farm getFarmTemplate() {
        return farmTemplate;
    }

    public void setFarmTemplate(Farm farmTemplate) {
        this.farmTemplate = farmTemplate;
    }

    @DynamoDbAttribute("barnTemplate")
    public Barn getBarnTemplate() {
        return barnTemplate;
    }

    public void setBarnTemplate(Barn barnTemplate) {
        this.barnTemplate = barnTemplate;
    }

    @DynamoDbAttribute("minesTemplate")
    public Mines getMinesTemplate() {
        return minesTemplate;
    }

    public void setMinesTemplate(Mines minesTemplate) {
        this.minesTemplate = minesTemplate;
    }

    @DynamoDbAttribute("fishingAreaTemplate")
    public FishingArea getFishingAreaTemplate() {
        return fishingAreaTemplate;
    }

    public void setFishingAreaTemplate(FishingArea fishingAreaTemplate) {
        this.fishingAreaTemplate = fishingAreaTemplate;
    }
}
