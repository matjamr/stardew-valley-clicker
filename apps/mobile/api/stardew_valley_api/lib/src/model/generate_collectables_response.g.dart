// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_collectables_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenerateCollectablesResponse extends GenerateCollectablesResponse {
  @override
  final bool? success;
  @override
  final String? message;
  @override
  final int? count;

  factory _$GenerateCollectablesResponse(
          [void Function(GenerateCollectablesResponseBuilder)? updates]) =>
      (GenerateCollectablesResponseBuilder()..update(updates))._build();

  _$GenerateCollectablesResponse._({this.success, this.message, this.count})
      : super._();
  @override
  GenerateCollectablesResponse rebuild(
          void Function(GenerateCollectablesResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenerateCollectablesResponseBuilder toBuilder() =>
      GenerateCollectablesResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenerateCollectablesResponse &&
        success == other.success &&
        message == other.message &&
        count == other.count;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GenerateCollectablesResponse')
          ..add('success', success)
          ..add('message', message)
          ..add('count', count))
        .toString();
  }
}

class GenerateCollectablesResponseBuilder
    implements
        Builder<GenerateCollectablesResponse,
            GenerateCollectablesResponseBuilder> {
  _$GenerateCollectablesResponse? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  GenerateCollectablesResponseBuilder() {
    GenerateCollectablesResponse._defaults(this);
  }

  GenerateCollectablesResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _message = $v.message;
      _count = $v.count;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GenerateCollectablesResponse other) {
    _$v = other as _$GenerateCollectablesResponse;
  }

  @override
  void update(void Function(GenerateCollectablesResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenerateCollectablesResponse build() => _build();

  _$GenerateCollectablesResponse _build() {
    final _$result = _$v ??
        _$GenerateCollectablesResponse._(
          success: success,
          message: message,
          count: count,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
