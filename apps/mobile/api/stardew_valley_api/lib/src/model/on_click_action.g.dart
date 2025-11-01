// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'on_click_action.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OnClickAction extends OnClickAction {
  @override
  final ActionType? actionType;
  @override
  final TimerInfo? timerInfo;
  @override
  final RewardInfo? rewardInfo;
  @override
  final EnergyInfo? energyInfo;

  factory _$OnClickAction([void Function(OnClickActionBuilder)? updates]) =>
      (OnClickActionBuilder()..update(updates))._build();

  _$OnClickAction._(
      {this.actionType, this.timerInfo, this.rewardInfo, this.energyInfo})
      : super._();
  @override
  OnClickAction rebuild(void Function(OnClickActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OnClickActionBuilder toBuilder() => OnClickActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OnClickAction &&
        actionType == other.actionType &&
        timerInfo == other.timerInfo &&
        rewardInfo == other.rewardInfo &&
        energyInfo == other.energyInfo;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, actionType.hashCode);
    _$hash = $jc(_$hash, timerInfo.hashCode);
    _$hash = $jc(_$hash, rewardInfo.hashCode);
    _$hash = $jc(_$hash, energyInfo.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OnClickAction')
          ..add('actionType', actionType)
          ..add('timerInfo', timerInfo)
          ..add('rewardInfo', rewardInfo)
          ..add('energyInfo', energyInfo))
        .toString();
  }
}

class OnClickActionBuilder
    implements Builder<OnClickAction, OnClickActionBuilder> {
  _$OnClickAction? _$v;

  ActionType? _actionType;
  ActionType? get actionType => _$this._actionType;
  set actionType(ActionType? actionType) => _$this._actionType = actionType;

  TimerInfoBuilder? _timerInfo;
  TimerInfoBuilder get timerInfo => _$this._timerInfo ??= TimerInfoBuilder();
  set timerInfo(TimerInfoBuilder? timerInfo) => _$this._timerInfo = timerInfo;

  RewardInfoBuilder? _rewardInfo;
  RewardInfoBuilder get rewardInfo =>
      _$this._rewardInfo ??= RewardInfoBuilder();
  set rewardInfo(RewardInfoBuilder? rewardInfo) =>
      _$this._rewardInfo = rewardInfo;

  EnergyInfoBuilder? _energyInfo;
  EnergyInfoBuilder get energyInfo =>
      _$this._energyInfo ??= EnergyInfoBuilder();
  set energyInfo(EnergyInfoBuilder? energyInfo) =>
      _$this._energyInfo = energyInfo;

  OnClickActionBuilder() {
    OnClickAction._defaults(this);
  }

  OnClickActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _actionType = $v.actionType;
      _timerInfo = $v.timerInfo?.toBuilder();
      _rewardInfo = $v.rewardInfo?.toBuilder();
      _energyInfo = $v.energyInfo?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OnClickAction other) {
    _$v = other as _$OnClickAction;
  }

  @override
  void update(void Function(OnClickActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OnClickAction build() => _build();

  _$OnClickAction _build() {
    _$OnClickAction _$result;
    try {
      _$result = _$v ??
          _$OnClickAction._(
            actionType: actionType,
            timerInfo: _timerInfo?.build(),
            rewardInfo: _rewardInfo?.build(),
            energyInfo: _energyInfo?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'timerInfo';
        _timerInfo?.build();
        _$failedField = 'rewardInfo';
        _rewardInfo?.build();
        _$failedField = 'energyInfo';
        _energyInfo?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'OnClickAction', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
