//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:stardew_valley_api/src/model/reward_info.dart';
import 'package:stardew_valley_api/src/model/timer_info.dart';
import 'package:stardew_valley_api/src/model/action_type.dart';
import 'package:stardew_valley_api/src/model/energy_info.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'on_click_action.g.dart';

/// OnClickAction
///
/// Properties:
/// * [actionType]
/// * [timerInfo]
/// * [rewardInfo]
/// * [energyInfo]
@BuiltValue()
abstract class OnClickAction
    implements Built<OnClickAction, OnClickActionBuilder> {
  @BuiltValueField(wireName: r'actionType')
  ActionType? get actionType;
  // enum actionTypeEnum {  VOID,  START_TIMER,  END_TIMER,  COLLECT_REWARD,  SPEED_UP,  FINISH_NOW,  };

  @BuiltValueField(wireName: r'timerInfo')
  TimerInfo? get timerInfo;

  @BuiltValueField(wireName: r'rewardInfo')
  RewardInfo? get rewardInfo;

  @BuiltValueField(wireName: r'energyInfo')
  EnergyInfo? get energyInfo;

  OnClickAction._();

  factory OnClickAction([void updates(OnClickActionBuilder b)]) =
      _$OnClickAction;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OnClickActionBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<OnClickAction> get serializer =>
      _$OnClickActionSerializer();
}

class _$OnClickActionSerializer implements PrimitiveSerializer<OnClickAction> {
  @override
  final Iterable<Type> types = const [OnClickAction, _$OnClickAction];

  @override
  final String wireName = r'OnClickAction';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    OnClickAction object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.actionType != null) {
      yield r'actionType';
      yield serializers.serialize(
        object.actionType,
        specifiedType: const FullType(ActionType),
      );
    }
    if (object.timerInfo != null) {
      yield r'timerInfo';
      yield serializers.serialize(
        object.timerInfo,
        specifiedType: const FullType(TimerInfo),
      );
    }
    if (object.rewardInfo != null) {
      yield r'rewardInfo';
      yield serializers.serialize(
        object.rewardInfo,
        specifiedType: const FullType(RewardInfo),
      );
    }
    if (object.energyInfo != null) {
      yield r'energyInfo';
      yield serializers.serialize(
        object.energyInfo,
        specifiedType: const FullType(EnergyInfo),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    OnClickAction object, {
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
    required OnClickActionBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'actionType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ActionType),
          ) as ActionType;
          result.actionType = valueDes;
          break;
        case r'timerInfo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(TimerInfo),
          ) as TimerInfo;
          result.timerInfo.replace(valueDes);
          break;
        case r'rewardInfo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(RewardInfo),
          ) as RewardInfo;
          result.rewardInfo.replace(valueDes);
          break;
        case r'energyInfo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(EnergyInfo),
          ) as EnergyInfo;
          result.energyInfo.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  OnClickAction deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = OnClickActionBuilder();
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
