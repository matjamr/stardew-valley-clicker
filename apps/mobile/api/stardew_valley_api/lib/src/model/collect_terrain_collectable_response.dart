//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:stardew_valley_api/src/model/reward_info.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'collect_terrain_collectable_response.g.dart';

/// CollectTerrainCollectableResponse
///
/// Properties:
/// * [success]
/// * [message]
/// * [rewards]
@BuiltValue()
abstract class CollectTerrainCollectableResponse
    implements
        Built<CollectTerrainCollectableResponse,
            CollectTerrainCollectableResponseBuilder> {
  @BuiltValueField(wireName: r'success')
  bool? get success;

  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'rewards')
  RewardInfo? get rewards;

  CollectTerrainCollectableResponse._();

  factory CollectTerrainCollectableResponse(
          [void updates(CollectTerrainCollectableResponseBuilder b)]) =
      _$CollectTerrainCollectableResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CollectTerrainCollectableResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CollectTerrainCollectableResponse> get serializer =>
      _$CollectTerrainCollectableResponseSerializer();
}

class _$CollectTerrainCollectableResponseSerializer
    implements PrimitiveSerializer<CollectTerrainCollectableResponse> {
  @override
  final Iterable<Type> types = const [
    CollectTerrainCollectableResponse,
    _$CollectTerrainCollectableResponse
  ];

  @override
  final String wireName = r'CollectTerrainCollectableResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CollectTerrainCollectableResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.success != null) {
      yield r'success';
      yield serializers.serialize(
        object.success,
        specifiedType: const FullType(bool),
      );
    }
    if (object.message != null) {
      yield r'message';
      yield serializers.serialize(
        object.message,
        specifiedType: const FullType(String),
      );
    }
    if (object.rewards != null) {
      yield r'rewards';
      yield serializers.serialize(
        object.rewards,
        specifiedType: const FullType(RewardInfo),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CollectTerrainCollectableResponse object, {
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
    required CollectTerrainCollectableResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'success':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.success = valueDes;
          break;
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.message = valueDes;
          break;
        case r'rewards':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(RewardInfo),
          ) as RewardInfo;
          result.rewards.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CollectTerrainCollectableResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CollectTerrainCollectableResponseBuilder();
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
