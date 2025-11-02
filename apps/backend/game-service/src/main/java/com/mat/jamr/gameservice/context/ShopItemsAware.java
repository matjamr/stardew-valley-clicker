package com.mat.jamr.gameservice.context;

import com.mat.jamr.gameservice.api.db.ShopItem;

import java.util.List;

public interface ShopItemsAware {
    List<ShopItem> getShopItems();
    void setShopItems(List<ShopItem> shopItems);
}
