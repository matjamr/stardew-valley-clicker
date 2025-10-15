//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'retrieve_user_request.g.dart';

/// RetrieveUserRequest
///
/// Properties:
/// * [id]
@BuiltValue()
abstract class RetrieveUserRequest
    implements Built<RetrieveUserRequest, RetrieveUserRequestBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  RetrieveUserRequest._();

  factory RetrieveUserRequest([void updates(RetrieveUserRequestBuilder b)]) =
      _$RetrieveUserRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RetrieveUserRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RetrieveUserRequest> get serializer =>
      _$RetrieveUserRequestSerializer();
}

class _$RetrieveUserRequestSerializer
    implements PrimitiveSerializer<RetrieveUserRequest> {
  @override
  final Iterable<Type> types = const [
    RetrieveUserRequest,
    _$RetrieveUserRequest
  ];

  @override
  final String wireName = r'RetrieveUserRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RetrieveUserRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RetrieveUserRequest object, {
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
    required RetrieveUserRequestBuilder result,
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
  RetrieveUserRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RetrieveUserRequestBuilder();
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
