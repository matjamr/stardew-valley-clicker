//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'event_request_trigger_type.g.dart';

class EventRequestTriggerType extends EnumClass {
  /// Type of event being triggered
  @BuiltValueEnumConst(wireName: r'UNKNOWN_TYPE')
  static const EventRequestTriggerType UNKNOWN_TYPE = _$UNKNOWN_TYPE;

  /// Type of event being triggered
  @BuiltValueEnumConst(wireName: r'MINES_TYPE')
  static const EventRequestTriggerType MINES_TYPE = _$MINES_TYPE;

  static Serializer<EventRequestTriggerType> get serializer =>
      _$eventRequestTriggerTypeSerializer;

  const EventRequestTriggerType._(String name) : super(name);

  static BuiltSet<EventRequestTriggerType> get values => _$values;
  static EventRequestTriggerType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class EventRequestTriggerTypeMixin = Object
    with _$EventRequestTriggerTypeMixin;
