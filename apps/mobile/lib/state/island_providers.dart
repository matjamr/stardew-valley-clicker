import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

// Simple models for islands and variants (mocked)
class IslandSummary {
  final String id;
  final String name;
  final String variantKey;

  IslandSummary({
    required this.id,
    required this.name,
    required this.variantKey,
  });
}

class IslandVariant {
  final String key;
  final String title;
  final String description;

  IslandVariant({
    required this.key,
    required this.title,
    required this.description,
  });
}

// Mock repository that simulates network calls with small delays
class IslandRepository {
  // pretend we have some existing islands
  final List<IslandSummary> _islands = [
    IslandSummary(id: 'isl-001', name: 'Pelican Farm', variantKey: 'standard'),
  ];

  final List<IslandVariant> _variants = [
    IslandVariant(
      key: 'standard',
      title: 'Standard Farm',
      description: 'A simple plot of land to get you started.',
    ),
    IslandVariant(
      key: 'riverland',
      title: 'Riverland Farm',
      description: 'Lots of water, great for fishing enthusiasts.',
    ),
    IslandVariant(
      key: 'forest',
      title: 'Forest Farm',
      description: 'Plenty of forageable items and hardwood stumps.',
    ),
  ];

  Future<List<IslandSummary>> fetchIslands() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return List<IslandSummary>.from(_islands);
  }

  Future<List<IslandVariant>> fetchVariants() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return List<IslandVariant>.from(_variants);
  }

  Future<String> createIsland({
    required String name,
    required String variantKey,
    String? description,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 700));
    final id = 'isl-${DateTime.now().millisecondsSinceEpoch}';
    _islands.add(IslandSummary(id: id, name: name, variantKey: variantKey));
    return id;
  }

  Future<bool> enterIsland(String islandId) async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    // verify exists
    return _islands.any((e) => e.id == islandId);
  }
}

// Providers
final islandRepositoryProvider = Provider<IslandRepository>(
  (ref) => IslandRepository(),
);

final islandsProvider = FutureProvider<List<IslandSummary>>((ref) async {
  final repo = ref.watch(islandRepositoryProvider);
  return repo.fetchIslands();
});

final islandVariantsProvider = FutureProvider<List<IslandVariant>>((ref) async {
  final repo = ref.watch(islandRepositoryProvider);
  return repo.fetchVariants();
});

// Selected island id after choosing/creating
final selectedIslandIdProvider = StateProvider<String?>((ref) => null);
