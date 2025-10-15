// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_user_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VerifyUserResponse extends VerifyUserResponse {
  @override
  final String? name;
  @override
  final String? surname;
  @override
  final String? email;

  factory _$VerifyUserResponse(
          [void Function(VerifyUserResponseBuilder)? updates]) =>
      (VerifyUserResponseBuilder()..update(updates))._build();

  _$VerifyUserResponse._({this.name, this.surname, this.email}) : super._();
  @override
  VerifyUserResponse rebuild(
          void Function(VerifyUserResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VerifyUserResponseBuilder toBuilder() =>
      VerifyUserResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VerifyUserResponse &&
        name == other.name &&
        surname == other.surname &&
        email == other.email;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, surname.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VerifyUserResponse')
          ..add('name', name)
          ..add('surname', surname)
          ..add('email', email))
        .toString();
  }
}

class VerifyUserResponseBuilder
    implements Builder<VerifyUserResponse, VerifyUserResponseBuilder> {
  _$VerifyUserResponse? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _surname;
  String? get surname => _$this._surname;
  set surname(String? surname) => _$this._surname = surname;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  VerifyUserResponseBuilder() {
    VerifyUserResponse._defaults(this);
  }

  VerifyUserResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _surname = $v.surname;
      _email = $v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VerifyUserResponse other) {
    _$v = other as _$VerifyUserResponse;
  }

  @override
  void update(void Function(VerifyUserResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VerifyUserResponse build() => _build();

  _$VerifyUserResponse _build() {
    final _$result = _$v ??
        _$VerifyUserResponse._(
          name: name,
          surname: surname,
          email: email,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
