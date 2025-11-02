package com.mat.jamr.gameservice.context;

import com.mat.jamr.gameservice.api.ListShopItemsRequest;
import com.mat.jamr.gameservice.api.ListShopItemsResponse;
import com.mat.jamr.gameservice.api.db.ShopItem;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.List;

@Data
@Accessors(chain = true, fluent = false)
public class ListShopItemsContext implements ShopItemsAware {
    private ListShopItemsRequest request;
    private ListShopItemsResponse response;
    private List<ShopItem> shopItems;

    public String getCategoryFilter() {
        return request != null && !request.getCategory().isEmpty() ? request.getCategory() : null;
    }

    @Override
    public void setShopItems(List<ShopItem> shopItems) {
        this.shopItems = shopItems;
    }
}
