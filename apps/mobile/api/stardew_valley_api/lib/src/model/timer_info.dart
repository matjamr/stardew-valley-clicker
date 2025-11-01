//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'timer_info.g.dart';

/// TimerInfo
///
/// Properties:
/// * [durationSeconds]
/// * [timerId]
@BuiltValue()
abstract class TimerInfo implements Built<TimerInfo, TimerInfoBuilder> {
  @BuiltValueField(wireName: r'durationSeconds')
  int? get durationSeconds;

  @BuiltValueField(wireName: r'timerId')
  String? get timerId;

  TimerInfo._();

  factory TimerInfo([void updates(TimerInfoBuilder b)]) = _$TimerInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TimerInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TimerInfo> get serializer => _$TimerInfoSerializer();
}

class _$TimerInfoSerializer implements PrimitiveSerializer<TimerInfo> {
  @override
  final Iterable<Type> types = const [TimerInfo, _$TimerInfo];

  @override
  final String wireName = r'TimerInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TimerInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.durationSeconds != null) {
      yield r'durationSeconds';
      yield serializers.serialize(
        object.durationSeconds,
        specifiedType: const FullType(int),
      );
    }
    if (object.timerId != null) {
      yield r'timerId';
      yield serializers.serialize(
        object.timerId,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    TimerInfo object, {
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
    required TimerInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'durationSeconds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.durationSeconds = valueDes;
          break;
        case r'timerId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.timerId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TimerInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TimerInfoBuilder();
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
