// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_user_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LoginUserResponse extends LoginUserResponse {
  @override
  final String? accessToken;
  @override
  final String? refreshToken;

  factory _$LoginUserResponse(
          [void Function(LoginUserResponseBuilder)? updates]) =>
      (LoginUserResponseBuilder()..update(updates))._build();

  _$LoginUserResponse._({this.accessToken, this.refreshToken}) : super._();
  @override
  LoginUserResponse rebuild(void Function(LoginUserResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginUserResponseBuilder toBuilder() =>
      LoginUserResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginUserResponse &&
        accessToken == other.accessToken &&
        refreshToken == other.refreshToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, accessToken.hashCode);
    _$hash = $jc(_$hash, refreshToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LoginUserResponse')
          ..add('accessToken', accessToken)
          ..add('refreshToken', refreshToken))
        .toString();
  }
}

class LoginUserResponseBuilder
    implements Builder<LoginUserResponse, LoginUserResponseBuilder> {
  _$LoginUserResponse? _$v;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  String? _refreshToken;
  String? get refreshToken => _$this._refreshToken;
  set refreshToken(String? refreshToken) => _$this._refreshToken = refreshToken;

  LoginUserResponseBuilder() {
    LoginUserResponse._defaults(this);
  }

  LoginUserResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accessToken = $v.accessToken;
      _refreshToken = $v.refreshToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginUserResponse other) {
    _$v = other as _$LoginUserResponse;
  }

  @override
  void update(void Function(LoginUserResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LoginUserResponse build() => _build();

  _$LoginUserResponse _build() {
    final _$result = _$v ??
        _$LoginUserResponse._(
          accessToken: accessToken,
          refreshToken: refreshToken,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
