//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:stardew_valley_api/src/model/island.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_island_request.g.dart';

/// UpdateIslandRequest
///
/// Properties:
/// * [island]
@BuiltValue()
abstract class UpdateIslandRequest
    implements Built<UpdateIslandRequest, UpdateIslandRequestBuilder> {
  @BuiltValueField(wireName: r'island')
  Island get island;

  UpdateIslandRequest._();

  factory UpdateIslandRequest([void updates(UpdateIslandRequestBuilder b)]) =
      _$UpdateIslandRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateIslandRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateIslandRequest> get serializer =>
      _$UpdateIslandRequestSerializer();
}

class _$UpdateIslandRequestSerializer
    implements PrimitiveSerializer<UpdateIslandRequest> {
  @override
  final Iterable<Type> types = const [
    UpdateIslandRequest,
    _$UpdateIslandRequest
  ];

  @override
  final String wireName = r'UpdateIslandRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateIslandRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'island';
    yield serializers.serialize(
      object.island,
      specifiedType: const FullType(Island),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateIslandRequest object, {
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
    required UpdateIslandRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'island':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Island),
          ) as Island;
          result.island.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateIslandRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateIslandRequestBuilder();
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
