//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:stardew_valley_api/src/model/scheduled_event.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'read_event_response.g.dart';

/// ReadEventResponse
///
/// Properties:
/// * [event]
@BuiltValue()
abstract class ReadEventResponse
    implements Built<ReadEventResponse, ReadEventResponseBuilder> {
  @BuiltValueField(wireName: r'event')
  ScheduledEvent? get event;

  ReadEventResponse._();

  factory ReadEventResponse([void updates(ReadEventResponseBuilder b)]) =
      _$ReadEventResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReadEventResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReadEventResponse> get serializer =>
      _$ReadEventResponseSerializer();
}

class _$ReadEventResponseSerializer
    implements PrimitiveSerializer<ReadEventResponse> {
  @override
  final Iterable<Type> types = const [ReadEventResponse, _$ReadEventResponse];

  @override
  final String wireName = r'ReadEventResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReadEventResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.event != null) {
      yield r'event';
      yield serializers.serialize(
        object.event,
        specifiedType: const FullType(ScheduledEvent),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ReadEventResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ReadEventResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'event':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ScheduledEvent),
          ) as ScheduledEvent;
          result.event.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ReadEventResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReadEventResponseBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}
