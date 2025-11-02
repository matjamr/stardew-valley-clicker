# stardew_valley_api.api.ShopApi

## Load the API package
```dart
import 'package:stardew_valley_api/api.dart';
```

All URIs are relative to */api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getShopItem**](ShopApi.md#getshopitem) | **GET** /shop/items/{id} | Get shop item by ID
[**listShopItems**](ShopApi.md#listshopitems) | **GET** /shop/items | List all shop items (optionally filtered by category)
[**purchaseItem**](ShopApi.md#purchaseitem) | **POST** /shop/purchase | Purchase an item from the shop


# **getShopItem**
> ShopItem getShopItem(id)

Get shop item by ID

### Example
```dart
import 'package:stardew_valley_api/api.dart';

final api = StardewValleyApi().getShopApi();
final String id = id_example; // String | 

try {
    final response = api.getShopItem(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ShopApi->getShopItem: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**ShopItem**](ShopItem.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listShopItems**
> ListShopItemsResponse listShopItems(category)

List all shop items (optionally filtered by category)

### Example
```dart
import 'package:stardew_valley_api/api.dart';

final api = StardewValleyApi().getShopApi();
final String category = category_example; // String | Filter items by category (SEEDS, TOOLS, FOOD, ANIMALS, BUILDINGS, FERTILIZER)

try {
    final response = api.listShopItems(category);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ShopApi->listShopItems: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **category** | **String**| Filter items by category (SEEDS, TOOLS, FOOD, ANIMALS, BUILDINGS, FERTILIZER) | [optional] 

### Return type

[**ListShopItemsResponse**](ListShopItemsResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **purchaseItem**
> PurchaseItemResponse purchaseItem(purchaseItemRequest)

Purchase an item from the shop

### Example
```dart
import 'package:stardew_valley_api/api.dart';

final api = StardewValleyApi().getShopApi();
final PurchaseItemRequest purchaseItemRequest = ; // PurchaseItemRequest | 

try {
    final response = api.purchaseItem(purchaseItemRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ShopApi->purchaseItem: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **purchaseItemRequest** | [**PurchaseItemRequest**](PurchaseItemRequest.md)|  | 

### Return type

[**PurchaseItemResponse**](PurchaseItemResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

