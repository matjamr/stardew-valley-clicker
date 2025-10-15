import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/game/model/location.dart';
import 'package:mobile/game/my_game.dart';
import 'package:mobile/state/app_providers.dart';
import 'package:mobile/ui/widgets/game_bottom_bar.dart';
import 'package:mobile/ui/widgets/hud_pill.dart';
import 'package:mobile/ui/widgets/location_picker_sheet.dart';

class GamePage extends ConsumerStatefulWidget {
  const GamePage({super.key});

  @override
  ConsumerState<GamePage> createState() => _GamePageState();
}

class _GamePageState extends ConsumerState<GamePage> {
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

  void _pickLocation() async {
    final current = ref.read(locationProvider);
    final selected = await showModalBottomSheet<LocationArea>(
      context: context,
      backgroundColor: const Color(0xFF2E1F1A),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return LocationPickerSheet(current: current);
      },
    );
    if (selected != null && selected != current) {
      ref.read(locationProvider.notifier).state = selected;
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
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(child: GameWidget(game: _game)),
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
            // Bottom bar with 5 buttons
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: GameBottomBar(
                onAlerts: () {
                  ref.read(notificationsCountProvider.notifier).state = 0;
                },
                onShop: () {},
                onBag: () {},
                onProfile: () {},
                onLocation: _pickLocation,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
