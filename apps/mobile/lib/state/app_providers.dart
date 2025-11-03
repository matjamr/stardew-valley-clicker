import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/game/model/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stardew_valley_api/stardew_valley_api.dart';

// Mock user ID for development
final userIdProvider = Provider<String>((ref) => 'user-001');

// Location selection for the game scene
final locationProvider = StateProvider<LocationArea>(
  (ref) => LocationArea.farm,
);

// Player energy (mocked for now)
final energyProvider = StateProvider<int>((ref) => 100);

// Notifications count (can be driven by a push stream later)
final notificationsCountProvider = StateProvider<int>((ref) => 2);

// A simple clock as an async stream example (updates every second)
final timeProvider = StreamProvider<TimeOfDay>((ref) {
  // The stream emits TimeOfDay.now() every second
  final controller = StreamController<TimeOfDay>();
  Timer? timer;
  void tick(_) => controller.add(TimeOfDay.now());
  timer = Timer.periodic(const Duration(seconds: 1), tick);
  // push initial value immediately
  controller.add(TimeOfDay.now());

  ref.onDispose(() {
    timer?.cancel();
    controller.close();
  });
  return controller.stream;
});

// HTTP client provider for network requests
final httpClientProvider = Provider<http.Client>((ref) => http.Client());

// API base URL - configure this based on environment and platform
final apiBaseUrlProvider = Provider<String>((ref) {
  // Backend server runs at http://localhost:8080
  // API endpoints are under /api path (servlet context path)

  if (kIsWeb) {
    // Web: use localhost
    return 'http://localhost:8080/api';
  }

  // Mobile platforms
  if (Platform.isAndroid) {
    // Android emulator: 10.0.2.2 maps to host machine's localhost
    // For physical device, use actual IP address (e.g., 'http://192.168.1.100:8080/api')
    return 'http://10.0.2.2:8080/api';
  } else if (Platform.isIOS) {
    // iOS simulator: localhost works fine
    // For physical device, use actual IP address (e.g., 'http://192.168.1.100:8080/api')
    return 'http://localhost:8080/api';
  }

  // Default fallback
  return 'http://localhost:8080/api';
});

// Dio client for Stardew Valley API
final dioClientProvider = Provider<Dio>((ref) {
  final baseUrl = ref.watch(apiBaseUrlProvider);
  final dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  ));

  // Add authentication interceptor
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) async {
      // Skip auth for login and refresh endpoints
      if (options.path.contains('/auth/login') ||
          options.path.contains('/auth/refresh') ||
          options.path.contains('/auth/verify')) {
        handler.next(options);
        return;
      }

      // Get current auth state and add Authorization header if token exists
      try {
        final authState = ref.read(authProvider);
        if (authState.accessToken != null) {
          options.headers['Authorization'] = 'Bearer ${authState.accessToken}';
        }
      } catch (e) {
        // Auth provider might not be initialized yet, continue without token
        debugPrint('Auth not available: $e');
      }
      handler.next(options);
    },
    onError: (error, handler) async {
      // If 401 error, try to refresh token
      if (error.response?.statusCode == 401) {
        try {
          await ref.read(authProvider.notifier).refreshAccessToken();

          // Retry the request with new token
          final options = error.requestOptions;
          final authState = ref.read(authProvider);
          if (authState.accessToken != null) {
            options.headers['Authorization'] = 'Bearer ${authState.accessToken}';
          }

          final response = await dio.fetch(options);
          handler.resolve(response);
          return;
        } catch (e) {
          // If refresh fails, pass the error
          debugPrint('Token refresh failed: $e');
          handler.next(error);
          return;
        }
      }
      handler.next(error);
    },
  ));

  // Add logging interceptor in debug mode
  if (kDebugMode) {
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
      error: true,
      logPrint: (obj) => debugPrint(obj.toString()),
    ));
  }

  return dio;
});

// Stardew Valley API instance
final stardewApiProvider = Provider<StardewValleyApi>((ref) {
  final dio = ref.watch(dioClientProvider);
  return StardewValleyApi(dio: dio);
});

// Separate Dio client for SecurityAPI to avoid circular dependency
final securityDioProvider = Provider<Dio>((ref) {
  final baseUrl = ref.watch(apiBaseUrlProvider);
  final dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  ));

  // Add logging interceptor in debug mode
  if (kDebugMode) {
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
      error: true,
      logPrint: (obj) => debugPrint(obj.toString()),
    ));
  }

  return dio;
});

// Events API
final eventsApiProvider = Provider<EventsApi>((ref) {
  final api = ref.watch(stardewApiProvider);
  return api.getEventsApi();
});

// Island Variants API
final islandVariantsApiProvider = Provider<IslandVariantsApi>((ref) {
  final api = ref.watch(stardewApiProvider);
  return api.getIslandVariantsApi();
});

// Islands API
final islandsApiProvider = Provider<IslandsApi>((ref) {
  final api = ref.watch(stardewApiProvider);
  return api.getIslandsApi();
});

// Shop API
final shopApiProvider = Provider<ShopApi>((ref) {
  final api = ref.watch(stardewApiProvider);
  return api.getShopApi();
});

// Security API (uses separate Dio client to avoid circular dependency)
final securityApiProvider = Provider<SecurityApi>((ref) {
  final dio = ref.watch(securityDioProvider);
  return SecurityApi(dio, standardSerializers);
});

// Example of a future provider to fetch some profile or game data later.
// Keeping it simple and unused in UI for now; shows how HTTP would be composed.
final exampleProfileProvider = FutureProvider<Map<String, dynamic>>((
  ref,
) async {
  final client = ref.read(httpClientProvider);
  // Replace with your backend URL
  final uri = Uri.parse('https://example.com/api/profile');
  try {
    final res = await client.get(uri).timeout(const Duration(seconds: 10));
    if (res.statusCode == 200) {
      // In real code, decode JSON; dummy payload for now.
      return {'name': 'Farmer', 'level': 1};
    }
  } catch (_) {
    // Swallow errors in example; surface via AsyncValue in UI if used.
  }
  // Fallback mock
  return {'name': 'Traveler', 'level': 0};
});

// ==============================================================================
// Authentication
// ==============================================================================

// State class to hold authentication data
class AuthState {
  final String? accessToken;
  final String? refreshToken;
  final bool isAuthenticated;
  final String? userEmail;

  const AuthState({
    this.accessToken,
    this.refreshToken,
    this.isAuthenticated = false,
    this.userEmail,
  });

  AuthState copyWith({
    String? accessToken,
    String? refreshToken,
    bool? isAuthenticated,
    String? userEmail,
  }) {
    return AuthState(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      userEmail: userEmail ?? this.userEmail,
    );
  }
}

// AuthNotifier to manage authentication state
class AuthNotifier extends StateNotifier<AuthState> {
  final SecurityApi _securityApi;

  AuthNotifier(this._securityApi) : super(const AuthState()) {
    _loadTokensFromStorage();
  }

  // Load tokens from shared preferences on app start
  Future<void> _loadTokensFromStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final accessToken = prefs.getString('access_token');
      final refreshToken = prefs.getString('refresh_token');
      final userEmail = prefs.getString('user_email');

      if (accessToken != null && refreshToken != null) {
        state = AuthState(
          accessToken: accessToken,
          refreshToken: refreshToken,
          isAuthenticated: true,
          userEmail: userEmail,
        );
      }
    } catch (e) {
      debugPrint('Failed to load tokens: $e');
    }
  }

  // Save tokens to shared preferences
  Future<void> _saveTokensToStorage({
    required String accessToken,
    required String refreshToken,
    String? userEmail,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('access_token', accessToken);
      await prefs.setString('refresh_token', refreshToken);
      if (userEmail != null) {
        await prefs.setString('user_email', userEmail);
      }
    } catch (e) {
      debugPrint('Failed to save tokens: $e');
    }
  }

  // Clear tokens from shared preferences
  Future<void> _clearTokensFromStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('access_token');
      await prefs.remove('refresh_token');
      await prefs.remove('user_email');
    } catch (e) {
      debugPrint('Failed to clear tokens: $e');
    }
  }

  // Login with email and password
  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      final request = LoginUserRequest((b) => b
        ..email = email
        ..password = password);

      final response = await _securityApi.loginUser(
        loginUserRequest: request,
      );

      if (response.data != null) {
        final accessToken = response.data!.accessToken;
        final refreshToken = response.data!.refreshToken;

        if (accessToken != null && refreshToken != null) {
          state = AuthState(
            accessToken: accessToken,
            refreshToken: refreshToken,
            isAuthenticated: true,
            userEmail: email,
          );

          await _saveTokensToStorage(
            accessToken: accessToken,
            refreshToken: refreshToken,
            userEmail: email,
          );
        }
      }
    } catch (e) {
      debugPrint('Login failed: $e');
      rethrow;
    }
  }

  // Refresh the access token using refresh token
  Future<void> refreshAccessToken() async {
    try {
      final currentRefreshToken = state.refreshToken;
      if (currentRefreshToken == null) {
        throw Exception('No refresh token available');
      }

      final request = RefreshTokenRequest((b) => b
        ..refreshToken = currentRefreshToken);

      final response = await _securityApi.refreshToken(
        refreshTokenRequest: request,
      );

      if (response.data != null && response.data!.accessToken != null) {
        final newAccessToken = response.data!.accessToken!;

        state = state.copyWith(accessToken: newAccessToken);

        await _saveTokensToStorage(
          accessToken: newAccessToken,
          refreshToken: currentRefreshToken,
          userEmail: state.userEmail,
        );
      }
    } catch (e) {
      debugPrint('Token refresh failed: $e');
      // If refresh fails, logout the user
      await logout();
      rethrow;
    }
  }

  // Logout and clear authentication state
  Future<void> logout() async {
    await _clearTokensFromStorage();
    state = const AuthState();
  }

  // Verify if current token is valid
  Future<bool> verifyToken() async {
    try {
      final accessToken = state.accessToken;
      if (accessToken == null) return false;

      final request = VerifyUserRequest((b) => b
        ..accessToken = accessToken);

      final response = await _securityApi.verifyUser(
        verifyUserRequest: request,
      );

      return response.data != null;
    } catch (e) {
      debugPrint('Token verification failed: $e');
      return false;
    }
  }
}

// Provider for AuthNotifier
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final securityApi = ref.watch(securityApiProvider);
  return AuthNotifier(securityApi);
});
