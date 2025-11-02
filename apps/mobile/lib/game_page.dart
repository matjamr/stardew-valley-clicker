import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/game/model/location.dart';
import 'package:mobile/game/my_game.dart';
import 'package:mobile/state/app_providers.dart';
import 'package:mobile/state/fishing.dart';
import 'package:mobile/state/island_providers.dart';
import 'package:mobile/ui/widgets/alerts_modal.dart';
import 'package:mobile/ui/widgets/bag_modal.dart';
import 'package:mobile/ui/widgets/fishing_minigame.dart';
import 'package:mobile/ui/widgets/game_bottom_bar.dart';
import 'package:mobile/ui/widgets/game_centered_modal.dart';
import 'package:mobile/ui/widgets/game_icon_button.dart';
import 'package:mobile/ui/widgets/hud_pill.dart';
import 'package:mobile/ui/widgets/interactive_terrain.dart';
import 'package:mobile/ui/widgets/location_radial_menu.dart';
import 'package:mobile/ui/widgets/profile_modal.dart';
import 'package:mobile/ui/widgets/shop_modal.dart';
import 'package:mobile/ui/widgets/zoom_pan_viewer.dart';

class GamePage extends ConsumerStatefulWidget {
  const GamePage({super.key});

  @override
  ConsumerState<GamePage> createState() => _GamePageState();
}

class _GamePageState extends ConsumerState<GamePage> {
  bool _locationMenuOpen = false;
  late MyGame _game;
  late ProviderSubscription<LocationArea> _locationSub;

  @override
  void initState() {
    super.initState();
    _game = MyGame(location: ref.read(locationProvider));
    // Listen for location changes to update the Flame scene using listenManual (allowed outside build)
    _locationSub = ref.listenManual<LocationArea>(locationProvider, (
      prev,
      next,
    ) {
      if (prev != next) {
        _game.updateLocation(next);
        // Manage fishing session lifecycle
        if (next == LocationArea.fishing) {
          // ensure a session will start when UI builds
        } else {
          // leaving fishing
          try {
            // Stop any active fishing session when leaving fishing area
            // This import is declared at the top of the file
            // ignore: unused_catch_clause
            ref.read(fishingProvider.notifier).stop();
          } catch (_) {}
        }
      }
    }, fireImmediately: false);
  }

  @override
  void dispose() {
    _locationSub.close();
    super.dispose();
  }

  void _toggleLocationMenu() {
    setState(() {
      _locationMenuOpen = !_locationMenuOpen;
    });
  }

  Future<void> _addRandomTerrainCollectables(WidgetRef ref) async {
    final islandId = ref.read(selectedIslandIdProvider);
    if (islandId == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No island selected')),
        );
      }
      return;
    }

    try {
      // Call the generate collectables endpoint
      final apiClient = ref.read(islandRepositoryProvider);
      final response = await apiClient.generateCollectables(islandId);

      // Invalidate to refresh UI with DB data - defer to next frame to avoid rebuild issues
      if (mounted) {
        Future.microtask(() {
          ref.invalidate(selectedIslandDataProvider);
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.message ?? 'Added ${response.count} terrain collectables!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error adding collectables: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final notifications = ref.watch(notificationsCountProvider);
    final energy = ref.watch(energyProvider);
    final timeAsync = ref.watch(timeProvider);
    final timeLabel = timeAsync.when(
      data: (t) => t.format(context),
      loading: () => '—:—',
      error: (_, __) => 'Err',
    );

    return Scaffold(
      backgroundColor: const Color(0xFF1B1B1B),
      floatingActionButton: Consumer(
        builder: (context, ref, _) {
          final loc = ref.watch(locationProvider);
          // Only show on farm location
          if (loc != LocationArea.farm) return const SizedBox.shrink();

          return FloatingActionButton(
            onPressed: () => _addRandomTerrainCollectables(ref),
            backgroundColor: const Color(0xFF4CAF50),
            child: const Icon(Icons.add_location_alt),
          );
        },
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Flame scene (still used for overlays/logic); terrain grid will be layered above as the visual background
            Positioned.fill(child: GameWidget(game: _game)),
            // Terrain grid background based on real island data from backend
            Positioned.fill(
              child: Consumer(
                builder: (context, ref, _) {
                  final loc = ref.watch(locationProvider);

                  final size = MediaQuery.of(context).size;

                  // Show fishing background without terrain
                  if (loc == LocationArea.fishing) {
                    return Positioned.fill(
                      child: Image.asset(
                        'assets/images/fishing_background.png',
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xFF42A5F5),
                                Color(0xFF1976D2),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }

                  // Determine background image based on location
                  String? backgroundImage;
                  bool enableZoom = true;

                  switch (loc) {
                    case LocationArea.farm:
                      backgroundImage = 'assets/images/riverside_background.png';
                      enableZoom = true;
                      break;
                    case LocationArea.barn:
                      backgroundImage = 'assets/images/barn_background.png';
                      enableZoom = false;
                      break;
                    case LocationArea.mines:
                      backgroundImage = 'assets/images/mines_background.png';
                      enableZoom = true;
                      break;
                    case LocationArea.fishing:
                      // Already handled above
                      return const SizedBox.shrink();
                  }

                  // For farm location, try to load real farm data from backend
                  if (loc == LocationArea.farm) {
                    final farmTerrain = ref.watch(selectedIslandFarmTerrainProvider);

                    if (farmTerrain != null) {
                      // Use real farm data from backend with zoom
                      return Center(
                        child: ZoomPanViewer(
                          minScale: 1.0,
                          maxScale: 4.0,
                          initialScale: 2.0, // Start zoomed in
                          constrainScale: true,
                          boundaryMargin: const EdgeInsets.all(24),
                          child: InteractiveTerrain(
                            terrain: farmTerrain,
                            maxWidth: size.width - 24,
                            maxHeight: size.height - 120,
                            backgroundImage: backgroundImage,
                          ),
                        ),
                      );
                    }
                  }

                  // Fallback to mock terrain for other locations or if farm data not loaded
                  final variantKey = ref.watch(selectedIslandVariantKeyProvider);
                  if (variantKey == null) {
                    return const SizedBox.shrink();
                  }

                  final repo = ref.watch(islandRepositoryProvider);
                  final terrain = repo.getTerrainForVariant(
                    variantKey,
                    loc.name,
                  );

                  // Apply zoom only for farm and mines, not for barn
                  if (enableZoom) {
                    return Center(
                      child: ZoomPanViewer(
                        minScale: 1.0,
                        maxScale: 4.0,
                        initialScale: 2.0, // Start zoomed in
                        constrainScale: true,
                        boundaryMargin: const EdgeInsets.all(24),
                        child: InteractiveTerrain(
                          terrain: terrain,
                          maxWidth: size.width - 24,
                          maxHeight: size.height - 120,
                          backgroundImage: backgroundImage,
                        ),
                      ),
                    );
                  } else {
                    // No zoom for barn - just display the terrain
                    return Center(
                      child: InteractiveTerrain(
                        terrain: terrain,
                        maxWidth: size.width - 24,
                        maxHeight: size.height - 120,
                        backgroundImage: backgroundImage,
                      ),
                    );
                  }
                },
              ),
            ),
            // Top-left notifications
            Positioned(
              left: 8,
              top: 8,
              child: HudPill(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 18,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${notifications}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Top-right clock and energy
            Positioned(
              right: 8,
              top: 8,
              child: Row(
                children: [
                  HudPill(
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/clock.png',
                          width: 16,
                          height: 16,
                          errorBuilder: (_, __, ___) => const Icon(
                            Icons.access_time,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          timeLabel,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  HudPill(
                    child: Row(
                      children: [
                        const Icon(Icons.bolt, color: Colors.yellow, size: 16),
                        const SizedBox(width: 6),
                        Text(
                          '$energy',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Fishing minigame overlay when in fishing location
            Positioned.fill(
              child: Consumer(
                builder: (context, ref, _) {
                  final loc = ref.watch(locationProvider);
                  if (loc != LocationArea.fishing)
                    return const SizedBox.shrink();
                  return IgnorePointer(
                    ignoring: false,
                    child: Center(
                      child: FishingMinigame(width: 380, height: 540),
                    ),
                  );
                },
              ),
            ),
            // Location radial menu overlay (toggles via Location button)
            Positioned.fill(
              child: IgnorePointer(
                // allow taps only when open; handled inside the menu
                ignoring: false,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Consumer(
                    builder: (context, ref, _) {
                      final current = ref.watch(locationProvider);
                      return LocationRadialMenu(
                        isOpen: _locationMenuOpen,
                        current: current,
                        anchor: LocationMenuAnchor.centerRight,
                        padding: const EdgeInsets.only(right: 16),
                        onSelect: (loc) {
                          if (loc != current) {
                            ref.read(locationProvider.notifier).state = loc;
                            // Also update Flame background via listener already set
                          }
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            // Center-right Location toggle button matching radial menu styling
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: GameIconButton(
                    icon: Icons.place,
                    label: 'Location',
                    onTap: _toggleLocationMenu,
                    style: GameIconButtonStyle.card,
                    selected: _locationMenuOpen,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: GameBottomBar(
                onAlerts: () async {
                  // Open alerts modal centered and clear notifications after
                  await showGameCenteredModal(
                    context: context,
                    width: 520,
                    height: 480,
                    child: const SizedBox(height: 420, child: AlertsModal()),
                  );
                  ref.read(notificationsCountProvider.notifier).state = 0;
                },
                onShop: () async {
                  await showGameCenteredModal(
                    context: context,
                    width: 560,
                    height: 560,
                    child: const SizedBox(height: 520, child: ShopModal()),
                  );
                },
                onBag: () async {
                  await showGameCenteredModal(
                    context: context,
                    width: 520,
                    height: 480,
                    child: const SizedBox(height: 420, child: BagModal()),
                  );
                },
                onProfile: () async {
                  await showGameCenteredModal(
                    context: context,
                    width: 480,
                    height: 420,
                    child: const SizedBox(height: 360, child: ProfileModal()),
                  );
                },
                onLocation: _toggleLocationMenu,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
