package com.mat.jamr.gameservice.api.db;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbBean;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbPartitionKey;

import java.util.Map;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@DynamoDbBean
public class ShopItem {
    private String id;
    private String name;
    private String description;
    private String category; // SEEDS, TOOLS, FOOD, etc.
    private Integer price;
    private String currency; // GOLD, GEMS, TOKENS
    private String iconUrl;
    private Integer stackSize;
    private Map<String, String> metadata;
    private Boolean available;
    private Integer stock; // -1 for unlimited

    @DynamoDbPartitionKey
    public String getId() {
        return id;
    }
}
