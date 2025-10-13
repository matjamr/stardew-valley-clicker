package com.mat.jamr.gameservice.service.assets.read.consumers;


import com.mat.jamr.gameservice.api.db.Asset;
import com.mat.jamr.gameservice.api.error.GameServiceException;
import com.mat.jamr.gameservice.context.AssetAware;
import com.mat.jamr.gameservice.context.AssetIdAware;
import lombok.RequiredArgsConstructor;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbEnhancedClient;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;
import software.amazon.awssdk.enhanced.dynamodb.model.TransactPutItemEnhancedRequest;
import software.amazon.awssdk.enhanced.dynamodb.model.TransactWriteItemsEnhancedRequest;
import software.amazon.awssdk.services.dynamodb.model.TransactionCanceledException;

import java.util.Optional;
import java.util.function.Consumer;

import static com.mat.jamr.gameservice.api.error.Error.ASSET_NOT_FOUND;

@RequiredArgsConstructor
public class ReadAssetFromDbConsumer<T extends AssetIdAware & AssetAware> implements Consumer<T> {
    private final DynamoDbTable<Asset> assetTable;

    @Override
    public void accept(T t) {

        Optional.ofNullable(t.getAssetId())
                .map(user -> assetTable.getItem(r -> r.key(k -> k.partitionValue(t.getAssetId()))))
                .ifPresentOrElse(t::setAsset, () -> {
                    throw new GameServiceException(ASSET_NOT_FOUND);
                });

    }
}
