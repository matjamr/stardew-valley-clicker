//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'action_type.g.dart';

class ActionType extends EnumClass {
  @BuiltValueEnumConst(wireName: r'VOID')
  static const ActionType VOID = _$VOID;
  @BuiltValueEnumConst(wireName: r'START_TIMER')
  static const ActionType START_TIMER = _$START_TIMER;
  @BuiltValueEnumConst(wireName: r'END_TIMER')
  static const ActionType END_TIMER = _$END_TIMER;
  @BuiltValueEnumConst(wireName: r'COLLECT_REWARD')
  static const ActionType COLLECT_REWARD = _$COLLECT_REWARD;
  @BuiltValueEnumConst(wireName: r'SPEED_UP')
  static const ActionType SPEED_UP = _$SPEED_UP;
  @BuiltValueEnumConst(wireName: r'FINISH_NOW')
  static const ActionType FINISH_NOW = _$FINISH_NOW;

  static Serializer<ActionType> get serializer => _$actionTypeSerializer;

  const ActionType._(String name) : super(name);

  static BuiltSet<ActionType> get values => _$values;
  static ActionType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ActionTypeMixin = Object with _$ActionTypeMixin;
