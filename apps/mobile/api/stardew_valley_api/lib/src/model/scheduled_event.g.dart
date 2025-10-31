// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduled_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ScheduledEventStatusEnum _$scheduledEventStatusEnum_PENDING =
    const ScheduledEventStatusEnum._('PENDING');
const ScheduledEventStatusEnum _$scheduledEventStatusEnum_COMPLETED =
    const ScheduledEventStatusEnum._('COMPLETED');
const ScheduledEventStatusEnum _$scheduledEventStatusEnum_FAILED =
    const ScheduledEventStatusEnum._('FAILED');

ScheduledEventStatusEnum _$scheduledEventStatusEnumValueOf(String name) {
  switch (name) {
    case 'PENDING':
      return _$scheduledEventStatusEnum_PENDING;
    case 'COMPLETED':
      return _$scheduledEventStatusEnum_COMPLETED;
    case 'FAILED':
      return _$scheduledEventStatusEnum_FAILED;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ScheduledEventStatusEnum> _$scheduledEventStatusEnumValues =
    BuiltSet<ScheduledEventStatusEnum>(const <ScheduledEventStatusEnum>[
  _$scheduledEventStatusEnum_PENDING,
  _$scheduledEventStatusEnum_COMPLETED,
  _$scheduledEventStatusEnum_FAILED,
]);

Serializer<ScheduledEventStatusEnum> _$scheduledEventStatusEnumSerializer =
    _$ScheduledEventStatusEnumSerializer();

class _$ScheduledEventStatusEnumSerializer
    implements PrimitiveSerializer<ScheduledEventStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'PENDING': 'PENDING',
    'COMPLETED': 'COMPLETED',
    'FAILED': 'FAILED',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'PENDING': 'PENDING',
    'COMPLETED': 'COMPLETED',
    'FAILED': 'FAILED',
  };

  @override
  final Iterable<Type> types = const <Type>[ScheduledEventStatusEnum];
  @override
  final String wireName = 'ScheduledEventStatusEnum';

  @override
  Object serialize(Serializers serializers, ScheduledEventStatusEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ScheduledEventStatusEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ScheduledEventStatusEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ScheduledEvent extends ScheduledEvent {
  @override
  final String? id;
  @override
  final DateTime? createdDate;
  @override
  final DateTime? executionDate;
  @override
  final String? islandId;
  @override
  final String? assetId;
  @override
  final ScheduledEventStatusEnum? status;
  @override
  final String? userId;

  factory _$ScheduledEvent([void Function(ScheduledEventBuilder)? updates]) =>
      (ScheduledEventBuilder()..update(updates))._build();

  _$ScheduledEvent._(
      {this.id,
      this.createdDate,
      this.executionDate,
      this.islandId,
      this.assetId,
      this.status,
      this.userId})
      : super._();
  @override
  ScheduledEvent rebuild(void Function(ScheduledEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScheduledEventBuilder toBuilder() => ScheduledEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScheduledEvent &&
        id == other.id &&
        createdDate == other.createdDate &&
        executionDate == other.executionDate &&
        islandId == other.islandId &&
        assetId == other.assetId &&
        status == other.status &&
        userId == other.userId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, createdDate.hashCode);
    _$hash = $jc(_$hash, executionDate.hashCode);
    _$hash = $jc(_$hash, islandId.hashCode);
    _$hash = $jc(_$hash, assetId.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ScheduledEvent')
          ..add('id', id)
          ..add('createdDate', createdDate)
          ..add('executionDate', executionDate)
          ..add('islandId', islandId)
          ..add('assetId', assetId)
          ..add('status', status)
          ..add('userId', userId))
        .toString();
  }
}

class ScheduledEventBuilder
    implements Builder<ScheduledEvent, ScheduledEventBuilder> {
  _$ScheduledEvent? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  DateTime? _createdDate;
  DateTime? get createdDate => _$this._createdDate;
  set createdDate(DateTime? createdDate) => _$this._createdDate = createdDate;

  DateTime? _executionDate;
  DateTime? get executionDate => _$this._executionDate;
  set executionDate(DateTime? executionDate) =>
      _$this._executionDate = executionDate;

  String? _islandId;
  String? get islandId => _$this._islandId;
  set islandId(String? islandId) => _$this._islandId = islandId;

  String? _assetId;
  String? get assetId => _$this._assetId;
  set assetId(String? assetId) => _$this._assetId = assetId;

  ScheduledEventStatusEnum? _status;
  ScheduledEventStatusEnum? get status => _$this._status;
  set status(ScheduledEventStatusEnum? status) => _$this._status = status;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  ScheduledEventBuilder() {
    ScheduledEvent._defaults(this);
  }

  ScheduledEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _createdDate = $v.createdDate;
      _executionDate = $v.executionDate;
      _islandId = $v.islandId;
      _assetId = $v.assetId;
      _status = $v.status;
      _userId = $v.userId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScheduledEvent other) {
    _$v = other as _$ScheduledEvent;
  }

  @override
  void update(void Function(ScheduledEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ScheduledEvent build() => _build();

  _$ScheduledEvent _build() {
    final _$result = _$v ??
        _$ScheduledEvent._(
          id: id,
          createdDate: createdDate,
          executionDate: executionDate,
          islandId: islandId,
          assetId: assetId,
          status: status,
          userId: userId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
