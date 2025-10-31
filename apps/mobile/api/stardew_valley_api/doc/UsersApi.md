# stardew_valley_api.api.UsersApi

## Load the API package
```dart
import 'package:stardew_valley_api/api.dart';
```

All URIs are relative to */api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**retrieveUser**](UsersApi.md#retrieveuser) | **GET** /users/{id} | Retrieve a user by ID
[**saveUser**](UsersApi.md#saveuser) | **POST** /users | Create a new user


# **retrieveUser**
> RetrieveUserResponse retrieveUser(id)

Retrieve a user by ID

### Example
```dart
import 'package:stardew_valley_api/api.dart';

final api = StardewValleyApi().getUsersApi();
final String id = id_example; // String | 

try {
    final response = api.retrieveUser(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->retrieveUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**RetrieveUserResponse**](RetrieveUserResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **saveUser**
> SaveUserResponse saveUser(saveUserRequest)

Create a new user

### Example
```dart
import 'package:stardew_valley_api/api.dart';

final api = StardewValleyApi().getUsersApi();
final SaveUserRequest saveUserRequest = ; // SaveUserRequest | 

try {
    final response = api.saveUser(saveUserRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->saveUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **saveUserRequest** | [**SaveUserRequest**](SaveUserRequest.md)|  | 

### Return type

[**SaveUserResponse**](SaveUserResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

