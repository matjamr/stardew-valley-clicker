package com.mat.jamr.gameservice.service.islandvariant.listall.consumers;

import com.mat.jamr.gameservice.api.db.IslandVariant;
import com.mat.jamr.gameservice.context.ListAllIslandVariantsContext;
import lombok.RequiredArgsConstructor;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;

@RequiredArgsConstructor
public class ListAllIslandVariantsFromDbConsumer implements Consumer<ListAllIslandVariantsContext> {
    private final DynamoDbTable<IslandVariant> islandVariantTable;

    @Override
    public void accept(ListAllIslandVariantsContext context) {
        // Scan all island variants from DynamoDB
        List<IslandVariant> variants = new ArrayList<>();
        islandVariantTable.scan().items().forEach(variants::add);
        context.setIslandVariants(variants);
    }
}
