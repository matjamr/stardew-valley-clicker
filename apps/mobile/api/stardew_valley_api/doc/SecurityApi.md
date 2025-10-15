# stardew_valley_api.api.SecurityApi

## Load the API package
```dart
import 'package:stardew_valley_api/api.dart';
```

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**loginUser**](SecurityApi.md#loginuser) | **POST** /auth/login | Authenticate a user
[**refreshToken**](SecurityApi.md#refreshtoken) | **POST** /auth/refresh | Refresh an access token
[**verifyUser**](SecurityApi.md#verifyuser) | **POST** /auth/verify | Verify a user&#39;s access token


# **loginUser**
> LoginUserResponse loginUser(loginUserRequest)

Authenticate a user

### Example
```dart
import 'package:stardew_valley_api/api.dart';

final api = StardewValleyApi().getSecurityApi();
final LoginUserRequest loginUserRequest = ; // LoginUserRequest | 

try {
    final response = api.loginUser(loginUserRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SecurityApi->loginUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginUserRequest** | [**LoginUserRequest**](LoginUserRequest.md)|  | 

### Return type

[**LoginUserResponse**](LoginUserResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **refreshToken**
> RefreshTokenResponse refreshToken(refreshTokenRequest)

Refresh an access token

### Example
```dart
import 'package:stardew_valley_api/api.dart';

final api = StardewValleyApi().getSecurityApi();
final RefreshTokenRequest refreshTokenRequest = ; // RefreshTokenRequest | 

try {
    final response = api.refreshToken(refreshTokenRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SecurityApi->refreshToken: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **refreshTokenRequest** | [**RefreshTokenRequest**](RefreshTokenRequest.md)|  | 

### Return type

[**RefreshTokenResponse**](RefreshTokenResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **verifyUser**
> VerifyUserResponse verifyUser(verifyUserRequest)

Verify a user's access token

### Example
```dart
import 'package:stardew_valley_api/api.dart';

final api = StardewValleyApi().getSecurityApi();
final VerifyUserRequest verifyUserRequest = ; // VerifyUserRequest | 

try {
    final response = api.verifyUser(verifyUserRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SecurityApi->verifyUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **verifyUserRequest** | [**VerifyUserRequest**](VerifyUserRequest.md)|  | 

### Return type

[**VerifyUserResponse**](VerifyUserResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

