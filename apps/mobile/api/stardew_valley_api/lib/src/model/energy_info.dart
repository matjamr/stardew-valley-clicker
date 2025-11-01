//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'energy_info.g.dart';

/// EnergyInfo
///
/// Properties:
/// * [energyConsumption]
@BuiltValue()
abstract class EnergyInfo implements Built<EnergyInfo, EnergyInfoBuilder> {
  @BuiltValueField(wireName: r'energyConsumption')
  int? get energyConsumption;

  EnergyInfo._();

  factory EnergyInfo([void updates(EnergyInfoBuilder b)]) = _$EnergyInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EnergyInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EnergyInfo> get serializer => _$EnergyInfoSerializer();
}

class _$EnergyInfoSerializer implements PrimitiveSerializer<EnergyInfo> {
  @override
  final Iterable<Type> types = const [EnergyInfo, _$EnergyInfo];

  @override
  final String wireName = r'EnergyInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EnergyInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.energyConsumption != null) {
      yield r'energyConsumption';
      yield serializers.serialize(
        object.energyConsumption,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    EnergyInfo object, {
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
    required EnergyInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'energyConsumption':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.energyConsumption = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EnergyInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EnergyInfoBuilder();
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
