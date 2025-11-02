package com.mat.jamr.gameservice.service.shop.listall.consumers;

import com.mat.jamr.gameservice.api.db.ShopItem;
import com.mat.jamr.gameservice.context.ShopItemsAware;
import lombok.RequiredArgsConstructor;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;
import software.amazon.awssdk.enhanced.dynamodb.Expression;
import software.amazon.awssdk.enhanced.dynamodb.model.ScanEnhancedRequest;
import software.amazon.awssdk.services.dynamodb.model.AttributeValue;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;
import java.util.stream.Collectors;

@RequiredArgsConstructor
public class LoadShopItemsFromDbConsumer implements Consumer<ShopItemsAware> {

    private final DynamoDbTable<ShopItem> shopItemTable;
    private final String categoryFilter;

    @Override
    public void accept(ShopItemsAware context) {
        List<ShopItem> items;

        if (categoryFilter != null && !categoryFilter.isEmpty()) {
            // Filter by specific category (and exclude COLLECTABLES)
            Map<String, AttributeValue> expressionValues = new HashMap<>();
            expressionValues.put(":category", AttributeValue.builder().s(categoryFilter).build());
            expressionValues.put(":collectables", AttributeValue.builder().s("COLLECTABLES").build());

            Expression filterExpression = Expression.builder()
                    .expression("category = :category AND category <> :collectables")
                    .expressionValues(expressionValues)
                    .build();

            ScanEnhancedRequest scanRequest = ScanEnhancedRequest.builder()
                    .filterExpression(filterExpression)
                    .build();

            items = shopItemTable.scan(scanRequest)
                    .items()
                    .stream()
                    .collect(Collectors.toList());
        } else {
            // No filter, return all items except COLLECTABLES
            Map<String, AttributeValue> expressionValues = new HashMap<>();
            expressionValues.put(":collectables", AttributeValue.builder().s("COLLECTABLES").build());

            Expression filterExpression = Expression.builder()
                    .expression("category <> :collectables")
                    .expressionValues(expressionValues)
                    .build();

            ScanEnhancedRequest scanRequest = ScanEnhancedRequest.builder()
                    .filterExpression(filterExpression)
                    .build();

            items = shopItemTable.scan(scanRequest)
                    .items()
                    .stream()
                    .collect(Collectors.toList());
        }

        context.setShopItems(items);
    }
}
