import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum TileTimerStatus { idle, running, ready }

@immutable
class TileTimerState {
  final TileTimerStatus status;
  final DateTime? startAt;
  final Duration? duration;
  final DateTime? showExactUntil; // 2s after tap
  final String? eventId; // Server-side event ID

  const TileTimerState({
    this.status = TileTimerStatus.idle,
    this.startAt,
    this.duration,
    this.showExactUntil,
    this.eventId,
  });

  TileTimerState copyWith({
    TileTimerStatus? status,
    DateTime? startAt,
    Duration? duration,
    DateTime? showExactUntil,
    String? eventId,
  }) => TileTimerState(
    status: status ?? this.status,
    startAt: startAt ?? this.startAt,
    duration: duration ?? this.duration,
    showExactUntil: showExactUntil ?? this.showExactUntil,
    eventId: eventId ?? this.eventId,
  );

  double get progress {
    if (status != TileTimerStatus.running ||
        startAt == null ||
        duration == null) {
      return status == TileTimerStatus.ready ? 1.0 : 0.0;
    }
    final now = DateTime.now();
    final elapsed = now.difference(startAt!);
    final pct = elapsed.inMilliseconds / duration!.inMilliseconds;
    return pct.clamp(0.0, 1.0);
  }

  Duration? get remaining {
    if (status == TileTimerStatus.running &&
        startAt != null &&
        duration != null) {
      final elapsed = DateTime.now().difference(startAt!);
      final left = duration! - elapsed;
      return left.isNegative ? Duration.zero : left;
    }
    return null;
  }
}

class TileTimersNotifier extends StateNotifier<Map<String, TileTimerState>> {
  TileTimersNotifier() : super({});

  static String keyFor(String terrainId, int x, int y) => '$terrainId:$x,$y';

  void startTimer({
    required String terrainId,
    required int x,
    required int y,
    Duration? duration,
    String? eventId,
  }) {
    final key = keyFor(terrainId, x, y);
    final rng = Random();
    final dur = duration ?? Duration(seconds: 10 + rng.nextInt(51)); // 10..60s
    final now = DateTime.now();
    state = {
      ...state,
      key: TileTimerState(
        status: TileTimerStatus.running,
        startAt: now,
        duration: dur,
        showExactUntil: now.add(const Duration(seconds: 2)),
        eventId: eventId,
      ),
    };
  }

  void tickEvaluate() {
    // Optionally called by UI timer to flip running->ready when finished
    final now = DateTime.now();
    final updated = <String, TileTimerState>{}..addAll(state);
    bool changed = false;
    for (final entry in state.entries) {
      final s = entry.value;
      if (s.status == TileTimerStatus.running &&
          s.startAt != null &&
          s.duration != null) {
        if (now.isAfter(s.startAt!.add(s.duration!))) {
          updated[entry.key] = s.copyWith(status: TileTimerStatus.ready);
          changed = true;
        }
      }
    }
    if (changed) state = updated;
  }

  void reset(String terrainId, int x, int y) {
    final key = keyFor(terrainId, x, y);
    if (!state.containsKey(key)) return;
    final updated = Map<String, TileTimerState>.from(state);
    updated.remove(key);
    state = updated;
  }
}

final tileTimersProvider =
    StateNotifierProvider<TileTimersNotifier, Map<String, TileTimerState>>(
      (ref) => TileTimersNotifier(),
    );
