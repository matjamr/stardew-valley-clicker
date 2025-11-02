//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:stardew_valley_api/src/model/terrain_collectable_type.dart';
import 'package:stardew_valley_api/src/model/asset.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'terrain_collectable.g.dart';

/// TerrainCollectable
///
/// Properties:
/// * [id]
/// * [x]
/// * [y]
/// * [sizeX]
/// * [sizeY]
/// * [asset]
/// * [type]
/// * [isCollected]
/// * [collectedAt] - ISO 8601 datetime when collected
@BuiltValue()
abstract class TerrainCollectable
    implements Built<TerrainCollectable, TerrainCollectableBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

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

  @BuiltValueField(wireName: r'type')
  TerrainCollectableType? get type;
  // enum typeEnum {  TERRAIN_COLLECTABLE_UNSPECIFIED,  BUSH,  ROCK,  TREE,  };

  @BuiltValueField(wireName: r'isCollected')
  bool? get isCollected;

  /// ISO 8601 datetime when collected
  @BuiltValueField(wireName: r'collectedAt')
  String? get collectedAt;

  TerrainCollectable._();

  factory TerrainCollectable([void updates(TerrainCollectableBuilder b)]) =
      _$TerrainCollectable;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TerrainCollectableBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TerrainCollectable> get serializer =>
      _$TerrainCollectableSerializer();
}

class _$TerrainCollectableSerializer
    implements PrimitiveSerializer<TerrainCollectable> {
  @override
  final Iterable<Type> types = const [TerrainCollectable, _$TerrainCollectable];

  @override
  final String wireName = r'TerrainCollectable';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TerrainCollectable object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
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
    if (object.type != null) {
      yield r'type';
      yield serializers.serialize(
        object.type,
        specifiedType: const FullType(TerrainCollectableType),
      );
    }
    if (object.isCollected != null) {
      yield r'isCollected';
      yield serializers.serialize(
        object.isCollected,
        specifiedType: const FullType(bool),
      );
    }
    if (object.collectedAt != null) {
      yield r'collectedAt';
      yield serializers.serialize(
        object.collectedAt,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    TerrainCollectable object, {
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
    required TerrainCollectableBuilder result,
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
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(TerrainCollectableType),
          ) as TerrainCollectableType;
          result.type = valueDes;
          break;
        case r'isCollected':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isCollected = valueDes;
          break;
        case r'collectedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.collectedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TerrainCollectable deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TerrainCollectableBuilder();
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
