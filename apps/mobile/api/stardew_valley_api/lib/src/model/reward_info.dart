//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:stardew_valley_api/src/model/resource_reward.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'reward_info.g.dart';

/// RewardInfo
///
/// Properties:
/// * [resources]
/// * [xpGrant]
@BuiltValue()
abstract class RewardInfo implements Built<RewardInfo, RewardInfoBuilder> {
  @BuiltValueField(wireName: r'resources')
  BuiltList<ResourceReward>? get resources;

  @BuiltValueField(wireName: r'xpGrant')
  int? get xpGrant;

  RewardInfo._();

  factory RewardInfo([void updates(RewardInfoBuilder b)]) = _$RewardInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RewardInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RewardInfo> get serializer => _$RewardInfoSerializer();
}

class _$RewardInfoSerializer implements PrimitiveSerializer<RewardInfo> {
  @override
  final Iterable<Type> types = const [RewardInfo, _$RewardInfo];

  @override
  final String wireName = r'RewardInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RewardInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.resources != null) {
      yield r'resources';
      yield serializers.serialize(
        object.resources,
        specifiedType: const FullType(BuiltList, [FullType(ResourceReward)]),
      );
    }
    if (object.xpGrant != null) {
      yield r'xpGrant';
      yield serializers.serialize(
        object.xpGrant,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    RewardInfo object, {
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
    required RewardInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'resources':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(ResourceReward)]),
          ) as BuiltList<ResourceReward>;
          result.resources.replace(valueDes);
          break;
        case r'xpGrant':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.xpGrant = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RewardInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RewardInfoBuilder();
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
