//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:stardew_valley_api/src/model/asset_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_asset_request.g.dart';

/// CreateAssetRequest
///
/// Properties:
/// * [type]
/// * [name]
/// * [description]
/// * [content]
@BuiltValue()
abstract class CreateAssetRequest
    implements Built<CreateAssetRequest, CreateAssetRequestBuilder> {
  @BuiltValueField(wireName: r'type')
  AssetType get type;
  // enum typeEnum {  UNKNOWN,  IMAGE,  AUDIO,  VIDEO,  MODEL,  BUILDING,  WOOD,  STONE,  HARDWOOD,  HARDSTONE,  GROUND,  DECORATION,  };

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'content')
  String? get content;

  CreateAssetRequest._();

  factory CreateAssetRequest([void updates(CreateAssetRequestBuilder b)]) =
      _$CreateAssetRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateAssetRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateAssetRequest> get serializer =>
      _$CreateAssetRequestSerializer();
}

class _$CreateAssetRequestSerializer
    implements PrimitiveSerializer<CreateAssetRequest> {
  @override
  final Iterable<Type> types = const [CreateAssetRequest, _$CreateAssetRequest];

  @override
  final String wireName = r'CreateAssetRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateAssetRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(AssetType),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
      );
    }
    if (object.content != null) {
      yield r'content';
      yield serializers.serialize(
        object.content,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateAssetRequest object, {
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
    required CreateAssetRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AssetType),
          ) as AssetType;
          result.type = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.content = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateAssetRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateAssetRequestBuilder();
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
