import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/game/model/location.dart';

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
