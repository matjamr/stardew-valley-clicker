package com.mat.jamr.gameservice.api.db;

import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbAttribute;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbBean;

import java.util.List;

@DynamoDbBean
public class RewardInfo {

    private List<ResourceReward> resources;
    private Integer xpGrant;

    @DynamoDbAttribute("resources")
    public List<ResourceReward> getResources() {
        return resources;
    }

    public void setResources(List<ResourceReward> resources) {
        this.resources = resources;
    }

    @DynamoDbAttribute("xpGrant")
    public Integer getXpGrant() {
        return xpGrant;
    }

    public void setXpGrant(Integer xpGrant) {
        this.xpGrant = xpGrant;
    }
}
