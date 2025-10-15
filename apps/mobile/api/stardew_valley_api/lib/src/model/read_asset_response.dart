//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:stardew_valley_api/src/model/asset.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'read_asset_response.g.dart';

/// ReadAssetResponse
///
/// Properties:
/// * [asset]
@BuiltValue()
abstract class ReadAssetResponse
    implements Built<ReadAssetResponse, ReadAssetResponseBuilder> {
  @BuiltValueField(wireName: r'asset')
  Asset? get asset;

  ReadAssetResponse._();

  factory ReadAssetResponse([void updates(ReadAssetResponseBuilder b)]) =
      _$ReadAssetResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReadAssetResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReadAssetResponse> get serializer =>
      _$ReadAssetResponseSerializer();
}

class _$ReadAssetResponseSerializer
    implements PrimitiveSerializer<ReadAssetResponse> {
  @override
  final Iterable<Type> types = const [ReadAssetResponse, _$ReadAssetResponse];

  @override
  final String wireName = r'ReadAssetResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReadAssetResponse object, {
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
    ReadAssetResponse object, {
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
    required ReadAssetResponseBuilder result,
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
  ReadAssetResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReadAssetResponseBuilder();
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
