import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/state/app_providers.dart';
import 'package:stardew_valley_api/stardew_valley_api.dart';

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
  final String? collectableId; // ID for terrain collectables (bushes, rocks, trees)
  final int? timerDurationSeconds; // Duration in seconds from Asset's TimerInfo
  final String? assetUrl; // Image URL from Asset (e.g., 'assets/images/bush.png')
  const TerrainTileSpec({
    required this.x,
    required this.y,
    this.sizeX = 1,
    this.sizeY = 1,
    required this.kind,
    this.collectableId,
    this.timerDurationSeconds,
    this.assetUrl,
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
  }) : _eventsApi = eventsApi,
       _islandVariantsApi = islandVariantsApi,
       _islandsApi = islandsApi;

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
    // No pre-existing tiles - only show background image
    return TerrainSpec(
      id: 'terrain-mines',
      name: 'Mines',
      blockSize: 16,
      sizeX: cols,
      sizeY: rows,
      tiles: [], // Empty - background image only
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
    // No tiles - only show background image
    return TerrainSpec(
      id: 'terrain-barn',
      name: 'Barn',
      blockSize: 16,
      sizeX: cols,
      sizeY: rows,
      tiles: [], // Empty - background image only
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

  Future<List<IslandSummary>> fetchIslands({String? ownerId}) async {
    try {
      final response = await _islandsApi.listAllIslands(ownerId: ownerId);
      final islands = response.data?.islands;

      if (islands == null || islands.isEmpty) {
        return [];
      }

      // Convert from API models to local IslandSummary
      return islands
          .map(
            (apiIsland) => IslandSummary(
              id: apiIsland.id ?? '',
              name: apiIsland.name ?? 'Unknown',
              variantKey: apiIsland.namedVariant ?? '',
            ),
          )
          .toList();
    } catch (e) {
      // Fallback to empty list on error
      return [];
    }
  }

  Future<List<IslandVariant>> fetchVariants() async {
    try {
      final response = await _islandVariantsApi.listAllIslandVariants();
      final variants = response.data;

      if (variants == null) {
        return [];
      }

      // Convert from API models to local models
      return variants
          .map(
            (apiVariant) => IslandVariant(
              key: apiVariant.id ?? '',
              title: apiVariant.name ?? 'Unknown',
              description: apiVariant.namedVariant ?? '',
              terrains:
                  [], // Empty for now - terrains are not needed for variant selection
            ),
          )
          .toList();
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

      return islandId;
    } catch (e) {
      throw Exception('Failed to create island: $e');
    }
  }

  Future<UpdateIslandResponse> updateIsland(
    String islandId,
    UpdateIslandRequest request,
  ) async {
    try {
      final response = await _islandsApi.updateIsland(
        id: islandId,
        updateIslandRequest: request,
      );

      if (response.data == null) {
        throw Exception('Failed to update island: no response data');
      }

      return response.data!;
    } catch (e) {
      throw Exception('Failed to update island: $e');
    }
  }

  Future<GenerateCollectablesResponse> generateCollectables(String islandId, {int? count}) async {
    try {
      final response = await _islandsApi.generateCollectables(
        id: islandId,
        count: count,
      );

      if (response.data == null) {
        throw Exception('Failed to generate collectables: no response data');
      }

      return response.data!;
    } catch (e) {
      throw Exception('Failed to generate collectables: $e');
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

    // Convert farm terrainCollectables to terrain tiles
    final tiles = <TerrainTileSpec>[];

    // Add terrainCollectables (bushes, rocks, trees) from backend
    if (farm.terrainCollectables != null) {
      for (final collectable in farm.terrainCollectables!) {
        // Skip already collected items
        if (collectable.isCollected == true) continue;

        // Map terrain collectable type to TileKind
        TileKind kind;
        switch (collectable.type?.name) {
          case 'BUSH':
            kind = TileKind.grass; // Use grass for bushes
            break;
          case 'ROCK':
            kind = TileKind.rock;
            break;
          case 'TREE':
            kind = TileKind.tree;
            break;
          default:
            kind = TileKind.grass;
        }

        // Extract timer duration and asset URL from asset
        int? timerDuration;
        String? assetUrl;
        if (collectable.asset?.onClickAction?.timerInfo?.durationSeconds != null) {
          timerDuration = collectable.asset!.onClickAction!.timerInfo!.durationSeconds!.toInt();
        }
        if (collectable.asset?.url != null) {
          assetUrl = collectable.asset!.url;
        }

        tiles.add(
          TerrainTileSpec(
            x: collectable.x ?? 0,
            y: collectable.y ?? 0,
            sizeX: collectable.sizeX ?? 1,
            sizeY: collectable.sizeY ?? 1,
            kind: kind,
            collectableId: collectable.id,
            timerDurationSeconds: timerDuration,
            assetUrl: assetUrl,
          ),
        );
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
    try {
      // Verify island exists by attempting to fetch it
      final response = await _islandsApi.readIsland(id: islandId);
      return response.data?.island != null;
    } catch (e) {
      return false;
    }
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
  Future<int> collectField({required String eventId}) async {
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

  // Collect a terrain collectable (bush, rock, tree)
  Future<int> collectTerrainCollectable({
    required String islandId,
    required String collectableId,
  }) async {
    try {
      final response = await _islandsApi.collectTerrainCollectable(
        id: islandId,
        collectableId: collectableId,
      );

      if (response.data == null || response.data!.success != true) {
        throw Exception(response.data?.message ?? 'Failed to collect');
      }

      // Extract gold reward from rewards
      final rewards = response.data!.rewards;
      if (rewards?.resources != null && rewards!.resources!.isNotEmpty) {
        final goldReward = rewards.resources!.firstWhere(
          (r) => r.resourceId == 'gold',
          orElse: () => ResourceReward((b) => b
            ..resourceId = 'gold'
            ..amount = 0),
        );
        return goldReward.amount ?? 0;
      }

      return 0;
    } catch (e) {
      throw Exception('Failed to collect terrain collectable: $e');
    }
  }
}

class FieldEventResult {
  final String eventId;
  final DateTime executionDate;

  FieldEventResult({required this.eventId, required this.executionDate});
}

// Providers
final islandRepositoryProvider = Provider<IslandRepository>((ref) {
  final eventsApi = ref.watch(eventsApiProvider);
  final islandVariantsApi = ref.watch(islandVariantsApiProvider);
  final islandsApi = ref.watch(islandsApiProvider);
  return IslandRepository(
    eventsApi: eventsApi,
    islandVariantsApi: islandVariantsApi,
    islandsApi: islandsApi,
  );
});

final islandsProvider = FutureProvider<List<IslandSummary>>((ref) async {
  final repo = ref.watch(islandRepositoryProvider);
  final userId = ref.watch(userIdProvider);
  return repo.fetchIslands(ownerId: userId);
});

final islandVariantsProvider = FutureProvider<List<IslandVariant>>((ref) async {
  final repo = ref.watch(islandRepositoryProvider);
  return repo.fetchVariants();
});

// Selected island id after choosing/creating
final selectedIslandIdProvider = StateProvider<String?>((ref) => null);

// Fetch island data from backend
final selectedIslandDataProvider = FutureProvider<ReadIslandResponse?>((
  ref,
) async {
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
  final islandAsync = ref.watch(selectedIslandDataProvider);
  return islandAsync.when(
    data: (islandResponse) => islandResponse?.island?.namedVariant,
    loading: () => null,
    error: (_, __) => null,
  );
});
