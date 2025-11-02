//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_island_response.g.dart';

/// UpdateIslandResponse
///
/// Properties:
/// * [success]
/// * [message]
@BuiltValue()
abstract class UpdateIslandResponse
    implements Built<UpdateIslandResponse, UpdateIslandResponseBuilder> {
  @BuiltValueField(wireName: r'success')
  bool? get success;

  @BuiltValueField(wireName: r'message')
  String? get message;

  UpdateIslandResponse._();

  factory UpdateIslandResponse([void updates(UpdateIslandResponseBuilder b)]) =
      _$UpdateIslandResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateIslandResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateIslandResponse> get serializer =>
      _$UpdateIslandResponseSerializer();
}

class _$UpdateIslandResponseSerializer
    implements PrimitiveSerializer<UpdateIslandResponse> {
  @override
  final Iterable<Type> types = const [
    UpdateIslandResponse,
    _$UpdateIslandResponse
  ];

  @override
  final String wireName = r'UpdateIslandResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateIslandResponse object, {
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
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateIslandResponse object, {
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
    required UpdateIslandResponseBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateIslandResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateIslandResponseBuilder();
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
