// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_user_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SaveUserRequest extends SaveUserRequest {
  @override
  final String name;
  @override
  final String surname;
  @override
  final String email;

  factory _$SaveUserRequest([void Function(SaveUserRequestBuilder)? updates]) =>
      (SaveUserRequestBuilder()..update(updates))._build();

  _$SaveUserRequest._(
      {required this.name, required this.surname, required this.email})
      : super._();
  @override
  SaveUserRequest rebuild(void Function(SaveUserRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SaveUserRequestBuilder toBuilder() => SaveUserRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SaveUserRequest &&
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
    return (newBuiltValueToStringHelper(r'SaveUserRequest')
          ..add('name', name)
          ..add('surname', surname)
          ..add('email', email))
        .toString();
  }
}

class SaveUserRequestBuilder
    implements Builder<SaveUserRequest, SaveUserRequestBuilder> {
  _$SaveUserRequest? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _surname;
  String? get surname => _$this._surname;
  set surname(String? surname) => _$this._surname = surname;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  SaveUserRequestBuilder() {
    SaveUserRequest._defaults(this);
  }

  SaveUserRequestBuilder get _$this {
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
  void replace(SaveUserRequest other) {
    _$v = other as _$SaveUserRequest;
  }

  @override
  void update(void Function(SaveUserRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SaveUserRequest build() => _build();

  _$SaveUserRequest _build() {
    final _$result = _$v ??
        _$SaveUserRequest._(
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'SaveUserRequest', 'name'),
          surname: BuiltValueNullFieldError.checkNotNull(
              surname, r'SaveUserRequest', 'surname'),
          email: BuiltValueNullFieldError.checkNotNull(
              email, r'SaveUserRequest', 'email'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
