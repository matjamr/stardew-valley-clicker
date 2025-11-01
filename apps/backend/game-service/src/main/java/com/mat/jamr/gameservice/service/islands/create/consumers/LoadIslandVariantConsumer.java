package com.mat.jamr.gameservice.service.islands.create.consumers;

import com.mat.jamr.gameservice.api.db.IslandVariant;
import com.mat.jamr.gameservice.context.IslandVariantAware;
import com.mat.jamr.gameservice.context.IslandVariantIdAware;
import com.mat.jamr.gameservice.service.islandvariant.read.consumers.ReadIslandVariantFromDbConsumer;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

public class LoadIslandVariantConsumer<T extends IslandVariantIdAware & IslandVariantAware>
        extends ReadIslandVariantFromDbConsumer<T> {

    public LoadIslandVariantConsumer(DynamoDbTable<IslandVariant> islandVariantTable) {
        super(islandVariantTable);
    }
}
