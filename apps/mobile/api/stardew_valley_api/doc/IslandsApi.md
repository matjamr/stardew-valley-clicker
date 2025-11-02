# stardew_valley_api.api.IslandsApi

## Load the API package
```dart
import 'package:stardew_valley_api/api.dart';
```

All URIs are relative to */api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**collectTerrainCollectable**](IslandsApi.md#collectterraincollectable) | **POST** /islands/{id}/terrain-collectables/{collectableId}/collect | Collect a terrain collectable and receive rewards
[**createIsland**](IslandsApi.md#createisland) | **POST** /islands | Create a new island
[**generateCollectables**](IslandsApi.md#generatecollectables) | **POST** /islands/{id}/generate-collectables | Generate random terrain collectables for island
[**listAllIslands**](IslandsApi.md#listallislands) | **GET** /islands | List all islands (optionally filtered by ownerId)
[**readIsland**](IslandsApi.md#readisland) | **GET** /islands/{id} | Read island by ID
[**updateIsland**](IslandsApi.md#updateisland) | **PUT** /islands/{id} | Update island


# **collectTerrainCollectable**
> CollectTerrainCollectableResponse collectTerrainCollectable(id, collectableId)

Collect a terrain collectable and receive rewards

### Example
```dart
import 'package:stardew_valley_api/api.dart';

final api = StardewValleyApi().getIslandsApi();
final String id = id_example; // String | Island ID
final String collectableId = collectableId_example; // String | Terrain collectable ID

try {
    final response = api.collectTerrainCollectable(id, collectableId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling IslandsApi->collectTerrainCollectable: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Island ID | 
 **collectableId** | **String**| Terrain collectable ID | 

### Return type

[**CollectTerrainCollectableResponse**](CollectTerrainCollectableResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createIsland**
> CreateIslandResponse createIsland(createIslandRequest)

Create a new island

### Example
```dart
import 'package:stardew_valley_api/api.dart';

final api = StardewValleyApi().getIslandsApi();
final CreateIslandRequest createIslandRequest = ; // CreateIslandRequest | 

try {
    final response = api.createIsland(createIslandRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling IslandsApi->createIsland: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createIslandRequest** | [**CreateIslandRequest**](CreateIslandRequest.md)|  | 

### Return type

[**CreateIslandResponse**](CreateIslandResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **generateCollectables**
> GenerateCollectablesResponse generateCollectables(id, count)

Generate random terrain collectables for island

### Example
```dart
import 'package:stardew_valley_api/api.dart';

final api = StardewValleyApi().getIslandsApi();
final String id = id_example; // String | 
final int count = 56; // int | 

try {
    final response = api.generateCollectables(id, count);
    print(response);
} catch on DioException (e) {
    print('Exception when calling IslandsApi->generateCollectables: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **count** | **int**|  | [optional] 

### Return type

[**GenerateCollectablesResponse**](GenerateCollectablesResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listAllIslands**
> ListAllIslandsResponse listAllIslands(ownerId)

List all islands (optionally filtered by ownerId)

### Example
```dart
import 'package:stardew_valley_api/api.dart';

final api = StardewValleyApi().getIslandsApi();
final String ownerId = ownerId_example; // String | Filter islands by owner ID

try {
    final response = api.listAllIslands(ownerId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling IslandsApi->listAllIslands: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ownerId** | **String**| Filter islands by owner ID | [optional] 

### Return type

[**ListAllIslandsResponse**](ListAllIslandsResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **readIsland**
> ReadIslandResponse readIsland(id)

Read island by ID

### Example
```dart
import 'package:stardew_valley_api/api.dart';

final api = StardewValleyApi().getIslandsApi();
final String id = id_example; // String | 

try {
    final response = api.readIsland(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling IslandsApi->readIsland: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**ReadIslandResponse**](ReadIslandResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateIsland**
> UpdateIslandResponse updateIsland(id, updateIslandRequest)

Update island

### Example
```dart
import 'package:stardew_valley_api/api.dart';

final api = StardewValleyApi().getIslandsApi();
final String id = id_example; // String | 
final UpdateIslandRequest updateIslandRequest = ; // UpdateIslandRequest | 

try {
    final response = api.updateIsland(id, updateIslandRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling IslandsApi->updateIsland: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **updateIslandRequest** | [**UpdateIslandRequest**](UpdateIslandRequest.md)|  | 

### Return type

[**UpdateIslandResponse**](UpdateIslandResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

