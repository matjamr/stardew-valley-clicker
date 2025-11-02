//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'generate_collectables_response.g.dart';

/// GenerateCollectablesResponse
///
/// Properties:
/// * [success]
/// * [message]
/// * [count] - Number of collectables generated
@BuiltValue()
abstract class GenerateCollectablesResponse
    implements
        Built<GenerateCollectablesResponse,
            GenerateCollectablesResponseBuilder> {
  @BuiltValueField(wireName: r'success')
  bool? get success;

  @BuiltValueField(wireName: r'message')
  String? get message;

  /// Number of collectables generated
  @BuiltValueField(wireName: r'count')
  int? get count;

  GenerateCollectablesResponse._();

  factory GenerateCollectablesResponse(
          [void updates(GenerateCollectablesResponseBuilder b)]) =
      _$GenerateCollectablesResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GenerateCollectablesResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GenerateCollectablesResponse> get serializer =>
      _$GenerateCollectablesResponseSerializer();
}

class _$GenerateCollectablesResponseSerializer
    implements PrimitiveSerializer<GenerateCollectablesResponse> {
  @override
  final Iterable<Type> types = const [
    GenerateCollectablesResponse,
    _$GenerateCollectablesResponse
  ];

  @override
  final String wireName = r'GenerateCollectablesResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GenerateCollectablesResponse object, {
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
    if (object.count != null) {
      yield r'count';
      yield serializers.serialize(
        object.count,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GenerateCollectablesResponse object, {
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
    required GenerateCollectablesResponseBuilder result,
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
        case r'count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.count = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GenerateCollectablesResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GenerateCollectablesResponseBuilder();
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
