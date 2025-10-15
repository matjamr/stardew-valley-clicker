// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retrieve_user_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RetrieveUserRequest extends RetrieveUserRequest {
  @override
  final String id;

  factory _$RetrieveUserRequest(
          [void Function(RetrieveUserRequestBuilder)? updates]) =>
      (RetrieveUserRequestBuilder()..update(updates))._build();

  _$RetrieveUserRequest._({required this.id}) : super._();
  @override
  RetrieveUserRequest rebuild(
          void Function(RetrieveUserRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RetrieveUserRequestBuilder toBuilder() =>
      RetrieveUserRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RetrieveUserRequest && id == other.id;
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
    return (newBuiltValueToStringHelper(r'RetrieveUserRequest')..add('id', id))
        .toString();
  }
}

class RetrieveUserRequestBuilder
    implements Builder<RetrieveUserRequest, RetrieveUserRequestBuilder> {
  _$RetrieveUserRequest? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  RetrieveUserRequestBuilder() {
    RetrieveUserRequest._defaults(this);
  }

  RetrieveUserRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RetrieveUserRequest other) {
    _$v = other as _$RetrieveUserRequest;
  }

  @override
  void update(void Function(RetrieveUserRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RetrieveUserRequest build() => _build();

  _$RetrieveUserRequest _build() {
    final _$result = _$v ??
        _$RetrieveUserRequest._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'RetrieveUserRequest', 'id'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
