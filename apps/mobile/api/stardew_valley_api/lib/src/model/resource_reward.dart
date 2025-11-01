//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'resource_reward.g.dart';

/// ResourceReward
///
/// Properties:
/// * [resourceId]
/// * [amount]
@BuiltValue()
abstract class ResourceReward
    implements Built<ResourceReward, ResourceRewardBuilder> {
  @BuiltValueField(wireName: r'resourceId')
  String? get resourceId;

  @BuiltValueField(wireName: r'amount')
  int? get amount;

  ResourceReward._();

  factory ResourceReward([void updates(ResourceRewardBuilder b)]) =
      _$ResourceReward;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ResourceRewardBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ResourceReward> get serializer =>
      _$ResourceRewardSerializer();
}

class _$ResourceRewardSerializer
    implements PrimitiveSerializer<ResourceReward> {
  @override
  final Iterable<Type> types = const [ResourceReward, _$ResourceReward];

  @override
  final String wireName = r'ResourceReward';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ResourceReward object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.resourceId != null) {
      yield r'resourceId';
      yield serializers.serialize(
        object.resourceId,
        specifiedType: const FullType(String),
      );
    }
    if (object.amount != null) {
      yield r'amount';
      yield serializers.serialize(
        object.amount,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ResourceReward object, {
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
    required ResourceRewardBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'resourceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.resourceId = valueDes;
          break;
        case r'amount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.amount = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ResourceReward deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ResourceRewardBuilder();
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
