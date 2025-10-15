//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_island_response.g.dart';

/// CreateIslandResponse
///
/// Properties:
/// * [id]
@BuiltValue()
abstract class CreateIslandResponse
    implements Built<CreateIslandResponse, CreateIslandResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  CreateIslandResponse._();

  factory CreateIslandResponse([void updates(CreateIslandResponseBuilder b)]) =
      _$CreateIslandResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateIslandResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateIslandResponse> get serializer =>
      _$CreateIslandResponseSerializer();
}

class _$CreateIslandResponseSerializer
    implements PrimitiveSerializer<CreateIslandResponse> {
  @override
  final Iterable<Type> types = const [
    CreateIslandResponse,
    _$CreateIslandResponse
  ];

  @override
  final String wireName = r'CreateIslandResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateIslandResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateIslandResponse object, {
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
    required CreateIslandResponseBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateIslandResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateIslandResponseBuilder();
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
