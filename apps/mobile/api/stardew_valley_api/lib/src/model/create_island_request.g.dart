// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_island_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateIslandRequest extends CreateIslandRequest {
  @override
  final String userId;
  @override
  final String variantId;
  @override
  final String name;

  factory _$CreateIslandRequest(
          [void Function(CreateIslandRequestBuilder)? updates]) =>
      (CreateIslandRequestBuilder()..update(updates))._build();

  _$CreateIslandRequest._(
      {required this.userId, required this.variantId, required this.name})
      : super._();
  @override
  CreateIslandRequest rebuild(
          void Function(CreateIslandRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateIslandRequestBuilder toBuilder() =>
      CreateIslandRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateIslandRequest &&
        userId == other.userId &&
        variantId == other.variantId &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, variantId.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateIslandRequest')
          ..add('userId', userId)
          ..add('variantId', variantId)
          ..add('name', name))
        .toString();
  }
}

class CreateIslandRequestBuilder
    implements Builder<CreateIslandRequest, CreateIslandRequestBuilder> {
  _$CreateIslandRequest? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _variantId;
  String? get variantId => _$this._variantId;
  set variantId(String? variantId) => _$this._variantId = variantId;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  CreateIslandRequestBuilder() {
    CreateIslandRequest._defaults(this);
  }

  CreateIslandRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _variantId = $v.variantId;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateIslandRequest other) {
    _$v = other as _$CreateIslandRequest;
  }

  @override
  void update(void Function(CreateIslandRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateIslandRequest build() => _build();

  _$CreateIslandRequest _build() {
    final _$result = _$v ??
        _$CreateIslandRequest._(
          userId: BuiltValueNullFieldError.checkNotNull(
              userId, r'CreateIslandRequest', 'userId'),
          variantId: BuiltValueNullFieldError.checkNotNull(
              variantId, r'CreateIslandRequest', 'variantId'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'CreateIslandRequest', 'name'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
