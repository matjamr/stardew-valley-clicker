//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'terrain_collectable_type.g.dart';

class TerrainCollectableType extends EnumClass {
  @BuiltValueEnumConst(wireName: r'TERRAIN_COLLECTABLE_UNSPECIFIED')
  static const TerrainCollectableType TERRAIN_COLLECTABLE_UNSPECIFIED =
      _$TERRAIN_COLLECTABLE_UNSPECIFIED;
  @BuiltValueEnumConst(wireName: r'BUSH')
  static const TerrainCollectableType BUSH = _$BUSH;
  @BuiltValueEnumConst(wireName: r'ROCK')
  static const TerrainCollectableType ROCK = _$ROCK;
  @BuiltValueEnumConst(wireName: r'TREE')
  static const TerrainCollectableType TREE = _$TREE;

  static Serializer<TerrainCollectableType> get serializer =>
      _$terrainCollectableTypeSerializer;

  const TerrainCollectableType._(String name) : super(name);

  static BuiltSet<TerrainCollectableType> get values => _$values;
  static TerrainCollectableType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class TerrainCollectableTypeMixin = Object
    with _$TerrainCollectableTypeMixin;
