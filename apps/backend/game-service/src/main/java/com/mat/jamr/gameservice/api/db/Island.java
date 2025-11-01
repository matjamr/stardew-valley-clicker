package com.mat.jamr.gameservice.api.db;

import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbAttribute;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbBean;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbPartitionKey;

import java.util.List;

@DynamoDbBean
public class Island {

    private String id;
    private String name;
    private String ownerId;
    private String namedVariant;
    private List<String> allowedPlayers;
    private String createdAt;
    private String updatedAt;
    private Farm farm;
    private Barn barn;
    private Mines mines;
    private FishingArea fishingArea;

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

    @DynamoDbAttribute("allowedPlayers")
    public List<String> getAllowedPlayers() {
        return allowedPlayers;
    }

    public void setAllowedPlayers(List<String> allowedPlayers) {
        this.allowedPlayers = allowedPlayers;
    }

    @DynamoDbAttribute("createdAt")
    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    @DynamoDbAttribute("updatedAt")
    public String getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }

    @DynamoDbAttribute("farm")
    public Farm getFarm() {
        return farm;
    }

    public void setFarm(Farm farm) {
        this.farm = farm;
    }

    @DynamoDbAttribute("barn")
    public Barn getBarn() {
        return barn;
    }

    public void setBarn(Barn barn) {
        this.barn = barn;
    }

    @DynamoDbAttribute("mines")
    public Mines getMines() {
        return mines;
    }

    public void setMines(Mines mines) {
        this.mines = mines;
    }

    @DynamoDbAttribute("fishingArea")
    public FishingArea getFishingArea() {
        return fishingArea;
    }

    public void setFishingArea(FishingArea fishingArea) {
        this.fishingArea = fishingArea;
    }
}
