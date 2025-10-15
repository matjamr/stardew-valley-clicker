import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/state/fishing.dart';
import 'package:mobile/state/ui_providers.dart';

class FishingMinigame extends ConsumerStatefulWidget {
  final double width;
  final double height;
  const FishingMinigame({super.key, this.width = 360, this.height = 520});

  @override
  ConsumerState<FishingMinigame> createState() => _FishingMinigameState();
}

class _FishingMinigameState extends ConsumerState<FishingMinigame> {
  @override
  void initState() {
    super.initState();
    // Defer starting a session until after the first frame to avoid modifying providers during build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final s = ref.read(fishingProvider);
      if (s == null) {
        ref.read(fishingProvider.notifier).start();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(fishingProvider);
    if (session == null) return const SizedBox.shrink();

    final rarity = session.rarity;
    final stars = session.stars;

    final phase = session.phase;
    final now = DateTime.now();
    final promptLeft = (session.promptUntil != null)
        ? session.promptUntil!.difference(now)
        : Duration.zero;
    final promptSeconds = (promptLeft.inMilliseconds / 1000)
        .clamp(0, 999)
        .toDouble();

    return Center(
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: const Color(0xFF2B2B2B),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFFFE7A0), width: 2),
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Header with rarity and stars
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _rarityChip(rarity),
                Row(
                  children: List.generate(
                    stars,
                    (i) => const Icon(
                      Icons.star,
                      color: Color(0xFFFFE7A0),
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF1D2A35), Color(0xFF14303B)],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFF5C7E8A),
                    width: 1.2,
                  ),
                ),
                child: Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 160),
                    child: switch (phase) {
                      FishingPhase.waiting => _WaitingView(
                        key: const ValueKey('waiting'),
                      ),
                      FishingPhase.prompt => _PromptView(
                        key: const ValueKey('prompt'),
                        secondsLeft: promptSeconds,
                        onTake: () =>
                            ref.read(fishingProvider.notifier).takeNow(),
                      ),
                      FishingPhase.hooked => _HookedView(
                        key: const ValueKey('hooked'),
                        onStartSkill: () =>
                            ref.read(fishingProvider.notifier).startSkill(),
                      ),
                      FishingPhase.skill => _SkillView(
                        key: const ValueKey('skill'),
                      ),
                      FishingPhase.success => const _SuccessView(
                        key: ValueKey('success'),
                      ),
                      FishingPhase.failed => const _FailedView(
                        key: ValueKey('failed'),
                      ),
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Footer actions
            _FooterActions(
              phase: phase,
              rarity: rarity,
              stars: stars,
              onTakeReward: () {
                final reward = _rewardFor(rarity, stars);
                ref.read(profileProvider.notifier).earnGold(reward);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Caught fish! +$reward gold')),
                );
                ref.read(fishingProvider.notifier).start();
              },
              onTryAgain: () {
                ref.read(fishingProvider.notifier).start();
              },
            ),
          ],
        ),
      ),
    );
  }

  int _rewardFor(FishingRarity r, int stars) {
    final base = switch (r) {
      FishingRarity.common => 6,
      FishingRarity.normal => 10,
      FishingRarity.rare => 16,
      FishingRarity.unique => 24,
      FishingRarity.legendary => 36,
    };
    return (base * (1 + 0.25 * (stars - 1))).round();
  }

  Widget _rarityChip(FishingRarity r) {
    final label = () {
      switch (r) {
        case FishingRarity.common:
          return 'Common';
        case FishingRarity.normal:
          return 'Normal';
        case FishingRarity.rare:
          return 'Rare';
        case FishingRarity.unique:
          return 'Unique';
        case FishingRarity.legendary:
          return 'Legendary';
      }
    }();
    final color = () {
      switch (r) {
        case FishingRarity.common:
          return const Color(0xFF8E9E8E);
        case FishingRarity.normal:
          return const Color(0xFF9AB0D0);
        case FishingRarity.rare:
          return const Color(0xFF85C1E9);
        case FishingRarity.unique:
          return const Color(0xFFC39BD3);
        case FishingRarity.legendary:
          return const Color(0xFFF7DC6F);
      }
    }();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.18),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color, width: 1.2),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _WaitingView extends StatelessWidget {
  const _WaitingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: key,
      mainAxisSize: MainAxisSize.min,
      children: const [
        Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            'Waiting for a bite…',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 8),
        _Bubbles(),
      ],
    );
  }
}

class _PromptView extends StatelessWidget {
  final double secondsLeft;
  final VoidCallback onTake;
  const _PromptView({
    super.key,
    required this.secondsLeft,
    required this.onTake,
  });

  @override
  Widget build(BuildContext context) {
    final secs = secondsLeft.clamp(0, 9.99);
    return Column(
      key: key,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Bite! Tap Take!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        AnimatedScale(
          scale: 1.04,
          duration: const Duration(milliseconds: 120),
          child: ElevatedButton(
            onPressed: onTake,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4B7F4B),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: Color(0xFFB5E08A), width: 1.5),
              ),
            ),
            child: const Text(
              'Take!',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0x99202020),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFFFE7A0), width: 1.2),
          ),
          child: Text(
            '${secs.toStringAsFixed(1)} s',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class _SuccessView extends StatelessWidget {
  const _SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Icon(Icons.check_circle, color: Color(0xFFB5E08A), size: 56),
        SizedBox(height: 8),
        Text(
          'Fish caught!',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _HookedView extends StatelessWidget {
  final VoidCallback onStartSkill;
  const _HookedView({super.key, required this.onStartSkill});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.set_meal, color: Color(0xFFFFE7A0), size: 56),
        const SizedBox(height: 8),
        const Text(
          'Fish is caught!',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: onStartSkill,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4B7F4B),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Color(0xFFB5E08A), width: 1.5),
            ),
          ),
          child: const Text(
            'Caught',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class _SkillView extends ConsumerWidget {
  const _SkillView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(fishingProvider);
    if (s == null) return const SizedBox.shrink();

    final progress = s.progress;
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        // Progress bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progress.clamp(0.0, 1.0),
              minHeight: 10,
              backgroundColor: const Color(0x33202020),
              valueColor: const AlwaysStoppedAnimation(Color(0xFFB5E08A)),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final trackHeight = constraints.maxHeight - 80;
              final trackWidth = 100.0;
              final fishY = s.fishY * trackHeight;
              final winCenter = s.windowY * trackHeight;
              final winHeight = s.windowSize * trackHeight;

              return Center(
                child: SizedBox(
                  width: trackWidth,
                  height: trackHeight,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Track background
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFF16313D), Color(0xFF0F2731)],
                            ),
                            border: Border.all(
                              color: Color(0xFF5C7E8A),
                              width: 1.2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      // Window (bob)
                      Positioned(
                        left: 6,
                        width: trackWidth - 12,
                        top: (winCenter - winHeight / 2).clamp(
                          0,
                          trackHeight - winHeight,
                        ),
                        height: winHeight,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0x33B5E08A),
                            border: Border.all(
                              color: const Color(0xFFB5E08A),
                              width: 1.4,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      // Fish marker
                      Positioned(
                        left: (trackWidth - 18) / 2,
                        top: (fishY - 9).clamp(0, trackHeight - 18),
                        child: const Icon(
                          Icons.circle,
                          color: Color(0xFF78C2F0),
                          size: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        // Reel button - press & hold
        GestureDetector(
          onTapDown: (_) =>
              ref.read(fishingProvider.notifier).setReelHeld(true),
          onTapUp: (_) => ref.read(fishingProvider.notifier).setReelHeld(false),
          onTapCancel: () =>
              ref.read(fishingProvider.notifier).setReelHeld(false),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
            decoration: BoxDecoration(
              color: const Color(0xFF4B7F4B),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFB5E08A), width: 1.5),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: const Text(
              'Reel',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _FailedView extends StatelessWidget {
  const _FailedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Icon(Icons.highlight_off, color: Color(0xFFE57373), size: 56),
        SizedBox(height: 8),
        Text(
          'Missed the bite',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _FooterActions extends StatelessWidget {
  final FishingPhase phase;
  final FishingRarity rarity;
  final int stars;
  final VoidCallback onTakeReward;
  final VoidCallback onTryAgain;
  const _FooterActions({
    required this.phase,
    required this.rarity,
    required this.stars,
    required this.onTakeReward,
    required this.onTryAgain,
  });

  @override
  Widget build(BuildContext context) {
    switch (phase) {
      case FishingPhase.success:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton(
              onPressed: onTakeReward,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFFFE7A0)),
              ),
              child: const Text(
                'Take reward',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: onTryAgain,
              child: const Text(
                'Fish again',
                style: TextStyle(color: Color(0xFFFFE7A0)),
              ),
            ),
          ],
        );
      case FishingPhase.failed:
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: onTryAgain,
              child: const Text(
                'Try again',
                style: TextStyle(color: Color(0xFFFFE7A0)),
              ),
            ),
          ],
        );
      default:
        return const SizedBox(height: 40);
    }
  }
}

class _Bubbles extends StatefulWidget {
  const _Bubbles({super.key});

  @override
  State<_Bubbles> createState() => _BubblesState();
}

class _BubblesState extends State<_Bubbles>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..repeat();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 40,
      child: AnimatedBuilder(
        animation: _c,
        builder: (context, _) {
          final t = _c.value;
          return CustomPaint(painter: _BubblePainter(t));
        },
      ),
    );
  }
}

class _BubblePainter extends CustomPainter {
  final double t;
  _BubblePainter(this.t);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0x66CEE9EF);
    for (int i = 0; i < 5; i++) {
      final x = size.width * (0.1 + i * 0.18);
      final y = size.height * (1 - ((t + i * 0.2) % 1));
      canvas.drawCircle(Offset(x, y), 3.5, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _BubblePainter oldDelegate) =>
      oldDelegate.t != t;
}
