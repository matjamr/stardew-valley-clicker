package com.mat.jamr.gameservice.service.islands.listall.consumers;

import com.mat.jamr.gameservice.api.db.Island;
import com.mat.jamr.gameservice.context.IslandsAware;
import com.mat.jamr.gameservice.context.OwnerIdAware;
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
public class LoadIslandsByOwnerIdConsumer<T extends OwnerIdAware & IslandsAware> implements Consumer<T> {

    private final DynamoDbTable<Island> islandTable;

    @Override
    public void accept(T context) {
        var ownerId = context.getOwnerId();

        // If ownerId is provided, filter by it; otherwise return all islands
        List<Island> islands;

        if (ownerId != null && !ownerId.isEmpty()) {
            Map<String, AttributeValue> expressionValues = new HashMap<>();
            expressionValues.put(":ownerId", AttributeValue.builder().s(ownerId).build());

            Expression filterExpression = Expression.builder()
                    .expression("ownerId = :ownerId")
                    .expressionValues(expressionValues)
                    .build();

            ScanEnhancedRequest scanRequest = ScanEnhancedRequest.builder()
                    .filterExpression(filterExpression)
                    .build();

            islands = islandTable.scan(scanRequest)
                    .items()
                    .stream()
                    .collect(Collectors.toList());
        } else {
            // No filter, return all islands
            islands = islandTable.scan()
                    .items()
                    .stream()
                    .collect(Collectors.toList());
        }

        context.setIslands(islands);
    }
}
