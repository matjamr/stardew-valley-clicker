// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_request_trigger_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const EventRequestTriggerType _$UNKNOWN_TYPE =
    const EventRequestTriggerType._('UNKNOWN_TYPE');
const EventRequestTriggerType _$MINES_TYPE =
    const EventRequestTriggerType._('MINES_TYPE');

EventRequestTriggerType _$valueOf(String name) {
  switch (name) {
    case 'UNKNOWN_TYPE':
      return _$UNKNOWN_TYPE;
    case 'MINES_TYPE':
      return _$MINES_TYPE;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<EventRequestTriggerType> _$values =
    BuiltSet<EventRequestTriggerType>(const <EventRequestTriggerType>[
  _$UNKNOWN_TYPE,
  _$MINES_TYPE,
]);

class _$EventRequestTriggerTypeMeta {
  const _$EventRequestTriggerTypeMeta();
  EventRequestTriggerType get UNKNOWN_TYPE => _$UNKNOWN_TYPE;
  EventRequestTriggerType get MINES_TYPE => _$MINES_TYPE;
  EventRequestTriggerType valueOf(String name) => _$valueOf(name);
  BuiltSet<EventRequestTriggerType> get values => _$values;
}

abstract class _$EventRequestTriggerTypeMixin {
  // ignore: non_constant_identifier_names
  _$EventRequestTriggerTypeMeta get EventRequestTriggerType =>
      const _$EventRequestTriggerTypeMeta();
}

Serializer<EventRequestTriggerType> _$eventRequestTriggerTypeSerializer =
    _$EventRequestTriggerTypeSerializer();

class _$EventRequestTriggerTypeSerializer
    implements PrimitiveSerializer<EventRequestTriggerType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'UNKNOWN_TYPE': 'UNKNOWN_TYPE',
    'MINES_TYPE': 'MINES_TYPE',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'UNKNOWN_TYPE': 'UNKNOWN_TYPE',
    'MINES_TYPE': 'MINES_TYPE',
  };

  @override
  final Iterable<Type> types = const <Type>[EventRequestTriggerType];
  @override
  final String wireName = 'EventRequestTriggerType';

  @override
  Object serialize(Serializers serializers, EventRequestTriggerType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  EventRequestTriggerType deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      EventRequestTriggerType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
