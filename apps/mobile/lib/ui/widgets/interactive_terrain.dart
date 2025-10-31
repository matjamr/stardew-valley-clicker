import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/state/field_timers.dart';
import 'package:mobile/state/island_providers.dart';
import 'package:mobile/state/ui_providers.dart';
import 'package:mobile/ui/widgets/terrain_grid.dart';

class InteractiveTerrain extends ConsumerStatefulWidget {
  final TerrainSpec terrain;
  final double maxWidth;
  final double maxHeight;
  final double gap;

  const InteractiveTerrain({
    super.key,
    required this.terrain,
    this.maxWidth = 240,
    this.maxHeight = 160,
    this.gap = 1,
  });

  @override
  ConsumerState<InteractiveTerrain> createState() => _InteractiveTerrainState();
}

class _InteractiveTerrainState extends ConsumerState<InteractiveTerrain> {
  Timer? _ticker;
  String? _bumpKey;

  @override
  void initState() {
    super.initState();
    // Faster UI tick for more responsive progress/ready visuals
    _ticker = Timer.periodic(const Duration(milliseconds: 100), (_) {
      ref.read(tileTimersProvider.notifier).tickEvaluate();
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final terrain = widget.terrain;
    final cols = terrain.sizeX;
    final rows = terrain.sizeY;
    final gap = widget.gap;

    final tileSizeW = (widget.maxWidth - (cols - 1) * gap) / cols;
    final tileSizeH = (widget.maxHeight - (rows - 1) * gap) / rows;
    final tile = tileSizeW < tileSizeH ? tileSizeW : tileSizeH;
    final width = cols * tile + (cols - 1) * gap;
    final height = rows * tile + (rows - 1) * gap;

    final timers = ref.watch(tileTimersProvider);
    final repo = ref.watch(islandRepositoryProvider);

    List<Widget> overlays = [];

    // Build a coverage map for multi-size tiles so we can skip underlying 1x1 tiles
    final Set<String> coveredByMulti = <String>{};
    for (final t in terrain.tiles) {
      if (t.sizeX > 1 || t.sizeY > 1) {
        for (var dy = 0; dy < t.sizeY; dy++) {
          for (var dx = 0; dx < t.sizeX; dx++) {
            coveredByMulti.add('${t.x + dx},${t.y + dy}');
          }
        }
      }
    }

    for (final t in terrain.tiles) {
      // If this is a single tile fully covered by a larger tile, skip to avoid duplicate interactions
      if (t.sizeX == 1 &&
          t.sizeY == 1 &&
          coveredByMulti.contains('${t.x},${t.y}')) {
        continue;
      }
      final left = t.x * (tile + gap);
      final top = t.y * (tile + gap);
      final w = t.sizeX * tile + (t.sizeX - 1) * gap;
      final h = t.sizeY * tile + (t.sizeY - 1) * gap;

      final key = TileTimersNotifier.keyFor(terrain.id, t.x, t.y);
      final state = timers[key];

      Widget? overlayChild;
      if (state != null) {
        if (state.status == TileTimerStatus.running) {
          final now = DateTime.now();
          final showExact =
              state.showExactUntil != null &&
              now.isBefore(state.showExactUntil!);
          if (showExact) {
            final remaining = state.remaining ?? Duration.zero;
            overlayChild = _ExactTimeOverlay(remaining: remaining);
          } else {
            overlayChild = _ProgressBar(progress: state.progress);
          }
        } else if (state.status == TileTimerStatus.ready) {
          overlayChild = const _ReadyToCollectIndicator();
        }
      }

      overlays.add(
        Positioned(
          left: left,
          top: top,
          width: w,
          height: h,
          child: _TapLayer(
            onTapDown: (_) async {
              final current = ref.read(tileTimersProvider)[key];
              if (current == null) {
                // Generate duration for this tile
                final rng = Random();
                final duration = Duration(seconds: 10 + rng.nextInt(51)); // 10..60s

                // Start timer immediately for UI feedback
                setState(() {
                  _bumpKey = key;
                });
                ref
                    .read(tileTimersProvider.notifier)
                    .startTimer(terrainId: terrain.id, x: t.x, y: t.y, duration: duration);

                Future.delayed(const Duration(milliseconds: 140), () {
                  if (!mounted) return;
                  if (_bumpKey == key) {
                    setState(() => _bumpKey = null);
                  }
                });

                // Create event on server (fire and forget - eventId will be stored if needed for polling)
                try {
                  final selectedIslandId = ref.read(selectedIslandIdProvider);
                  if (selectedIslandId != null) {
                    final result = await repo.startFieldEvent(
                      islandId: selectedIslandId,
                      userId: 'user-001', // TODO: Get from auth context
                      terrainId: terrain.id,
                      x: t.x,
                      y: t.y,
                      duration: duration,
                    );

                    // Update timer with eventId
                    ref.read(tileTimersProvider.notifier).startTimer(
                      terrainId: terrain.id,
                      x: t.x,
                      y: t.y,
                      duration: duration,
                      eventId: result.eventId,
                    );
                  }
                } catch (e) {
                  // If API fails, timer still runs locally
                  debugPrint('Failed to create field event: $e');
                }
              } else if (current.status == TileTimerStatus.ready) {
                // Collect field - verify with server
                if (current.eventId != null) {
                  try {
                    final amount = await repo.collectField(eventId: current.eventId!);
                    ref.read(profileProvider.notifier).earnGold(amount);
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Collected +$amount gold')),
                      );
                    }
                    ref
                        .read(tileTimersProvider.notifier)
                        .reset(terrain.id, t.x, t.y);
                  } catch (e) {
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Failed to collect: $e')),
                      );
                    }
                  }
                } else {
                  // Fallback for tiles without eventId (shouldn't happen in normal flow)
                  final base = (t.x + t.y) % 3;
                  final amount = base == 0 ? 5 : (base == 1 ? 8 : 12);
                  ref.read(profileProvider.notifier).earnGold(amount);
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Collected +$amount gold (offline)')),
                    );
                  }
                  ref
                      .read(tileTimersProvider.notifier)
                      .reset(terrain.id, t.x, t.y);
                }
              } else {
                // running: do nothing
              }
            },
            child: overlayChild == null
                ? const SizedBox.shrink()
                : AnimatedScale(
                    scale: _bumpKey == key ? 1.06 : 1.0,
                    duration: const Duration(milliseconds: 90),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 120),
                      child: overlayChild,
                    ),
                  ),
          ),
        ),
      );
    }

    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            TerrainGrid(
              terrain: terrain,
              maxWidth: widget.maxWidth,
              maxHeight: widget.maxHeight,
              gap: widget.gap,
            ),
            ...overlays,
          ],
        ),
      ),
    );
  }
}

class _TapLayer extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final GestureTapDownCallback? onTapDown;
  const _TapLayer({required this.child, this.onTap, this.onTapDown});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      onTapDown: onTapDown,
      child: child,
    );
  }
}

class _ExactTimeOverlay extends StatelessWidget {
  final Duration remaining;
  const _ExactTimeOverlay({required this.remaining});

  @override
  Widget build(BuildContext context) {
    final secs = remaining.inSeconds;
    final text = secs >= 60
        ? '${secs ~/ 60}m ${(secs % 60).toString().padLeft(2, '0')}s'
        : '${secs}s';
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xAA000000),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFFFFE7A0), width: 1.5),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFFFFF3C4),
          fontWeight: FontWeight.w800,
          fontSize: 12,
        ),
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  final double progress; // 0..1
  const _ProgressBar({required this.progress});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.all(2),
        height: 6,
        decoration: BoxDecoration(
          color: const Color(0xFF2E1F1A),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: const Color(0xFF7C5A4A), width: 1),
        ),
        child: FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: progress.clamp(0, 1),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFFE7A0),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
    );
  }
}

class _ReadyToCollectIndicator extends StatefulWidget {
  const _ReadyToCollectIndicator();

  @override
  State<_ReadyToCollectIndicator> createState() =>
      _ReadyToCollectIndicatorState();
}

class _ReadyToCollectIndicatorState extends State<_ReadyToCollectIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween<double>(
        begin: 0.4,
        end: 1.0,
      ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut)),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0x662196F3),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: const Color(0xFF90CAF9), width: 2),
        ),
        alignment: Alignment.center,
        child: const Icon(Icons.star, color: Colors.amber, size: 18),
      ),
    );
  }
}
