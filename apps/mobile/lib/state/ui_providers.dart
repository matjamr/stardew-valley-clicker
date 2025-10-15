import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ---------- Models ----------

enum ShopCategory { groceries, seeds, utility }

class Item {
  final String id;
  final String name;
  final IconData icon;
  const Item({required this.id, required this.name, required this.icon});
}

class ShopItem {
  final Item item;
  final int price;
  final ShopCategory category;
  const ShopItem({
    required this.item,
    required this.price,
    required this.category,
  });
}

class InventoryEntry {
  final Item item;
  final int quantity;
  const InventoryEntry(this.item, this.quantity);

  InventoryEntry copyWith({Item? item, int? quantity}) =>
      InventoryEntry(item ?? this.item, quantity ?? this.quantity);
}

class AlertMessage {
  final String id;
  final String text;
  final DateTime time;
  const AlertMessage({
    required this.id,
    required this.text,
    required this.time,
  });
}

class ProfileData {
  final String name;
  final int level;
  final int gold;
  const ProfileData({
    required this.name,
    required this.level,
    required this.gold,
  });

  ProfileData copyWith({String? name, int? level, int? gold}) => ProfileData(
    name: name ?? this.name,
    level: level ?? this.level,
    gold: gold ?? this.gold,
  );
}

// ---------- Inventory ----------

class InventoryNotifier extends StateNotifier<List<InventoryEntry>> {
  InventoryNotifier()
    : super([
        InventoryEntry(
          const Item(id: 'wood', name: 'Wood', icon: Icons.park),
          12,
        ),
        InventoryEntry(
          const Item(id: 'stone', name: 'Stone', icon: Icons.terrain),
          8,
        ),
        InventoryEntry(
          const Item(id: 'fiber', name: 'Fiber', icon: Icons.grass),
          20,
        ),
      ]);

  void addItem(Item item, int qty) {
    final idx = state.indexWhere((e) => e.item.id == item.id);
    if (idx >= 0) {
      final updated = [...state];
      updated[idx] = updated[idx].copyWith(
        quantity: updated[idx].quantity + qty,
      );
      state = updated;
    } else {
      state = [...state, InventoryEntry(item, qty)];
    }
  }
}

final inventoryProvider =
    StateNotifierProvider<InventoryNotifier, List<InventoryEntry>>(
      (ref) => InventoryNotifier(),
    );

// ---------- Profile ----------

class ProfileNotifier extends StateNotifier<ProfileData> {
  ProfileNotifier()
    : super(const ProfileData(name: 'Farmer', level: 1, gold: 250));

  bool spendGold(int amount) {
    if (state.gold >= amount) {
      state = state.copyWith(gold: state.gold - amount);
      return true;
    }
    return false;
  }

  void earnGold(int amount) {
    state = state.copyWith(gold: state.gold + amount);
  }

  void rename(String name) {
    state = state.copyWith(name: name);
  }
}

final profileProvider = StateNotifierProvider<ProfileNotifier, ProfileData>(
  (ref) => ProfileNotifier(),
);

// ---------- Shop ----------

final shopCatalogProvider = Provider<Map<ShopCategory, List<ShopItem>>>((ref) {
  const carrot = Item(id: 'carrot_seed', name: 'Carrot Seeds', icon: Icons.spa);
  const potato = Item(id: 'potato_seed', name: 'Potato Seeds', icon: Icons.spa);
  const bread = Item(id: 'bread', name: 'Bread', icon: Icons.bakery_dining);
  const milk = Item(id: 'milk', name: 'Milk', icon: Icons.local_drink);
  const hoe = Item(id: 'hoe', name: 'Hoe', icon: Icons.construction);
  const scarecrow = Item(
    id: 'scarecrow',
    name: 'Scarecrow',
    icon: Icons.agriculture,
  );
  return {
    ShopCategory.groceries: [
      ShopItem(item: bread, price: 10, category: ShopCategory.groceries),
      ShopItem(item: milk, price: 12, category: ShopCategory.groceries),
    ],
    ShopCategory.seeds: [
      ShopItem(item: carrot, price: 15, category: ShopCategory.seeds),
      ShopItem(item: potato, price: 20, category: ShopCategory.seeds),
    ],
    ShopCategory.utility: [
      ShopItem(item: hoe, price: 50, category: ShopCategory.utility),
      ShopItem(item: scarecrow, price: 80, category: ShopCategory.utility),
    ],
  };
});

// ---------- Alerts ----------

class AlertsNotifier extends StateNotifier<List<AlertMessage>> {
  AlertsNotifier()
    : super([
        AlertMessage(
          id: 'a1',
          text: 'Welcome to Stardew Clicker! 🎉',
          time: DateTime.now().subtract(const Duration(minutes: 5)),
        ),
        AlertMessage(
          id: 'a2',
          text: 'Your crops are ready to harvest.',
          time: DateTime.now().subtract(const Duration(minutes: 1)),
        ),
      ]);

  void add(AlertMessage a) => state = [a, ...state];
  void clearAll() => state = [];
}

final alertsProvider =
    StateNotifierProvider<AlertsNotifier, List<AlertMessage>>(
      (ref) => AlertsNotifier(),
    );
