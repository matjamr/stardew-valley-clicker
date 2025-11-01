// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TimerInfo extends TimerInfo {
  @override
  final int? durationSeconds;
  @override
  final String? timerId;

  factory _$TimerInfo([void Function(TimerInfoBuilder)? updates]) =>
      (TimerInfoBuilder()..update(updates))._build();

  _$TimerInfo._({this.durationSeconds, this.timerId}) : super._();
  @override
  TimerInfo rebuild(void Function(TimerInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TimerInfoBuilder toBuilder() => TimerInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TimerInfo &&
        durationSeconds == other.durationSeconds &&
        timerId == other.timerId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, durationSeconds.hashCode);
    _$hash = $jc(_$hash, timerId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TimerInfo')
          ..add('durationSeconds', durationSeconds)
          ..add('timerId', timerId))
        .toString();
  }
}

class TimerInfoBuilder implements Builder<TimerInfo, TimerInfoBuilder> {
  _$TimerInfo? _$v;

  int? _durationSeconds;
  int? get durationSeconds => _$this._durationSeconds;
  set durationSeconds(int? durationSeconds) =>
      _$this._durationSeconds = durationSeconds;

  String? _timerId;
  String? get timerId => _$this._timerId;
  set timerId(String? timerId) => _$this._timerId = timerId;

  TimerInfoBuilder() {
    TimerInfo._defaults(this);
  }

  TimerInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _durationSeconds = $v.durationSeconds;
      _timerId = $v.timerId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TimerInfo other) {
    _$v = other as _$TimerInfo;
  }

  @override
  void update(void Function(TimerInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TimerInfo build() => _build();

  _$TimerInfo _build() {
    final _$result = _$v ??
        _$TimerInfo._(
          durationSeconds: durationSeconds,
          timerId: timerId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
