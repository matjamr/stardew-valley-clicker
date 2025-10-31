//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:stardew_valley_api/src/model/asset.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'mine_tile.g.dart';

/// MineTile
///
/// Properties:
/// * [x]
/// * [y]
/// * [sizeX]
/// * [sizeY]
/// * [asset]
/// * [resourceId]
/// * [resourceQuantity]
/// * [discovered]
/// * [timeTaken]
@BuiltValue()
abstract class MineTile implements Built<MineTile, MineTileBuilder> {
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

  @BuiltValueField(wireName: r'resourceId')
  String? get resourceId;

  @BuiltValueField(wireName: r'resourceQuantity')
  int? get resourceQuantity;

  @BuiltValueField(wireName: r'discovered')
  bool? get discovered;

  @BuiltValueField(wireName: r'timeTaken')
  int? get timeTaken;

  MineTile._();

  factory MineTile([void updates(MineTileBuilder b)]) = _$MineTile;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MineTileBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MineTile> get serializer => _$MineTileSerializer();
}

class _$MineTileSerializer implements PrimitiveSerializer<MineTile> {
  @override
  final Iterable<Type> types = const [MineTile, _$MineTile];

  @override
  final String wireName = r'MineTile';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MineTile object, {
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
    if (object.resourceId != null) {
      yield r'resourceId';
      yield serializers.serialize(
        object.resourceId,
        specifiedType: const FullType(String),
      );
    }
    if (object.resourceQuantity != null) {
      yield r'resourceQuantity';
      yield serializers.serialize(
        object.resourceQuantity,
        specifiedType: const FullType(int),
      );
    }
    if (object.discovered != null) {
      yield r'discovered';
      yield serializers.serialize(
        object.discovered,
        specifiedType: const FullType(bool),
      );
    }
    if (object.timeTaken != null) {
      yield r'timeTaken';
      yield serializers.serialize(
        object.timeTaken,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    MineTile object, {
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
    required MineTileBuilder result,
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
        case r'resourceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.resourceId = valueDes;
          break;
        case r'resourceQuantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.resourceQuantity = valueDes;
          break;
        case r'discovered':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.discovered = valueDes;
          break;
        case r'timeTaken':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.timeTaken = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MineTile deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MineTileBuilder();
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
