package com.mat.jamr.gameservice.service.islandvariant.read.consumers;

import com.mat.jamr.gameservice.api.db.IslandVariant;
import com.mat.jamr.gameservice.api.error.GameServiceException;
import com.mat.jamr.gameservice.context.IslandVariantAware;
import com.mat.jamr.gameservice.context.IslandVariantIdAware;
import lombok.RequiredArgsConstructor;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

import java.util.Optional;
import java.util.function.Consumer;

import static com.mat.jamr.gameservice.api.error.Error.ASSET_NOT_FOUND;

@RequiredArgsConstructor
public class ReadIslandVariantFromDbConsumer<T extends IslandVariantIdAware & IslandVariantAware> implements Consumer<T> {
    private final DynamoDbTable<IslandVariant> islandVariantTable;

    @Override
    public void accept(T t) {
        Optional.ofNullable(t.getIslandVariantId())
                .map(id -> islandVariantTable.getItem(r -> r.key(k -> k.partitionValue(id))))
                .ifPresentOrElse(t::setIslandVariant, () -> {
                    throw new GameServiceException(ASSET_NOT_FOUND);
                });
    }
}
