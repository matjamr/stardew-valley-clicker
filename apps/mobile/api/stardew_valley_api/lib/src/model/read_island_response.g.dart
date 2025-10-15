// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_island_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReadIslandResponse extends ReadIslandResponse {
  @override
  final Island? island;

  factory _$ReadIslandResponse(
          [void Function(ReadIslandResponseBuilder)? updates]) =>
      (ReadIslandResponseBuilder()..update(updates))._build();

  _$ReadIslandResponse._({this.island}) : super._();
  @override
  ReadIslandResponse rebuild(
          void Function(ReadIslandResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReadIslandResponseBuilder toBuilder() =>
      ReadIslandResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReadIslandResponse && island == other.island;
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
    return (newBuiltValueToStringHelper(r'ReadIslandResponse')
          ..add('island', island))
        .toString();
  }
}

class ReadIslandResponseBuilder
    implements Builder<ReadIslandResponse, ReadIslandResponseBuilder> {
  _$ReadIslandResponse? _$v;

  IslandBuilder? _island;
  IslandBuilder get island => _$this._island ??= IslandBuilder();
  set island(IslandBuilder? island) => _$this._island = island;

  ReadIslandResponseBuilder() {
    ReadIslandResponse._defaults(this);
  }

  ReadIslandResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _island = $v.island?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReadIslandResponse other) {
    _$v = other as _$ReadIslandResponse;
  }

  @override
  void update(void Function(ReadIslandResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReadIslandResponse build() => _build();

  _$ReadIslandResponse _build() {
    _$ReadIslandResponse _$result;
    try {
      _$result = _$v ??
          _$ReadIslandResponse._(
            island: _island?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'island';
        _island?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ReadIslandResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
