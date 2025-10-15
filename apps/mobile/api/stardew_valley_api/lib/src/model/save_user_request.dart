//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'save_user_request.g.dart';

/// SaveUserRequest
///
/// Properties:
/// * [name]
/// * [surname]
/// * [email]
@BuiltValue()
abstract class SaveUserRequest
    implements Built<SaveUserRequest, SaveUserRequestBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'surname')
  String get surname;

  @BuiltValueField(wireName: r'email')
  String get email;

  SaveUserRequest._();

  factory SaveUserRequest([void updates(SaveUserRequestBuilder b)]) =
      _$SaveUserRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SaveUserRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SaveUserRequest> get serializer =>
      _$SaveUserRequestSerializer();
}

class _$SaveUserRequestSerializer
    implements PrimitiveSerializer<SaveUserRequest> {
  @override
  final Iterable<Type> types = const [SaveUserRequest, _$SaveUserRequest];

  @override
  final String wireName = r'SaveUserRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SaveUserRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'surname';
    yield serializers.serialize(
      object.surname,
      specifiedType: const FullType(String),
    );
    yield r'email';
    yield serializers.serialize(
      object.email,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SaveUserRequest object, {
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
    required SaveUserRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'surname':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.surname = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SaveUserRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SaveUserRequestBuilder();
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
