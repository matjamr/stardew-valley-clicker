// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_island_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateIslandRequest extends UpdateIslandRequest {
  @override
  final Island island;

  factory _$UpdateIslandRequest(
          [void Function(UpdateIslandRequestBuilder)? updates]) =>
      (UpdateIslandRequestBuilder()..update(updates))._build();

  _$UpdateIslandRequest._({required this.island}) : super._();
  @override
  UpdateIslandRequest rebuild(
          void Function(UpdateIslandRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateIslandRequestBuilder toBuilder() =>
      UpdateIslandRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateIslandRequest && island == other.island;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, island.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateIslandRequest')
          ..add('island', island))
        .toString();
  }
}

class UpdateIslandRequestBuilder
    implements Builder<UpdateIslandRequest, UpdateIslandRequestBuilder> {
  _$UpdateIslandRequest? _$v;

  IslandBuilder? _island;
  IslandBuilder get island => _$this._island ??= IslandBuilder();
  set island(IslandBuilder? island) => _$this._island = island;

  UpdateIslandRequestBuilder() {
    UpdateIslandRequest._defaults(this);
  }

  UpdateIslandRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _island = $v.island.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateIslandRequest other) {
    _$v = other as _$UpdateIslandRequest;
  }

  @override
  void update(void Function(UpdateIslandRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateIslandRequest build() => _build();

  _$UpdateIslandRequest _build() {
    _$UpdateIslandRequest _$result;
    try {
      _$result = _$v ??
          _$UpdateIslandRequest._(
            island: island.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'island';
        island.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UpdateIslandRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
