import 'package:test/test.dart';
import 'package:stardew_valley_api/stardew_valley_api.dart';

/// tests for ShopApi
void main() {
  final instance = StardewValleyApi().getShopApi();

  group(ShopApi, () {
    // Get shop item by ID
    //
    //Future<ShopItem> getShopItem(String id) async
    test('test getShopItem', () async {
      // TODO
    });

    // List all shop items (optionally filtered by category)
    //
    //Future<ListShopItemsResponse> listShopItems({ String category }) async
    test('test listShopItems', () async {
      // TODO
    });

    // Purchase an item from the shop
    //
    //Future<PurchaseItemResponse> purchaseItem(PurchaseItemRequest purchaseItemRequest) async
    test('test purchaseItem', () async {
      // TODO
    });
  });
}
