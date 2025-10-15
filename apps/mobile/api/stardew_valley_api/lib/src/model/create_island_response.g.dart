// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_island_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateIslandResponse extends CreateIslandResponse {
  @override
  final String? id;

  factory _$CreateIslandResponse(
          [void Function(CreateIslandResponseBuilder)? updates]) =>
      (CreateIslandResponseBuilder()..update(updates))._build();

  _$CreateIslandResponse._({this.id}) : super._();
  @override
  CreateIslandResponse rebuild(
          void Function(CreateIslandResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateIslandResponseBuilder toBuilder() =>
      CreateIslandResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateIslandResponse && id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateIslandResponse')..add('id', id))
        .toString();
  }
}

class CreateIslandResponseBuilder
    implements Builder<CreateIslandResponse, CreateIslandResponseBuilder> {
  _$CreateIslandResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  CreateIslandResponseBuilder() {
    CreateIslandResponse._defaults(this);
  }

  CreateIslandResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateIslandResponse other) {
    _$v = other as _$CreateIslandResponse;
  }

  @override
  void update(void Function(CreateIslandResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateIslandResponse build() => _build();

  _$CreateIslandResponse _build() {
    final _$result = _$v ??
        _$CreateIslandResponse._(
          id: id,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
