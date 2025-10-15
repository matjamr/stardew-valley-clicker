# stardew_valley_api.api.AssetsApi

## Load the API package
```dart
import 'package:stardew_valley_api/api.dart';
```

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createAsset**](AssetsApi.md#createasset) | **POST** /assets | Create a new asset
[**readAsset**](AssetsApi.md#readasset) | **GET** /assets/{id} | Read an asset by ID


# **createAsset**
> CreateAssetResponse createAsset(createAssetRequest)

Create a new asset

### Example
```dart
import 'package:stardew_valley_api/api.dart';

final api = StardewValleyApi().getAssetsApi();
final CreateAssetRequest createAssetRequest = ; // CreateAssetRequest | 

try {
    final response = api.createAsset(createAssetRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AssetsApi->createAsset: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createAssetRequest** | [**CreateAssetRequest**](CreateAssetRequest.md)|  | 

### Return type

[**CreateAssetResponse**](CreateAssetResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **readAsset**
> ReadAssetResponse readAsset(id)

Read an asset by ID

### Example
```dart
import 'package:stardew_valley_api/api.dart';

final api = StardewValleyApi().getAssetsApi();
final String id = id_example; // String | 

try {
    final response = api.readAsset(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AssetsApi->readAsset: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**ReadAssetResponse**](ReadAssetResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

