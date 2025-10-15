import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum FishingRarity { common, normal, rare, unique, legendary }

// New simple reaction minigame phases
enum FishingPhase { waiting, prompt, hooked, skill, success, failed }

@immutable
class FishingSession {
  final bool active;
  final FishingRarity rarity;
  final int stars; // 1..3 (affects reward)

  // Phase/timing
  final FishingPhase phase;
  final DateTime startedAt;
  final DateTime waitUntil; // when the Take! prompt should appear
  final DateTime? promptUntil; // deadline to react

  // Skill (bob) minigame state
  final double progress; // 0..1
  final double fishY; // 0..1
  final double fishVy; // velocity in units/sec
  final double windowY; // 0..1 (center)
  final double windowSize; // 0..1 (height)
  final bool reelHeld; // input state

  const FishingSession({
    required this.active,
    required this.rarity,
    required this.stars,
    required this.phase,
    required this.startedAt,
    required this.waitUntil,
    required this.promptUntil,
    this.progress = 0,
    this.fishY = 0.5,
    this.fishVy = 0.0,
    this.windowY = 0.5,
    this.windowSize = 0.3,
    this.reelHeld = false,
  });

  FishingSession copyWith({
    bool? active,
    FishingRarity? rarity,
    int? stars,
    FishingPhase? phase,
    DateTime? startedAt,
    DateTime? waitUntil,
    DateTime? promptUntil,
    double? progress,
    double? fishY,
    double? fishVy,
    double? windowY,
    double? windowSize,
    bool? reelHeld,
  }) => FishingSession(
    active: active ?? this.active,
    rarity: rarity ?? this.rarity,
    stars: stars ?? this.stars,
    phase: phase ?? this.phase,
    startedAt: startedAt ?? this.startedAt,
    waitUntil: waitUntil ?? this.waitUntil,
    promptUntil: promptUntil ?? this.promptUntil,
    progress: progress ?? this.progress,
    fishY: fishY ?? this.fishY,
    fishVy: fishVy ?? this.fishVy,
    windowY: windowY ?? this.windowY,
    windowSize: windowSize ?? this.windowSize,
    reelHeld: reelHeld ?? this.reelHeld,
  );
}

class _SkillParams {
  final double maxSpeed;
  final double jitter;
  final double gainRate;
  final double decayRate;
  final double reelUpSpeed;
  final double fallSpeed;
  const _SkillParams({
    required this.maxSpeed,
    required this.jitter,
    required this.gainRate,
    required this.decayRate,
    required this.reelUpSpeed,
    required this.fallSpeed,
  });
}

class FishingNotifier extends StateNotifier<FishingSession?> {
  FishingNotifier() : super(null);

  Timer? _tick;
  final _rng = Random();

  // Parameters driving the bob minigame physics
  _SkillParams _skillParams(FishingRarity r) {
    switch (r) {
      case FishingRarity.common:
        return const _SkillParams(
          maxSpeed: 0.35,
          jitter: 1.2,
          gainRate: 0.9,
          decayRate: 0.35,
          reelUpSpeed: 1.2,
          fallSpeed: 0.9,
        );
      case FishingRarity.normal:
        return const _SkillParams(
          maxSpeed: 0.5,
          jitter: 1.5,
          gainRate: 0.85,
          decayRate: 0.45,
          reelUpSpeed: 1.25,
          fallSpeed: 0.95,
        );
      case FishingRarity.rare:
        return const _SkillParams(
          maxSpeed: 0.7,
          jitter: 1.8,
          gainRate: 0.8,
          decayRate: 0.6,
          reelUpSpeed: 1.3,
          fallSpeed: 1.0,
        );
      case FishingRarity.unique:
        return const _SkillParams(
          maxSpeed: 0.9,
          jitter: 2.2,
          gainRate: 0.75,
          decayRate: 0.8,
          reelUpSpeed: 1.35,
          fallSpeed: 1.05,
        );
      case FishingRarity.legendary:
        return const _SkillParams(
          maxSpeed: 1.1,
          jitter: 2.6,
          gainRate: 0.7,
          decayRate: 0.95,
          reelUpSpeed: 1.4,
          fallSpeed: 1.1,
        );
    }
  }

  // Rarity → prompt window (seconds)
  double _promptWindowFor(FishingRarity r) {
    switch (r) {
      case FishingRarity.common:
        return 3.0;
      case FishingRarity.normal:
        return 2.5;
      case FishingRarity.rare:
        return 2.0;
      case FishingRarity.unique:
        return 1.5;
      case FishingRarity.legendary:
        return 1.0;
    }
  }

  void start({FishingRarity? rarity, int? stars}) {
    final r =
        rarity ??
        FishingRarity.values[_rng.nextInt(FishingRarity.values.length)];
    final s = stars ?? (1 + _rng.nextInt(3));
    final now = DateTime.now();
    final wait = now.add(Duration(seconds: 1 + _rng.nextInt(10))); // 1..10s
    state = FishingSession(
      active: true,
      rarity: r,
      stars: s,
      phase: FishingPhase.waiting,
      startedAt: now,
      waitUntil: wait,
      promptUntil: null,
      progress: 0,
      fishY: 0.5,
      fishVy: 0.0,
      windowY: 0.5,
      windowSize: _windowSizeForStars(s),
      reelHeld: false,
    );
    _tick?.cancel();
    _tick = Timer.periodic(const Duration(milliseconds: 50), (_) => _onTick());
  }

  void stop() {
    _tick?.cancel();
    _tick = null;
    state = null;
  }

  void _onTick() {
    final s = state;
    if (s == null || !s.active) return;
    final now = DateTime.now();

    if (s.phase == FishingPhase.waiting) {
      if (now.isAfter(s.waitUntil)) {
        // Enter prompt phase
        final deadline = now.add(
          Duration(milliseconds: (1000 * _promptWindowFor(s.rarity)).round()),
        );
        state = s.copyWith(phase: FishingPhase.prompt, promptUntil: deadline);
      }
      return;
    }

    if (s.phase == FishingPhase.prompt) {
      // If the prompt expired without pressing Take!, it's a fail
      if (s.promptUntil != null && now.isAfter(s.promptUntil!)) {
        state = s.copyWith(phase: FishingPhase.failed);
        _tick?.cancel();
        _tick = null;
      }
      return;
    }

    if (s.phase == FishingPhase.skill) {
      // Physics tick for bob-window game
      const dt = 0.05; // seconds at 20 Hz
      final params = _skillParams(s.rarity);

      // Fish dynamics with randomness
      var fishVy = s.fishVy + (_rng.nextDouble() - 0.5) * params.jitter * dt;
      fishVy = fishVy.clamp(-params.maxSpeed, params.maxSpeed);
      var fishY = (s.fishY + fishVy * dt);
      if (fishY < 0) {
        fishY = 0;
        fishVy = fishVy.abs() * 0.6; // bounce downwards
      } else if (fishY > 1) {
        fishY = 1;
        fishVy = -fishVy.abs() * 0.6; // bounce upwards
      }

      // Player window control
      final windowSpeed = s.reelHeld ? -params.reelUpSpeed : params.fallSpeed;
      var windowY = (s.windowY + windowSpeed * dt).clamp(0.0, 1.0);

      // Progress calc
      final half = s.windowSize / 2;
      final inWindow = (fishY >= windowY - half) && (fishY <= windowY + half);
      var prog =
          s.progress + (inWindow ? params.gainRate : -params.decayRate) * dt;
      if (prog < 0) prog = 0;
      if (prog >= 1) {
        prog = 1;
        state = s.copyWith(
          phase: FishingPhase.success,
          progress: prog,
          fishY: fishY,
          fishVy: fishVy,
          windowY: windowY,
        );
        _tick?.cancel();
        _tick = null;
        return;
      }

      state = s.copyWith(
        progress: prog,
        fishY: fishY,
        fishVy: fishVy,
        windowY: windowY,
      );
      return;
    }

    // hooked/success/failed: no ticking needed
  }

  // Called when user taps the Take! button during prompt
  void takeNow() {
    final s = state;
    if (s == null || !s.active) return;
    final now = DateTime.now();
    if (s.phase == FishingPhase.prompt &&
        (s.promptUntil == null || now.isBefore(s.promptUntil!))) {
      // Move to a short hooked popup; ticking can pause while waiting for user
      state = s.copyWith(phase: FishingPhase.hooked);
    }
  }

  void startSkill() {
    final s = state;
    if (s == null) return;
    // Initialize bob minigame variables
    state = s.copyWith(
      phase: FishingPhase.skill,
      progress: 0,
      fishY: 0.5,
      fishVy: 0.0,
      windowY: 0.6,
      windowSize: _windowSizeForStars(s.stars),
      reelHeld: false,
    );
    _ensureTicking();
  }

  void setReelHeld(bool held) {
    final s = state;
    if (s == null) return;
    if (s.phase != FishingPhase.skill) return;
    state = s.copyWith(reelHeld: held);
  }

  double _windowSizeForStars(int stars) {
    switch (stars.clamp(1, 3)) {
      case 1:
        return 0.22;
      case 2:
        return 0.30;
      default:
        return 0.38;
    }
  }

  void _ensureTicking() {
    if (_tick != null) return;
    _tick = Timer.periodic(const Duration(milliseconds: 50), (_) => _onTick());
  }
}

final fishingProvider = StateNotifierProvider<FishingNotifier, FishingSession?>(
  (ref) => FishingNotifier(),
);
