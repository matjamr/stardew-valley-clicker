// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ActionType _$VOID = const ActionType._('VOID');
const ActionType _$START_TIMER = const ActionType._('START_TIMER');
const ActionType _$END_TIMER = const ActionType._('END_TIMER');
const ActionType _$COLLECT_REWARD = const ActionType._('COLLECT_REWARD');
const ActionType _$SPEED_UP = const ActionType._('SPEED_UP');
const ActionType _$FINISH_NOW = const ActionType._('FINISH_NOW');

ActionType _$valueOf(String name) {
  switch (name) {
    case 'VOID':
      return _$VOID;
    case 'START_TIMER':
      return _$START_TIMER;
    case 'END_TIMER':
      return _$END_TIMER;
    case 'COLLECT_REWARD':
      return _$COLLECT_REWARD;
    case 'SPEED_UP':
      return _$SPEED_UP;
    case 'FINISH_NOW':
      return _$FINISH_NOW;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ActionType> _$values = BuiltSet<ActionType>(const <ActionType>[
  _$VOID,
  _$START_TIMER,
  _$END_TIMER,
  _$COLLECT_REWARD,
  _$SPEED_UP,
  _$FINISH_NOW,
]);

class _$ActionTypeMeta {
  const _$ActionTypeMeta();
  ActionType get VOID => _$VOID;
  ActionType get START_TIMER => _$START_TIMER;
  ActionType get END_TIMER => _$END_TIMER;
  ActionType get COLLECT_REWARD => _$COLLECT_REWARD;
  ActionType get SPEED_UP => _$SPEED_UP;
  ActionType get FINISH_NOW => _$FINISH_NOW;
  ActionType valueOf(String name) => _$valueOf(name);
  BuiltSet<ActionType> get values => _$values;
}

abstract class _$ActionTypeMixin {
  // ignore: non_constant_identifier_names
  _$ActionTypeMeta get ActionType => const _$ActionTypeMeta();
}

Serializer<ActionType> _$actionTypeSerializer = _$ActionTypeSerializer();

class _$ActionTypeSerializer implements PrimitiveSerializer<ActionType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'VOID': 'VOID',
    'START_TIMER': 'START_TIMER',
    'END_TIMER': 'END_TIMER',
    'COLLECT_REWARD': 'COLLECT_REWARD',
    'SPEED_UP': 'SPEED_UP',
    'FINISH_NOW': 'FINISH_NOW',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'VOID': 'VOID',
    'START_TIMER': 'START_TIMER',
    'END_TIMER': 'END_TIMER',
    'COLLECT_REWARD': 'COLLECT_REWARD',
    'SPEED_UP': 'SPEED_UP',
    'FINISH_NOW': 'FINISH_NOW',
  };

  @override
  final Iterable<Type> types = const <Type>[ActionType];
  @override
  final String wireName = 'ActionType';

  @override
  Object serialize(Serializers serializers, ActionType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ActionType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ActionType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
