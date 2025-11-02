// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collect_terrain_collectable_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CollectTerrainCollectableResponse
    extends CollectTerrainCollectableResponse {
  @override
  final bool? success;
  @override
  final String? message;
  @override
  final RewardInfo? rewards;

  factory _$CollectTerrainCollectableResponse(
          [void Function(CollectTerrainCollectableResponseBuilder)? updates]) =>
      (CollectTerrainCollectableResponseBuilder()..update(updates))._build();

  _$CollectTerrainCollectableResponse._(
      {this.success, this.message, this.rewards})
      : super._();
  @override
  CollectTerrainCollectableResponse rebuild(
          void Function(CollectTerrainCollectableResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CollectTerrainCollectableResponseBuilder toBuilder() =>
      CollectTerrainCollectableResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CollectTerrainCollectableResponse &&
        success == other.success &&
        message == other.message &&
        rewards == other.rewards;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, rewards.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CollectTerrainCollectableResponse')
          ..add('success', success)
          ..add('message', message)
          ..add('rewards', rewards))
        .toString();
  }
}

class CollectTerrainCollectableResponseBuilder
    implements
        Builder<CollectTerrainCollectableResponse,
            CollectTerrainCollectableResponseBuilder> {
  _$CollectTerrainCollectableResponse? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  RewardInfoBuilder? _rewards;
  RewardInfoBuilder get rewards => _$this._rewards ??= RewardInfoBuilder();
  set rewards(RewardInfoBuilder? rewards) => _$this._rewards = rewards;

  CollectTerrainCollectableResponseBuilder() {
    CollectTerrainCollectableResponse._defaults(this);
  }

  CollectTerrainCollectableResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _message = $v.message;
      _rewards = $v.rewards?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CollectTerrainCollectableResponse other) {
    _$v = other as _$CollectTerrainCollectableResponse;
  }

  @override
  void update(
      void Function(CollectTerrainCollectableResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CollectTerrainCollectableResponse build() => _build();

  _$CollectTerrainCollectableResponse _build() {
    _$CollectTerrainCollectableResponse _$result;
    try {
      _$result = _$v ??
          _$CollectTerrainCollectableResponse._(
            success: success,
            message: message,
            rewards: _rewards?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'rewards';
        _rewards?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CollectTerrainCollectableResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
