package com.mat.jamr.gameservice.service.shop.purchase.consumers;

import com.mat.jamr.gameservice.api.db.Bag;
import com.mat.jamr.gameservice.api.db.BagItem;
import com.mat.jamr.gameservice.api.db.Island;
import com.mat.jamr.gameservice.context.PurchaseItemContext;
import lombok.RequiredArgsConstructor;

import java.util.ArrayList;
import java.util.function.Consumer;

@RequiredArgsConstructor
public class AddItemToBagConsumer implements Consumer<PurchaseItemContext> {

    @Override
    public void accept(PurchaseItemContext context) {
        Island island = context.getIsland();
        var shopItem = context.getShopItem();
        int quantity = context.getRequest().getQuantity();

        // Initialize bag if it doesn't exist
        if (island.getBag() == null) {
            Bag bag = new Bag();
            bag.setItems(new ArrayList<>());
            bag.setMaxSlots(20); // Default 20 slots
            island.setBag(bag);
        }

        Bag bag = island.getBag();
        if (bag.getItems() == null) {
            bag.setItems(new ArrayList<>());
        }

        // Find if item already exists in bag
        BagItem existingItem = bag.getItems().stream()
                .filter(item -> shopItem.getId().equals(item.getItemId()))
                .findFirst()
                .orElse(null);

        if (existingItem != null) {
            // Update quantity
            existingItem.setQuantity(existingItem.getQuantity() + quantity);
        } else {
            // Add new item to bag
            BagItem newBagItem = new BagItem();
            newBagItem.setItemId(shopItem.getId());
            newBagItem.setName(shopItem.getName());
            newBagItem.setQuantity(quantity);
            newBagItem.setIconUrl(shopItem.getIconUrl());
            bag.getItems().add(newBagItem);
        }
    }
}
