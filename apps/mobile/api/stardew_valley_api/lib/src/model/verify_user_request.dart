//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'verify_user_request.g.dart';

/// VerifyUserRequest
///
/// Properties:
/// * [accessToken]
@BuiltValue()
abstract class VerifyUserRequest
    implements Built<VerifyUserRequest, VerifyUserRequestBuilder> {
  @BuiltValueField(wireName: r'accessToken')
  String get accessToken;

  VerifyUserRequest._();

  factory VerifyUserRequest([void updates(VerifyUserRequestBuilder b)]) =
      _$VerifyUserRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VerifyUserRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VerifyUserRequest> get serializer =>
      _$VerifyUserRequestSerializer();
}

class _$VerifyUserRequestSerializer
    implements PrimitiveSerializer<VerifyUserRequest> {
  @override
  final Iterable<Type> types = const [VerifyUserRequest, _$VerifyUserRequest];

  @override
  final String wireName = r'VerifyUserRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VerifyUserRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'accessToken';
    yield serializers.serialize(
      object.accessToken,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    VerifyUserRequest object, {
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
    required VerifyUserRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'accessToken':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.accessToken = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VerifyUserRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VerifyUserRequestBuilder();
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
