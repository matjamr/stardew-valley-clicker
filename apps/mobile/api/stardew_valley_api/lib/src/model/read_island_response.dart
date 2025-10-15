//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:stardew_valley_api/src/model/island.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'read_island_response.g.dart';

/// ReadIslandResponse
///
/// Properties:
/// * [island]
@BuiltValue()
abstract class ReadIslandResponse
    implements Built<ReadIslandResponse, ReadIslandResponseBuilder> {
  @BuiltValueField(wireName: r'island')
  Island? get island;

  ReadIslandResponse._();

  factory ReadIslandResponse([void updates(ReadIslandResponseBuilder b)]) =
      _$ReadIslandResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReadIslandResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReadIslandResponse> get serializer =>
      _$ReadIslandResponseSerializer();
}

class _$ReadIslandResponseSerializer
    implements PrimitiveSerializer<ReadIslandResponse> {
  @override
  final Iterable<Type> types = const [ReadIslandResponse, _$ReadIslandResponse];

  @override
  final String wireName = r'ReadIslandResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReadIslandResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.island != null) {
      yield r'island';
      yield serializers.serialize(
        object.island,
        specifiedType: const FullType(Island),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ReadIslandResponse object, {
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
    required ReadIslandResponseBuilder result,
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
  ReadIslandResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReadIslandResponseBuilder();
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
