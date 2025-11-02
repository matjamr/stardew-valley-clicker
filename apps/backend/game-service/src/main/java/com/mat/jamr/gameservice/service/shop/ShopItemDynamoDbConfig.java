package com.mat.jamr.gameservice.service.shop;

import com.mat.jamr.gameservice.api.db.ShopItem;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbEnhancedClient;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;
import software.amazon.awssdk.enhanced.dynamodb.TableSchema;

@Configuration
@RequiredArgsConstructor
public class ShopItemDynamoDbConfig {

    private final DynamoDbEnhancedClient dynamoDbEnhancedClient;

    @Bean
    public DynamoDbTable<ShopItem> shopItemTable() {
        return dynamoDbEnhancedClient.table("Items", TableSchema.fromBean(ShopItem.class));
    }
}
