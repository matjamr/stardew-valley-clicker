//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:stardew_valley_api/src/model/asset.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'decoration.g.dart';

/// Decoration
///
/// Properties:
/// * [x]
/// * [y]
/// * [sizeX]
/// * [sizeY]
/// * [asset]
@BuiltValue()
abstract class Decoration implements Built<Decoration, DecorationBuilder> {
  @BuiltValueField(wireName: r'x')
  int? get x;

  @BuiltValueField(wireName: r'y')
  int? get y;

  @BuiltValueField(wireName: r'sizeX')
  int? get sizeX;

  @BuiltValueField(wireName: r'sizeY')
  int? get sizeY;

  @BuiltValueField(wireName: r'asset')
  Asset? get asset;

  Decoration._();

  factory Decoration([void updates(DecorationBuilder b)]) = _$Decoration;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DecorationBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Decoration> get serializer => _$DecorationSerializer();
}

class _$DecorationSerializer implements PrimitiveSerializer<Decoration> {
  @override
  final Iterable<Type> types = const [Decoration, _$Decoration];

  @override
  final String wireName = r'Decoration';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Decoration object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.x != null) {
      yield r'x';
      yield serializers.serialize(
        object.x,
        specifiedType: const FullType(int),
      );
    }
    if (object.y != null) {
      yield r'y';
      yield serializers.serialize(
        object.y,
        specifiedType: const FullType(int),
      );
    }
    if (object.sizeX != null) {
      yield r'sizeX';
      yield serializers.serialize(
        object.sizeX,
        specifiedType: const FullType(int),
      );
    }
    if (object.sizeY != null) {
      yield r'sizeY';
      yield serializers.serialize(
        object.sizeY,
        specifiedType: const FullType(int),
      );
    }
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
    Decoration object, {
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
    required DecorationBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'x':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.x = valueDes;
          break;
        case r'y':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.y = valueDes;
          break;
        case r'sizeX':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.sizeX = valueDes;
          break;
        case r'sizeY':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.sizeY = valueDes;
          break;
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
  Decoration deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DecorationBuilder();
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
