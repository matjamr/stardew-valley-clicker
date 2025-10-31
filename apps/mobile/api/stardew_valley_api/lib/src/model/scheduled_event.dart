//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'scheduled_event.g.dart';

/// ScheduledEvent
///
/// Properties:
/// * [id] - Unique identifier of the event
/// * [createdDate] - When the event was created
/// * [executionDate] - When the event will execute
/// * [islandId] - ID of the island
/// * [assetId] - ID of the asset/resource
/// * [status] - Current status of the event
/// * [userId] - ID of the user who created the event
@BuiltValue()
abstract class ScheduledEvent
    implements Built<ScheduledEvent, ScheduledEventBuilder> {
  /// Unique identifier of the event
  @BuiltValueField(wireName: r'id')
  String? get id;

  /// When the event was created
  @BuiltValueField(wireName: r'createdDate')
  DateTime? get createdDate;

  /// When the event will execute
  @BuiltValueField(wireName: r'executionDate')
  DateTime? get executionDate;

  /// ID of the island
  @BuiltValueField(wireName: r'islandId')
  String? get islandId;

  /// ID of the asset/resource
  @BuiltValueField(wireName: r'assetId')
  String? get assetId;

  /// Current status of the event
  @BuiltValueField(wireName: r'status')
  ScheduledEventStatusEnum? get status;
  // enum statusEnum {  PENDING,  COMPLETED,  FAILED,  };

  /// ID of the user who created the event
  @BuiltValueField(wireName: r'userId')
  String? get userId;

  ScheduledEvent._();

  factory ScheduledEvent([void updates(ScheduledEventBuilder b)]) =
      _$ScheduledEvent;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ScheduledEventBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ScheduledEvent> get serializer =>
      _$ScheduledEventSerializer();
}

class _$ScheduledEventSerializer
    implements PrimitiveSerializer<ScheduledEvent> {
  @override
  final Iterable<Type> types = const [ScheduledEvent, _$ScheduledEvent];

  @override
  final String wireName = r'ScheduledEvent';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ScheduledEvent object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.createdDate != null) {
      yield r'createdDate';
      yield serializers.serialize(
        object.createdDate,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.executionDate != null) {
      yield r'executionDate';
      yield serializers.serialize(
        object.executionDate,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.islandId != null) {
      yield r'islandId';
      yield serializers.serialize(
        object.islandId,
        specifiedType: const FullType(String),
      );
    }
    if (object.assetId != null) {
      yield r'assetId';
      yield serializers.serialize(
        object.assetId,
        specifiedType: const FullType(String),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(ScheduledEventStatusEnum),
      );
    }
    if (object.userId != null) {
      yield r'userId';
      yield serializers.serialize(
        object.userId,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ScheduledEvent object, {
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
    required ScheduledEventBuilder result,
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
        case r'createdDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdDate = valueDes;
          break;
        case r'executionDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.executionDate = valueDes;
          break;
        case r'islandId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.islandId = valueDes;
          break;
        case r'assetId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.assetId = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ScheduledEventStatusEnum),
          ) as ScheduledEventStatusEnum;
          result.status = valueDes;
          break;
        case r'userId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.userId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ScheduledEvent deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ScheduledEventBuilder();
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

class ScheduledEventStatusEnum extends EnumClass {
  /// Current status of the event
  @BuiltValueEnumConst(wireName: r'PENDING')
  static const ScheduledEventStatusEnum PENDING =
      _$scheduledEventStatusEnum_PENDING;

  /// Current status of the event
  @BuiltValueEnumConst(wireName: r'COMPLETED')
  static const ScheduledEventStatusEnum COMPLETED =
      _$scheduledEventStatusEnum_COMPLETED;

  /// Current status of the event
  @BuiltValueEnumConst(wireName: r'FAILED')
  static const ScheduledEventStatusEnum FAILED =
      _$scheduledEventStatusEnum_FAILED;

  static Serializer<ScheduledEventStatusEnum> get serializer =>
      _$scheduledEventStatusEnumSerializer;

  const ScheduledEventStatusEnum._(String name) : super(name);

  static BuiltSet<ScheduledEventStatusEnum> get values =>
      _$scheduledEventStatusEnumValues;
  static ScheduledEventStatusEnum valueOf(String name) =>
      _$scheduledEventStatusEnumValueOf(name);
}
