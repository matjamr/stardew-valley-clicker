// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reward_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RewardInfo extends RewardInfo {
  @override
  final BuiltList<ResourceReward>? resources;
  @override
  final int? xpGrant;

  factory _$RewardInfo([void Function(RewardInfoBuilder)? updates]) =>
      (RewardInfoBuilder()..update(updates))._build();

  _$RewardInfo._({this.resources, this.xpGrant}) : super._();
  @override
  RewardInfo rebuild(void Function(RewardInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RewardInfoBuilder toBuilder() => RewardInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RewardInfo &&
        resources == other.resources &&
        xpGrant == other.xpGrant;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, resources.hashCode);
    _$hash = $jc(_$hash, xpGrant.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RewardInfo')
          ..add('resources', resources)
          ..add('xpGrant', xpGrant))
        .toString();
  }
}

class RewardInfoBuilder implements Builder<RewardInfo, RewardInfoBuilder> {
  _$RewardInfo? _$v;

  ListBuilder<ResourceReward>? _resources;
  ListBuilder<ResourceReward> get resources =>
      _$this._resources ??= ListBuilder<ResourceReward>();
  set resources(ListBuilder<ResourceReward>? resources) =>
      _$this._resources = resources;

  int? _xpGrant;
  int? get xpGrant => _$this._xpGrant;
  set xpGrant(int? xpGrant) => _$this._xpGrant = xpGrant;

  RewardInfoBuilder() {
    RewardInfo._defaults(this);
  }

  RewardInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _resources = $v.resources?.toBuilder();
      _xpGrant = $v.xpGrant;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RewardInfo other) {
    _$v = other as _$RewardInfo;
  }

  @override
  void update(void Function(RewardInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RewardInfo build() => _build();

  _$RewardInfo _build() {
    _$RewardInfo _$result;
    try {
      _$result = _$v ??
          _$RewardInfo._(
            resources: _resources?.build(),
            xpGrant: xpGrant,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'resources';
        _resources?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'RewardInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
