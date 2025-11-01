// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_reward.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ResourceReward extends ResourceReward {
  @override
  final String? resourceId;
  @override
  final int? amount;

  factory _$ResourceReward([void Function(ResourceRewardBuilder)? updates]) =>
      (ResourceRewardBuilder()..update(updates))._build();

  _$ResourceReward._({this.resourceId, this.amount}) : super._();
  @override
  ResourceReward rebuild(void Function(ResourceRewardBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResourceRewardBuilder toBuilder() => ResourceRewardBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResourceReward &&
        resourceId == other.resourceId &&
        amount == other.amount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, resourceId.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResourceReward')
          ..add('resourceId', resourceId)
          ..add('amount', amount))
        .toString();
  }
}

class ResourceRewardBuilder
    implements Builder<ResourceReward, ResourceRewardBuilder> {
  _$ResourceReward? _$v;

  String? _resourceId;
  String? get resourceId => _$this._resourceId;
  set resourceId(String? resourceId) => _$this._resourceId = resourceId;

  int? _amount;
  int? get amount => _$this._amount;
  set amount(int? amount) => _$this._amount = amount;

  ResourceRewardBuilder() {
    ResourceReward._defaults(this);
  }

  ResourceRewardBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _resourceId = $v.resourceId;
      _amount = $v.amount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResourceReward other) {
    _$v = other as _$ResourceReward;
  }

  @override
  void update(void Function(ResourceRewardBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResourceReward build() => _build();

  _$ResourceReward _build() {
    final _$result = _$v ??
        _$ResourceReward._(
          resourceId: resourceId,
          amount: amount,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
