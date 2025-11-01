import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/game/model/location.dart';
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
