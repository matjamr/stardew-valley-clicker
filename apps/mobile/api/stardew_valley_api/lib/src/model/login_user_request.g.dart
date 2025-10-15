// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_user_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LoginUserRequest extends LoginUserRequest {
  @override
  final String email;
  @override
  final String password;

  factory _$LoginUserRequest(
          [void Function(LoginUserRequestBuilder)? updates]) =>
      (LoginUserRequestBuilder()..update(updates))._build();

  _$LoginUserRequest._({required this.email, required this.password})
      : super._();
  @override
  LoginUserRequest rebuild(void Function(LoginUserRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginUserRequestBuilder toBuilder() =>
      LoginUserRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginUserRequest &&
        email == other.email &&
        password == other.password;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LoginUserRequest')
          ..add('email', email)
          ..add('password', password))
        .toString();
  }
}

class LoginUserRequestBuilder
    implements Builder<LoginUserRequest, LoginUserRequestBuilder> {
  _$LoginUserRequest? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  LoginUserRequestBuilder() {
    LoginUserRequest._defaults(this);
  }

  LoginUserRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _password = $v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginUserRequest other) {
    _$v = other as _$LoginUserRequest;
  }

  @override
  void update(void Function(LoginUserRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LoginUserRequest build() => _build();

  _$LoginUserRequest _build() {
    final _$result = _$v ??
        _$LoginUserRequest._(
          email: BuiltValueNullFieldError.checkNotNull(
              email, r'LoginUserRequest', 'email'),
          password: BuiltValueNullFieldError.checkNotNull(
              password, r'LoginUserRequest', 'password'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
