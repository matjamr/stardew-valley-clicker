# stardew_valley_api.api.IslandsApi

## Load the API package
```dart
import 'package:stardew_valley_api/api.dart';
```

All URIs are relative to */api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createIsland**](IslandsApi.md#createisland) | **POST** /islands | Create a new island
[**readIsland**](IslandsApi.md#readisland) | **GET** /islands/{id} | Read island by ID


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

