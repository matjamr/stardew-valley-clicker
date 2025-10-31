//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:stardew_valley_api/src/model/event_request_trigger_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_event_request.g.dart';

/// CreateEventRequest
///
/// Properties:
/// * [islandId] - ID of the island where the event occurs
/// * [userId] - ID of the user triggering the event
/// * [resourceId] - ID of the resource/asset being interacted with
/// * [type]
@BuiltValue()
abstract class CreateEventRequest
    implements Built<CreateEventRequest, CreateEventRequestBuilder> {
  /// ID of the island where the event occurs
  @BuiltValueField(wireName: r'islandId')
  String get islandId;

  /// ID of the user triggering the event
  @BuiltValueField(wireName: r'userId')
  String get userId;

  /// ID of the resource/asset being interacted with
  @BuiltValueField(wireName: r'resourceId')
  String get resourceId;

  @BuiltValueField(wireName: r'type')
  EventRequestTriggerType get type;
  // enum typeEnum {  UNKNOWN_TYPE,  MINES_TYPE,  };

  CreateEventRequest._();

  factory CreateEventRequest([void updates(CreateEventRequestBuilder b)]) =
      _$CreateEventRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateEventRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateEventRequest> get serializer =>
      _$CreateEventRequestSerializer();
}

class _$CreateEventRequestSerializer
    implements PrimitiveSerializer<CreateEventRequest> {
  @override
  final Iterable<Type> types = const [CreateEventRequest, _$CreateEventRequest];

  @override
  final String wireName = r'CreateEventRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateEventRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'islandId';
    yield serializers.serialize(
      object.islandId,
      specifiedType: const FullType(String),
    );
    yield r'userId';
    yield serializers.serialize(
      object.userId,
      specifiedType: const FullType(String),
    );
    yield r'resourceId';
    yield serializers.serialize(
      object.resourceId,
      specifiedType: const FullType(String),
    );
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(EventRequestTriggerType),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateEventRequest object, {
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
    required CreateEventRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'islandId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.islandId = valueDes;
          break;
        case r'userId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.userId = valueDes;
          break;
        case r'resourceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.resourceId = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(EventRequestTriggerType),
          ) as EventRequestTriggerType;
          result.type = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateEventRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateEventRequestBuilder();
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
