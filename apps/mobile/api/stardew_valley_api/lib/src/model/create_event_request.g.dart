// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_event_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateEventRequest extends CreateEventRequest {
  @override
  final String islandId;
  @override
  final String userId;
  @override
  final String resourceId;
  @override
  final EventRequestTriggerType type;

  factory _$CreateEventRequest(
          [void Function(CreateEventRequestBuilder)? updates]) =>
      (CreateEventRequestBuilder()..update(updates))._build();

  _$CreateEventRequest._(
      {required this.islandId,
      required this.userId,
      required this.resourceId,
      required this.type})
      : super._();
  @override
  CreateEventRequest rebuild(
          void Function(CreateEventRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateEventRequestBuilder toBuilder() =>
      CreateEventRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateEventRequest &&
        islandId == other.islandId &&
        userId == other.userId &&
        resourceId == other.resourceId &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, islandId.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, resourceId.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateEventRequest')
          ..add('islandId', islandId)
          ..add('userId', userId)
          ..add('resourceId', resourceId)
          ..add('type', type))
        .toString();
  }
}

class CreateEventRequestBuilder
    implements Builder<CreateEventRequest, CreateEventRequestBuilder> {
  _$CreateEventRequest? _$v;

  String? _islandId;
  String? get islandId => _$this._islandId;
  set islandId(String? islandId) => _$this._islandId = islandId;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _resourceId;
  String? get resourceId => _$this._resourceId;
  set resourceId(String? resourceId) => _$this._resourceId = resourceId;

  EventRequestTriggerType? _type;
  EventRequestTriggerType? get type => _$this._type;
  set type(EventRequestTriggerType? type) => _$this._type = type;

  CreateEventRequestBuilder() {
    CreateEventRequest._defaults(this);
  }

  CreateEventRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _islandId = $v.islandId;
      _userId = $v.userId;
      _resourceId = $v.resourceId;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateEventRequest other) {
    _$v = other as _$CreateEventRequest;
  }

  @override
  void update(void Function(CreateEventRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateEventRequest build() => _build();

  _$CreateEventRequest _build() {
    final _$result = _$v ??
        _$CreateEventRequest._(
          islandId: BuiltValueNullFieldError.checkNotNull(
              islandId, r'CreateEventRequest', 'islandId'),
          userId: BuiltValueNullFieldError.checkNotNull(
              userId, r'CreateEventRequest', 'userId'),
          resourceId: BuiltValueNullFieldError.checkNotNull(
              resourceId, r'CreateEventRequest', 'resourceId'),
          type: BuiltValueNullFieldError.checkNotNull(
              type, r'CreateEventRequest', 'type'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
