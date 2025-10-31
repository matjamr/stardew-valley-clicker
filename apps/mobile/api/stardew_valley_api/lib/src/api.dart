//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';
import 'package:stardew_valley_api/src/serializers.dart';
import 'package:stardew_valley_api/src/auth/api_key_auth.dart';
import 'package:stardew_valley_api/src/auth/basic_auth.dart';
import 'package:stardew_valley_api/src/auth/bearer_auth.dart';
import 'package:stardew_valley_api/src/auth/oauth.dart';
import 'package:stardew_valley_api/src/api/assets_api.dart';
import 'package:stardew_valley_api/src/api/events_api.dart';
import 'package:stardew_valley_api/src/api/island_variants_api.dart';
import 'package:stardew_valley_api/src/api/islands_api.dart';
import 'package:stardew_valley_api/src/api/security_api.dart';
import 'package:stardew_valley_api/src/api/users_api.dart';

class StardewValleyApi {
  static const String basePath = r'/api';

  final Dio dio;
  final Serializers serializers;

  StardewValleyApi({
    Dio? dio,
    Serializers? serializers,
    String? basePathOverride,
    List<Interceptor>? interceptors,
  })  : this.serializers = serializers ?? standardSerializers,
        this.dio = dio ??
            Dio(BaseOptions(
              baseUrl: basePathOverride ?? basePath,
              connectTimeout: const Duration(milliseconds: 5000),
              receiveTimeout: const Duration(milliseconds: 3000),
            )) {
    if (interceptors == null) {
      this.dio.interceptors.addAll([
        OAuthInterceptor(),
        BasicAuthInterceptor(),
        BearerAuthInterceptor(),
        ApiKeyAuthInterceptor(),
      ]);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }
  }

  void setOAuthToken(String name, String token) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor)
              as OAuthInterceptor)
          .tokens[name] = token;
    }
  }

  void setBearerAuth(String name, String token) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor)
              as BearerAuthInterceptor)
          .tokens[name] = token;
    }
  }

  void setBasicAuth(String name, String username, String password) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor)
              as BasicAuthInterceptor)
          .authInfo[name] = BasicAuthInfo(username, password);
    }
  }

  void setApiKey(String name, String apiKey) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this
                  .dio
                  .interceptors
                  .firstWhere((element) => element is ApiKeyAuthInterceptor)
              as ApiKeyAuthInterceptor)
          .apiKeys[name] = apiKey;
    }
  }

  /// Get AssetsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AssetsApi getAssetsApi() {
    return AssetsApi(dio, serializers);
  }

  /// Get EventsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  EventsApi getEventsApi() {
    return EventsApi(dio, serializers);
  }

  /// Get IslandVariantsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  IslandVariantsApi getIslandVariantsApi() {
    return IslandVariantsApi(dio, serializers);
  }

  /// Get IslandsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  IslandsApi getIslandsApi() {
    return IslandsApi(dio, serializers);
  }

  /// Get SecurityApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  SecurityApi getSecurityApi() {
    return SecurityApi(dio, serializers);
  }

  /// Get UsersApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  UsersApi getUsersApi() {
    return UsersApi(dio, serializers);
  }
}
