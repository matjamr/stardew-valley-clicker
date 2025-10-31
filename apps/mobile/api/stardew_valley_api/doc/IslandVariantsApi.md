# stardew_valley_api.api.IslandVariantsApi

## Load the API package
```dart
import 'package:stardew_valley_api/api.dart';
```

All URIs are relative to */api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**readIslandVariant**](IslandVariantsApi.md#readislandvariant) | **GET** /island-variants/{id} | Read island variant by ID


# **readIslandVariant**
> IslandVariant readIslandVariant(id)

Read island variant by ID

### Example
```dart
import 'package:stardew_valley_api/api.dart';

final api = StardewValleyApi().getIslandVariantsApi();
final String id = id_example; // String | 

try {
    final response = api.readIslandVariant(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling IslandVariantsApi->readIslandVariant: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**IslandVariant**](IslandVariant.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

