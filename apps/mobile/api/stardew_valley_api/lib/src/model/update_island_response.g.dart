// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_island_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateIslandResponse extends UpdateIslandResponse {
  @override
  final bool? success;
  @override
  final String? message;

  factory _$UpdateIslandResponse(
          [void Function(UpdateIslandResponseBuilder)? updates]) =>
      (UpdateIslandResponseBuilder()..update(updates))._build();

  _$UpdateIslandResponse._({this.success, this.message}) : super._();
  @override
  UpdateIslandResponse rebuild(
          void Function(UpdateIslandResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateIslandResponseBuilder toBuilder() =>
      UpdateIslandResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateIslandResponse &&
        success == other.success &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateIslandResponse')
          ..add('success', success)
          ..add('message', message))
        .toString();
  }
}

class UpdateIslandResponseBuilder
    implements Builder<UpdateIslandResponse, UpdateIslandResponseBuilder> {
  _$UpdateIslandResponse? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  UpdateIslandResponseBuilder() {
    UpdateIslandResponse._defaults(this);
  }

  UpdateIslandResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateIslandResponse other) {
    _$v = other as _$UpdateIslandResponse;
  }

  @override
  void update(void Function(UpdateIslandResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateIslandResponse build() => _build();

  _$UpdateIslandResponse _build() {
    final _$result = _$v ??
        _$UpdateIslandResponse._(
          success: success,
          message: message,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
