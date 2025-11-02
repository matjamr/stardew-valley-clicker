package com.mat.jamr.gameservice.context;

import com.mat.jamr.gameservice.api.PurchaseItemRequest;
import com.mat.jamr.gameservice.api.PurchaseItemResponse;
import com.mat.jamr.gameservice.api.db.Island;
import com.mat.jamr.gameservice.api.db.ShopItem;
import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true, fluent = false)
public class PurchaseItemContext {
    private PurchaseItemRequest request;
    private PurchaseItemResponse response;
    private Island island;
    private ShopItem shopItem;
}
