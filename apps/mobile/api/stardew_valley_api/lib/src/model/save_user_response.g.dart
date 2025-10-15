// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_user_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SaveUserResponse extends SaveUserResponse {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? surname;
  @override
  final String? email;

  factory _$SaveUserResponse(
          [void Function(SaveUserResponseBuilder)? updates]) =>
      (SaveUserResponseBuilder()..update(updates))._build();

  _$SaveUserResponse._({this.id, this.name, this.surname, this.email})
      : super._();
  @override
  SaveUserResponse rebuild(void Function(SaveUserResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SaveUserResponseBuilder toBuilder() =>
      SaveUserResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SaveUserResponse &&
        id == other.id &&
        name == other.name &&
        surname == other.surname &&
        email == other.email;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, surname.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SaveUserResponse')
          ..add('id', id)
          ..add('name', name)
          ..add('surname', surname)
          ..add('email', email))
        .toString();
  }
}

class SaveUserResponseBuilder
    implements Builder<SaveUserResponse, SaveUserResponseBuilder> {
  _$SaveUserResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _surname;
  String? get surname => _$this._surname;
  set surname(String? surname) => _$this._surname = surname;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  SaveUserResponseBuilder() {
    SaveUserResponse._defaults(this);
  }

  SaveUserResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _surname = $v.surname;
      _email = $v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SaveUserResponse other) {
    _$v = other as _$SaveUserResponse;
  }

  @override
  void update(void Function(SaveUserResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SaveUserResponse build() => _build();

  _$SaveUserResponse _build() {
    final _$result = _$v ??
        _$SaveUserResponse._(
          id: id,
          name: name,
          surname: surname,
          email: email,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
