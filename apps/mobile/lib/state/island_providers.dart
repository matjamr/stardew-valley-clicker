import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stardew_valley_api/stardew_valley_api.dart';
import 'package:mobile/state/app_providers.dart';
import 'package:built_collection/built_collection.dart';

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

enum TileKind { soil, water, rock, path, grass, tree }

class TerrainTileSpec {
  final int x;
  final int y;
  final int sizeX;
  final int sizeY;
  final TileKind kind;
  const TerrainTileSpec({
    required this.x,
    required this.y,
    this.sizeX = 1,
    this.sizeY = 1,
    required this.kind,
  });
}

class TerrainSpec {
  final String id;
  final String name;
  final int blockSize; // px size of a tile when rendered
  final int sizeX; // columns
  final int sizeY; // rows
  final List<TerrainTileSpec> tiles;
  const TerrainSpec({
    required this.id,
    required this.name,
    required this.blockSize,
    required this.sizeX,
    required this.sizeY,
    required this.tiles,
  });
}

class IslandVariant {
  final String key;
  final String title;
  final String description;
  final List<TerrainSpec> terrains;

  IslandVariant({
    required this.key,
    required this.title,
    required this.description,
    required this.terrains,
  });
}

// Repository for island and event operations
class IslandRepository {
  final EventsApi _eventsApi;
  final IslandVariantsApi _islandVariantsApi;
  final IslandsApi _islandsApi;

  IslandRepository({
    required EventsApi eventsApi,
    required IslandVariantsApi islandVariantsApi,
    required IslandsApi islandsApi,
  })  : _eventsApi = eventsApi,
        _islandVariantsApi = islandVariantsApi,
        _islandsApi = islandsApi;
  // pretend we have some existing islands
  final List<IslandSummary> _islands = [
    IslandSummary(id: 'isl-001', name: 'Pelican Farm', variantKey: 'standard'),
  ];

  // Helpers to read island info synchronously (mocked storage)
  IslandSummary? getIslandById(String id) {
    try {
      return _islands.firstWhere((e) => e.id == id);
    } catch (_) {
      return null;
    }
  }

  String? getVariantForIsland(String islandId) =>
      getIslandById(islandId)?.variantKey;

  List<TerrainTileSpec> _genBorderPath(int cols, int rows) {
    final tiles = <TerrainTileSpec>[];
    for (var x = 0; x < cols; x++) {
      tiles.add(TerrainTileSpec(x: x, y: 0, kind: TileKind.path));
      tiles.add(TerrainTileSpec(x: x, y: rows - 1, kind: TileKind.path));
    }
    for (var y = 0; y < rows; y++) {
      tiles.add(TerrainTileSpec(x: 0, y: y, kind: TileKind.path));
      tiles.add(TerrainTileSpec(x: cols - 1, y: y, kind: TileKind.path));
    }
    return tiles;
  }

  TerrainSpec _standardFarm() {
    const cols = 12;
    const rows = 8;
    final tiles = <TerrainTileSpec>[];
    tiles.addAll(_genBorderPath(cols, rows));
    // soil fill with a small water pond and few rocks
    for (var y = 1; y < rows - 1; y++) {
      for (var x = 1; x < cols - 1; x++) {
        tiles.add(TerrainTileSpec(x: x, y: y, kind: TileKind.soil));
      }
    }
    // pond 2x2 at top-left
    tiles.add(
      TerrainTileSpec(x: 2, y: 2, sizeX: 2, sizeY: 2, kind: TileKind.water),
    );
    // rocks
    tiles.add(TerrainTileSpec(x: 7, y: 3, kind: TileKind.rock));
    tiles.add(TerrainTileSpec(x: 9, y: 5, kind: TileKind.rock));
    return TerrainSpec(
      id: 'terrain-farm',
      name: 'Farm',
      blockSize: 16,
      sizeX: cols,
      sizeY: rows,
      tiles: tiles,
    );
  }

  TerrainSpec _riverlandMap() {
    const cols = 12;
    const rows = 8;
    final tiles = <TerrainTileSpec>[];
    tiles.addAll(_genBorderPath(cols, rows));
    // create vertical river through middle
    final riverX = cols ~/ 2;
    for (var y = 1; y < rows - 1; y++) {
      tiles.add(TerrainTileSpec(x: riverX, y: y, kind: TileKind.water));
      if (riverX + 1 < cols - 1) {
        tiles.add(TerrainTileSpec(x: riverX + 1, y: y, kind: TileKind.water));
      }
    }
    // rest soil
    for (var y = 1; y < rows - 1; y++) {
      for (var x = 1; x < cols - 1; x++) {
        // skip water
        if ((x == riverX || x == riverX + 1)) continue;
        tiles.add(TerrainTileSpec(x: x, y: y, kind: TileKind.soil));
      }
    }
    return TerrainSpec(
      id: 'terrain-river',
      name: 'Riverland',
      blockSize: 16,
      sizeX: cols,
      sizeY: rows,
      tiles: tiles,
    );
  }

  TerrainSpec _forestMap() {
    const cols = 12;
    const rows = 8;
    final tiles = <TerrainTileSpec>[];
    tiles.addAll(_genBorderPath(cols, rows));
    // grass base with scattered trees and a pond
    for (var y = 1; y < rows - 1; y++) {
      for (var x = 1; x < cols - 1; x++) {
        tiles.add(TerrainTileSpec(x: x, y: y, kind: TileKind.grass));
      }
    }
    // small pond
    tiles.add(
      TerrainTileSpec(x: 3, y: 5, sizeX: 2, sizeY: 2, kind: TileKind.water),
    );
    // trees clusters
    tiles.add(TerrainTileSpec(x: 8, y: 3, kind: TileKind.tree));
    tiles.add(TerrainTileSpec(x: 9, y: 3, kind: TileKind.tree));
    tiles.add(TerrainTileSpec(x: 8, y: 4, kind: TileKind.tree));
    return TerrainSpec(
      id: 'terrain-forest',
      name: 'Forest',
      blockSize: 16,
      sizeX: cols,
      sizeY: rows,
      tiles: tiles,
    );
  }

  TerrainSpec _minesMap() {
    const cols = 12;
    const rows = 8;
    final tiles = <TerrainTileSpec>[];
    tiles.addAll(_genBorderPath(cols, rows));
    // rocky base with some paths
    for (var y = 1; y < rows - 1; y++) {
      for (var x = 1; x < cols - 1; x++) {
        tiles.add(TerrainTileSpec(x: x, y: y, kind: TileKind.rock));
      }
    }
    // carve meandering path
    for (var x = 2; x < cols - 2; x++) {
      final y = 2 + (x % 3);
      tiles.add(TerrainTileSpec(x: x, y: y, kind: TileKind.path));
    }
    return TerrainSpec(
      id: 'terrain-mines',
      name: 'Mines',
      blockSize: 16,
      sizeX: cols,
      sizeY: rows,
      tiles: tiles,
    );
  }

  TerrainSpec _fishingMap() {
    const cols = 12;
    const rows = 8;
    final tiles = <TerrainTileSpec>[];
    tiles.addAll(_genBorderPath(cols, rows));
    // mostly water with small docks (paths)
    for (var y = 1; y < rows - 1; y++) {
      for (var x = 1; x < cols - 1; x++) {
        tiles.add(TerrainTileSpec(x: x, y: y, kind: TileKind.water));
      }
    }
    // add two docks
    for (var x = 2; x < 5; x++) {
      tiles.add(TerrainTileSpec(x: x, y: rows - 2, kind: TileKind.path));
    }
    for (var y = 2; y < 5; y++) {
      tiles.add(TerrainTileSpec(x: cols - 3, y: y, kind: TileKind.path));
    }
    return TerrainSpec(
      id: 'terrain-fishing',
      name: 'Fishing',
      blockSize: 16,
      sizeX: cols,
      sizeY: rows,
      tiles: tiles,
    );
  }

  TerrainSpec _barnMap() {
    const cols = 12;
    const rows = 8;
    final tiles = <TerrainTileSpec>[];
    tiles.addAll(_genBorderPath(cols, rows));
    // grassy with central pen (path outline)
    for (var y = 1; y < rows - 1; y++) {
      for (var x = 1; x < cols - 1; x++) {
        tiles.add(TerrainTileSpec(x: x, y: y, kind: TileKind.grass));
      }
    }
    // pen rectangle
    for (var x = 4; x <= 7; x++) {
      tiles.add(TerrainTileSpec(x: x, y: 3, kind: TileKind.path));
      tiles.add(TerrainTileSpec(x: x, y: 6, kind: TileKind.path));
    }
    for (var y = 3; y <= 6; y++) {
      tiles.add(TerrainTileSpec(x: 4, y: y, kind: TileKind.path));
      tiles.add(TerrainTileSpec(x: 7, y: y, kind: TileKind.path));
    }
    return TerrainSpec(
      id: 'terrain-barn',
      name: 'Barn',
      blockSize: 16,
      sizeX: cols,
      sizeY: rows,
      tiles: tiles,
    );
  }

  TerrainSpec getTerrainForVariant(String variantKey, String locationKey) {
    // In a real app, this would depend on variantKey; for now we vary by location
    switch (locationKey) {
      case 'farm':
        if (variantKey == 'riverland') return _riverlandMap();
        if (variantKey == 'forest') return _forestMap();
        return _standardFarm();
      case 'fishing':
        return _fishingMap();
      case 'barn':
        return _barnMap();
      case 'mines':
        return _minesMap();
      default:
        return _standardFarm();
    }
  }

  late final List<IslandVariant> _variants = [
    IslandVariant(
      key: 'standard',
      title: 'Standard Farm',
      description: 'A simple plot of land to get you started.',
      terrains: [_standardFarm()],
    ),
    IslandVariant(
      key: 'riverland',
      title: 'Riverland Farm',
      description: 'Lots of water, great for fishing enthusiasts.',
      terrains: [_riverlandMap()],
    ),
    IslandVariant(
      key: 'forest',
      title: 'Forest Farm',
      description: 'Plenty of forageable items and hardwood stumps.',
      terrains: [_forestMap()],
    ),
  ];

  Future<List<IslandSummary>> fetchIslands() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return List<IslandSummary>.from(_islands);
  }

  Future<List<IslandVariant>> fetchVariants() async {
    try {
      final response = await _islandVariantsApi.listAllIslandVariants();
      final variants = response.data;

      if (variants == null) {
        return [];
      }

      // Convert from API models to local models
      return variants.map((apiVariant) => IslandVariant(
        key: apiVariant.id ?? '',
        title: apiVariant.name ?? 'Unknown',
        description: apiVariant.namedVariant ?? '',
        terrains: [], // Empty for now - terrains are not needed for variant selection
      )).toList();
    } catch (e) {
      throw Exception('Failed to fetch island variants: $e');
    }
  }

  Future<String> createIsland({
    required String name,
    required String variantId,
    required String userId,
  }) async {
    try {
      final request = CreateIslandRequestBuilder()
        ..userId = userId
        ..variantId = variantId
        ..name = name;

      final response = await _islandsApi.createIsland(
        createIslandRequest: request.build(),
      );

      final islandId = response.data?.id;
      if (islandId == null) {
        throw Exception('Failed to create island: no ID returned');
      }

      // Add to local cache
      _islands.add(IslandSummary(
        id: islandId,
        name: name,
        variantKey: variantId,
      ));

      return islandId;
    } catch (e) {
      throw Exception('Failed to create island: $e');
    }
  }

  Future<ReadIslandResponse?> fetchIsland(String islandId) async {
    try {
      final response = await _islandsApi.readIsland(id: islandId);
      return response.data;
    } catch (e) {
      throw Exception('Failed to fetch island: $e');
    }
  }

  TerrainSpec? getFarmTerrainFromIsland(ReadIslandResponse? islandResponse) {
    if (islandResponse == null || islandResponse.island == null) return null;

    final island = islandResponse.island!;
    final farm = island.farm;

    if (farm == null) return null;

    // Convert farm plots and decorations to terrain tiles
    final tiles = <TerrainTileSpec>[];

    // Add plots as soil tiles
    if (farm.plots != null) {
      for (final plot in farm.plots!) {
        tiles.add(TerrainTileSpec(
          x: plot.x ?? 0,
          y: plot.y ?? 0,
          sizeX: plot.sizeX ?? 1,
          sizeY: plot.sizeY ?? 1,
          kind: TileKind.soil,
        ));
      }
    }

    // Add decorations
    if (farm.decorations != null) {
      for (final decoration in farm.decorations!) {
        tiles.add(TerrainTileSpec(
          x: decoration.x ?? 0,
          y: decoration.y ?? 0,
          sizeX: decoration.sizeX ?? 1,
          sizeY: decoration.sizeY ?? 1,
          kind: TileKind.path,
        ));
      }
    }

    return TerrainSpec(
      id: farm.id ?? 'farm',
      name: farm.name ?? 'Farm',
      blockSize: farm.blockSize ?? 16,
      sizeX: farm.sizeX ?? 12,
      sizeY: farm.sizeY ?? 8,
      tiles: tiles,
    );
  }

  Future<bool> enterIsland(String islandId) async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    // verify exists
    return _islands.any((e) => e.id == islandId);
  }

  // Create an event when a field is clicked
  // Returns the event details including ID and execution time
  Future<FieldEventResult> startFieldEvent({
    required String islandId,
    required String userId,
    required String terrainId,
    required int x,
    required int y,
    required Duration duration,
  }) async {
    // Create unique resource ID from terrain and coordinates
    final resourceId = '$terrainId:$x:$y';

    final now = DateTime.now();
    final executionDate = now.add(duration);

    // Create event request
    final request = CreateEventRequestBuilder()
      ..islandId = islandId
      ..userId = userId
      ..resourceId = resourceId
      ..type = EventRequestTriggerType.MINES_TYPE;

    try {
      final response = await _eventsApi.createEvent(
        createEventRequest: request.build(),
      );

      final event = response.data;
      if (event?.id == null) {
        throw Exception('Failed to create event: no ID returned');
      }

      return FieldEventResult(
        eventId: event!.id!,
        executionDate: executionDate,
      );
    } catch (e) {
      throw Exception('Failed to create field event: $e');
    }
  }

  // Check event status (optional - can be used for polling)
  Future<ScheduledEvent?> getEventStatus(String eventId) async {
    try {
      final response = await _eventsApi.readEvent(id: eventId);
      return response.data?.event;
    } catch (e) {
      throw Exception('Failed to get event status: $e');
    }
  }

  // Collect field - verify event is completed and return reward
  Future<int> collectField({
    required String eventId,
  }) async {
    try {
      // Verify event is completed
      final event = await getEventStatus(eventId);

      if (event?.status != ScheduledEventStatusEnum.COMPLETED) {
        throw Exception('Event not completed yet');
      }

      // In real implementation, the reward would come from the server
      // For now, return a mock amount based on event creation time
      final base = (event?.id?.hashCode ?? 0) % 3;
      switch (base) {
        case 0:
          return 5;
        case 1:
          return 8;
        default:
          return 12;
      }
    } catch (e) {
      throw Exception('Failed to collect field: $e');
    }
  }
}

class FieldEventResult {
  final String eventId;
  final DateTime executionDate;

  FieldEventResult({
    required this.eventId,
    required this.executionDate,
  });
}

// Providers
final islandRepositoryProvider = Provider<IslandRepository>(
  (ref) {
    final eventsApi = ref.watch(eventsApiProvider);
    final islandVariantsApi = ref.watch(islandVariantsApiProvider);
    final islandsApi = ref.watch(islandsApiProvider);
    return IslandRepository(
      eventsApi: eventsApi,
      islandVariantsApi: islandVariantsApi,
      islandsApi: islandsApi,
    );
  },
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

// Fetch island data from backend
final selectedIslandDataProvider = FutureProvider<ReadIslandResponse?>((ref) async {
  final id = ref.watch(selectedIslandIdProvider);
  if (id == null) return null;

  final repo = ref.watch(islandRepositoryProvider);
  return repo.fetchIsland(id);
});

// Derived: Get farm terrain from selected island
final selectedIslandFarmTerrainProvider = Provider<TerrainSpec?>((ref) {
  final islandAsync = ref.watch(selectedIslandDataProvider);

  return islandAsync.when(
    data: (islandResponse) {
      if (islandResponse == null) return null;
      final repo = ref.watch(islandRepositoryProvider);
      return repo.getFarmTerrainFromIsland(islandResponse);
    },
    loading: () => null,
    error: (_, __) => null,
  );
});

// Derived: selected island's variant key (null if not available)
final selectedIslandVariantKeyProvider = Provider<String?>((ref) {
  final id = ref.watch(selectedIslandIdProvider);
  if (id == null) return null;
  final repo = ref.watch(islandRepositoryProvider);
  return repo.getVariantForIsland(id);
});
