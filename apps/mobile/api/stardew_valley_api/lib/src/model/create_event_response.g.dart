// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_event_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateEventResponse extends CreateEventResponse {
  @override
  final String? id;
  @override
  final DateTime? completionTimestamp;

  factory _$CreateEventResponse(
          [void Function(CreateEventResponseBuilder)? updates]) =>
      (CreateEventResponseBuilder()..update(updates))._build();

  _$CreateEventResponse._({this.id, this.completionTimestamp}) : super._();
  @override
  CreateEventResponse rebuild(
          void Function(CreateEventResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateEventResponseBuilder toBuilder() =>
      CreateEventResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateEventResponse &&
        id == other.id &&
        completionTimestamp == other.completionTimestamp;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, completionTimestamp.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateEventResponse')
          ..add('id', id)
          ..add('completionTimestamp', completionTimestamp))
        .toString();
  }
}

class CreateEventResponseBuilder
    implements Builder<CreateEventResponse, CreateEventResponseBuilder> {
  _$CreateEventResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  DateTime? _completionTimestamp;
  DateTime? get completionTimestamp => _$this._completionTimestamp;
  set completionTimestamp(DateTime? completionTimestamp) =>
      _$this._completionTimestamp = completionTimestamp;

  CreateEventResponseBuilder() {
    CreateEventResponse._defaults(this);
  }

  CreateEventResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _completionTimestamp = $v.completionTimestamp;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateEventResponse other) {
    _$v = other as _$CreateEventResponse;
  }

  @override
  void update(void Function(CreateEventResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateEventResponse build() => _build();

  _$CreateEventResponse _build() {
    final _$result = _$v ??
        _$CreateEventResponse._(
          id: id,
          completionTimestamp: completionTimestamp,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
