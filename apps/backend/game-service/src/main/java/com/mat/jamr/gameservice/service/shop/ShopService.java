package com.mat.jamr.gameservice.service.shop;

import com.mat.jamr.gameservice.api.*;
import com.mat.jamr.gameservice.context.ListShopItemsContext;
import com.mat.jamr.gameservice.context.PurchaseItemContext;
import io.grpc.stub.StreamObserver;
import lombok.RequiredArgsConstructor;
import net.devh.boot.grpc.server.service.GrpcService;

import java.util.function.Function;

@GrpcService
@RequiredArgsConstructor
public class ShopService extends ShopServiceGrpc.ShopServiceImplBase {

    private final Function<ListShopItemsContext, ListShopItemsResponse> listShopItemsStrategyBasedFlow;
    private final Function<PurchaseItemContext, PurchaseItemResponse> purchaseItemStrategyBasedFlow;

    @Override
    public void listShopItems(ListShopItemsRequest request, StreamObserver<ListShopItemsResponse> responseObserver) {
        var response = listShopItemsStrategyBasedFlow.apply(
                new ListShopItemsContext().setRequest(request)
        );
        responseObserver.onNext(response);
        responseObserver.onCompleted();
    }

    @Override
    public void getShopItem(GetShopItemRequest request, StreamObserver<ShopItem> responseObserver) {
        // TODO: Implement get single item (optional for now)
        responseObserver.onError(new UnsupportedOperationException("Not implemented yet"));
    }

    @Override
    public void purchaseItem(PurchaseItemRequest request, StreamObserver<PurchaseItemResponse> responseObserver) {
        try {
            var response = purchaseItemStrategyBasedFlow.apply(
                    new PurchaseItemContext().setRequest(request)
            );
            responseObserver.onNext(response);
            responseObserver.onCompleted();
        } catch (Exception e) {
            var errorResponse = PurchaseItemResponse.newBuilder()
                    .setSuccess(false)
                    .setMessage("Purchase failed: " + e.getMessage())
                    .build();
            responseObserver.onNext(errorResponse);
            responseObserver.onCompleted();
        }
    }
}
