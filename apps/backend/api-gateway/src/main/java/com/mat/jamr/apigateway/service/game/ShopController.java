package com.mat.jamr.apigateway.service.game;

import com.mat.jamr.apigateway.service.game.mapper.ShopApiMapper;
import com.mat.jamr.externalapi.model.ListShopItemsResponse;
import com.mat.jamr.externalapi.model.PurchaseItemRequest;
import com.mat.jamr.externalapi.model.PurchaseItemResponse;
import com.mat.jamr.externalapi.model.ShopItem;
import com.mat.jamr.gameservice.api.GetShopItemRequest;
import com.mat.jamr.gameservice.api.ShopServiceGrpc;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/shop")
@RequiredArgsConstructor
public class ShopController {

    private final ShopServiceGrpc.ShopServiceBlockingStub shopServiceClient;
    private final ShopApiMapper shopApiMapper;

    @GetMapping("/items")
    public ListShopItemsResponse listShopItems(@RequestParam(required = false) String category) {
        var requestBuilder = com.mat.jamr.gameservice.api.ListShopItemsRequest.newBuilder();
        if (category != null && !category.isEmpty()) {
            requestBuilder.setCategory(category);
        }
        var grpcResp = shopServiceClient.listShopItems(requestBuilder.build());
        return shopApiMapper.toExternal(grpcResp);
    }

    @GetMapping("/items/{id}")
    public ShopItem getShopItem(@PathVariable String id) {
        var grpcResp = shopServiceClient.getShopItem(
                GetShopItemRequest.newBuilder().setItemId(id).build()
        );
        return shopApiMapper.toExternal(grpcResp);
    }

    @PostMapping("/purchase")
    public PurchaseItemResponse purchaseItem(@RequestBody PurchaseItemRequest request) {
        var grpcReq = shopApiMapper.toGrpc(request);
        var grpcResp = shopServiceClient.purchaseItem(grpcReq);
        return shopApiMapper.toExternal(grpcResp);
    }
}
