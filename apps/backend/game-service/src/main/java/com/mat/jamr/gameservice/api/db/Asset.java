package com.mat.jamr.gameservice.api.db;

import com.mat.jamr.gameservice.api.AssetType;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbAttribute;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbBean;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbPartitionKey;

import java.util.Optional;

@DynamoDbBean
public class Asset {

    private String id;
    private String name;
    private String url;
    private String description;
    private AssetType type;
    private OnClickAction onClickAction;

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

    @DynamoDbAttribute("url")
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @DynamoDbAttribute("description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @DynamoDbAttribute("type")
    public String getType() {
        return Optional.ofNullable(type).map(a -> a.name()).orElse(null);
    }

    public void setType(String type) {
        this.type = AssetType.valueOf(type);
    }

    @DynamoDbAttribute("onClickAction")
    public OnClickAction getOnClickAction() {
        return onClickAction;
    }

    public void setOnClickAction(OnClickAction onClickAction) {
        this.onClickAction = onClickAction;
    }
}
