import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/game/model/location.dart';
import 'package:mobile/game/my_game.dart';
import 'package:mobile/state/app_providers.dart';
import 'package:mobile/state/island_providers.dart';
import 'package:mobile/ui/widgets/alerts_modal.dart';
import 'package:mobile/ui/widgets/bag_modal.dart';
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
      body: SafeArea(
        child: Stack(
          children: [
            // Flame scene (still used for overlays/logic); terrain grid will be layered above as the visual background
            Positioned.fill(child: GameWidget(game: _game)),
            // Terrain grid background based on current island variant + location
            Positioned.fill(
              child: Consumer(
                builder: (context, ref, _) {
                  final variantKey = ref.watch(
                    selectedIslandVariantKeyProvider,
                  );
                  if (variantKey == null) {
                    return const SizedBox.shrink();
                  }
                  final loc = ref.watch(locationProvider);
                  final repo = ref.watch(islandRepositoryProvider);
                  final terrain = repo.getTerrainForVariant(
                    variantKey,
                    loc.name,
                  );
                  final size = MediaQuery.of(context).size;
                  return Center(
                    child: ZoomPanViewer(
                      minScale: 0.8,
                      maxScale: 4.0,
                      boundaryMargin: const EdgeInsets.all(120),
                      child: InteractiveTerrain(
                        terrain: terrain,
                        maxWidth: size.width - 24, // a bit of safe padding
                        maxHeight:
                            size.height -
                            120, // leave room for HUD/bottom bar visually
                      ),
                    ),
                  );
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
