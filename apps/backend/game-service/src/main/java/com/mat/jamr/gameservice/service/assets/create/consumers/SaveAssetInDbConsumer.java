package com.mat.jamr.gameservice.service.assets.create.consumers;


import com.mat.jamr.gameservice.api.db.Asset;
import com.mat.jamr.gameservice.context.AssetAware;
import lombok.RequiredArgsConstructor;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbEnhancedClient;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;
import software.amazon.awssdk.enhanced.dynamodb.model.TransactPutItemEnhancedRequest;
import software.amazon.awssdk.enhanced.dynamodb.model.TransactWriteItemsEnhancedRequest;
import software.amazon.awssdk.services.dynamodb.model.TransactionCanceledException;

import java.util.function.Consumer;

@RequiredArgsConstructor
public class SaveAssetInDbConsumer<T extends AssetAware> implements Consumer<T> {
    private final DynamoDbTable<Asset> assetTable;
    private final DynamoDbEnhancedClient dynamoDbEnhancedClient;

    @Override
    public void accept(T context) {
        TransactWriteItemsEnhancedRequest transactWriteRequest = TransactWriteItemsEnhancedRequest.builder()
                .addPutItem(assetTable, TransactPutItemEnhancedRequest.builder(Asset.class)
                        .item(context.getAsset())
                        .build())
                .build();

        context.setAsset(context.getAsset());

        try {
            var ret = dynamoDbEnhancedClient.transactWriteItems(transactWriteRequest);
        } catch (TransactionCanceledException e) {
            System.err.println("Transaction was canceled. Items were not written. Details:");
            throw new RuntimeException("Transactional write failed.", e);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
