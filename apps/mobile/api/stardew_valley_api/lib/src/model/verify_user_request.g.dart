// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_user_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VerifyUserRequest extends VerifyUserRequest {
  @override
  final String accessToken;

  factory _$VerifyUserRequest(
          [void Function(VerifyUserRequestBuilder)? updates]) =>
      (VerifyUserRequestBuilder()..update(updates))._build();

  _$VerifyUserRequest._({required this.accessToken}) : super._();
  @override
  VerifyUserRequest rebuild(void Function(VerifyUserRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VerifyUserRequestBuilder toBuilder() =>
      VerifyUserRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VerifyUserRequest && accessToken == other.accessToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, accessToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VerifyUserRequest')
          ..add('accessToken', accessToken))
        .toString();
  }
}

class VerifyUserRequestBuilder
    implements Builder<VerifyUserRequest, VerifyUserRequestBuilder> {
  _$VerifyUserRequest? _$v;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  VerifyUserRequestBuilder() {
    VerifyUserRequest._defaults(this);
  }

  VerifyUserRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accessToken = $v.accessToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VerifyUserRequest other) {
    _$v = other as _$VerifyUserRequest;
  }

  @override
  void update(void Function(VerifyUserRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VerifyUserRequest build() => _build();

  _$VerifyUserRequest _build() {
    final _$result = _$v ??
        _$VerifyUserRequest._(
          accessToken: BuiltValueNullFieldError.checkNotNull(
              accessToken, r'VerifyUserRequest', 'accessToken'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
