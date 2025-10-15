//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:stardew_valley_api/src/model/terrain.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'island_variant.g.dart';

/// IslandVariant
///
/// Properties:
/// * [id]
/// * [type]
/// * [name]
/// * [description]
/// * [startingTerrains]
@BuiltValue()
abstract class IslandVariant
    implements Built<IslandVariant, IslandVariantBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'type')
  IslandVariantTypeEnum? get type;
  // enum typeEnum {  DEFAULT,  CLASSIC,  FOREST,  };

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'startingTerrains')
  BuiltList<Terrain>? get startingTerrains;

  IslandVariant._();

  factory IslandVariant([void updates(IslandVariantBuilder b)]) =
      _$IslandVariant;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(IslandVariantBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<IslandVariant> get serializer =>
      _$IslandVariantSerializer();
}

class _$IslandVariantSerializer implements PrimitiveSerializer<IslandVariant> {
  @override
  final Iterable<Type> types = const [IslandVariant, _$IslandVariant];

  @override
  final String wireName = r'IslandVariant';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    IslandVariant object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.type != null) {
      yield r'type';
      yield serializers.serialize(
        object.type,
        specifiedType: const FullType(IslandVariantTypeEnum),
      );
    }
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
      );
    }
    if (object.startingTerrains != null) {
      yield r'startingTerrains';
      yield serializers.serialize(
        object.startingTerrains,
        specifiedType: const FullType(BuiltList, [FullType(Terrain)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    IslandVariant object, {
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
    required IslandVariantBuilder result,
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
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(IslandVariantTypeEnum),
          ) as IslandVariantTypeEnum;
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
        case r'startingTerrains':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Terrain)]),
          ) as BuiltList<Terrain>;
          result.startingTerrains.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  IslandVariant deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = IslandVariantBuilder();
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

class IslandVariantTypeEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'DEFAULT')
  static const IslandVariantTypeEnum DEFAULT = _$islandVariantTypeEnum_DEFAULT;
  @BuiltValueEnumConst(wireName: r'CLASSIC')
  static const IslandVariantTypeEnum CLASSIC = _$islandVariantTypeEnum_CLASSIC;
  @BuiltValueEnumConst(wireName: r'FOREST')
  static const IslandVariantTypeEnum FOREST = _$islandVariantTypeEnum_FOREST;

  static Serializer<IslandVariantTypeEnum> get serializer =>
      _$islandVariantTypeEnumSerializer;

  const IslandVariantTypeEnum._(String name) : super(name);

  static BuiltSet<IslandVariantTypeEnum> get values =>
      _$islandVariantTypeEnumValues;
  static IslandVariantTypeEnum valueOf(String name) =>
      _$islandVariantTypeEnumValueOf(name);
}
