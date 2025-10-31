//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_event_response.g.dart';

/// CreateEventResponse
///
/// Properties:
/// * [id] - Unique identifier of the created event
/// * [completionTimestamp] - Timestamp when the event will complete
@BuiltValue()
abstract class CreateEventResponse
    implements Built<CreateEventResponse, CreateEventResponseBuilder> {
  /// Unique identifier of the created event
  @BuiltValueField(wireName: r'id')
  String? get id;

  /// Timestamp when the event will complete
  @BuiltValueField(wireName: r'completionTimestamp')
  DateTime? get completionTimestamp;

  CreateEventResponse._();

  factory CreateEventResponse([void updates(CreateEventResponseBuilder b)]) =
      _$CreateEventResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateEventResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateEventResponse> get serializer =>
      _$CreateEventResponseSerializer();
}

class _$CreateEventResponseSerializer
    implements PrimitiveSerializer<CreateEventResponse> {
  @override
  final Iterable<Type> types = const [
    CreateEventResponse,
    _$CreateEventResponse
  ];

  @override
  final String wireName = r'CreateEventResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateEventResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.completionTimestamp != null) {
      yield r'completionTimestamp';
      yield serializers.serialize(
        object.completionTimestamp,
        specifiedType: const FullType(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateEventResponse object, {
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
    required CreateEventResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'completionTimestamp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.completionTimestamp = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateEventResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateEventResponseBuilder();
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
