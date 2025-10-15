//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:stardew_valley_api/src/model/asset.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_asset_response.g.dart';

/// CreateAssetResponse
///
/// Properties:
/// * [asset]
@BuiltValue()
abstract class CreateAssetResponse
    implements Built<CreateAssetResponse, CreateAssetResponseBuilder> {
  @BuiltValueField(wireName: r'asset')
  Asset? get asset;

  CreateAssetResponse._();

  factory CreateAssetResponse([void updates(CreateAssetResponseBuilder b)]) =
      _$CreateAssetResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateAssetResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateAssetResponse> get serializer =>
      _$CreateAssetResponseSerializer();
}

class _$CreateAssetResponseSerializer
    implements PrimitiveSerializer<CreateAssetResponse> {
  @override
  final Iterable<Type> types = const [
    CreateAssetResponse,
    _$CreateAssetResponse
  ];

  @override
  final String wireName = r'CreateAssetResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateAssetResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.asset != null) {
      yield r'asset';
      yield serializers.serialize(
        object.asset,
        specifiedType: const FullType(Asset),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateAssetResponse object, {
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
    required CreateAssetResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'asset':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Asset),
          ) as Asset;
          result.asset.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateAssetResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateAssetResponseBuilder();
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
