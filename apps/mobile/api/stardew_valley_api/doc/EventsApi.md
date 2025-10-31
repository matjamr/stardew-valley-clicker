# stardew_valley_api.api.EventsApi

## Load the API package
```dart
import 'package:stardew_valley_api/api.dart';
```

All URIs are relative to */api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createEvent**](EventsApi.md#createevent) | **POST** /events | Create a new scheduled event (trigger event execution)
[**readEvent**](EventsApi.md#readevent) | **GET** /events/{id} | Read event by ID


# **createEvent**
> CreateEventResponse createEvent(createEventRequest)

Create a new scheduled event (trigger event execution)

### Example
```dart
import 'package:stardew_valley_api/api.dart';

final api = StardewValleyApi().getEventsApi();
final CreateEventRequest createEventRequest = ; // CreateEventRequest | 

try {
    final response = api.createEvent(createEventRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventsApi->createEvent: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createEventRequest** | [**CreateEventRequest**](CreateEventRequest.md)|  | 

### Return type

[**CreateEventResponse**](CreateEventResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **readEvent**
> ReadEventResponse readEvent(id)

Read event by ID

### Example
```dart
import 'package:stardew_valley_api/api.dart';

final api = StardewValleyApi().getEventsApi();
final String id = id_example; // String | 

try {
    final response = api.readEvent(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventsApi->readEvent: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**ReadEventResponse**](ReadEventResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

