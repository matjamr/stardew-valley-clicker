package com.mat.jamr.gameservice.service.shop.purchase.consumers;

import com.mat.jamr.gameservice.api.PurchaseItemResponse;
import com.mat.jamr.gameservice.context.PurchaseItemContext;
import lombok.RequiredArgsConstructor;

import java.util.function.Function;

@RequiredArgsConstructor
public class PurchaseItemResponseMapper implements Function<PurchaseItemContext, PurchaseItemResponse> {

    @Override
    public PurchaseItemResponse apply(PurchaseItemContext context) {
        return PurchaseItemResponse.newBuilder()
                .setSuccess(true)
                .setTransactionId(java.util.UUID.randomUUID().toString())
                .setMessage("Item purchased successfully and added to bag")
                .setRemainingCurrency(0) // TODO: Implement currency system
                .build();
    }
}
