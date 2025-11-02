// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terrain_collectable_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const TerrainCollectableType _$TERRAIN_COLLECTABLE_UNSPECIFIED =
    const TerrainCollectableType._('TERRAIN_COLLECTABLE_UNSPECIFIED');
const TerrainCollectableType _$BUSH = const TerrainCollectableType._('BUSH');
const TerrainCollectableType _$ROCK = const TerrainCollectableType._('ROCK');
const TerrainCollectableType _$TREE = const TerrainCollectableType._('TREE');

TerrainCollectableType _$valueOf(String name) {
  switch (name) {
    case 'TERRAIN_COLLECTABLE_UNSPECIFIED':
      return _$TERRAIN_COLLECTABLE_UNSPECIFIED;
    case 'BUSH':
      return _$BUSH;
    case 'ROCK':
      return _$ROCK;
    case 'TREE':
      return _$TREE;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<TerrainCollectableType> _$values =
    BuiltSet<TerrainCollectableType>(const <TerrainCollectableType>[
  _$TERRAIN_COLLECTABLE_UNSPECIFIED,
  _$BUSH,
  _$ROCK,
  _$TREE,
]);

class _$TerrainCollectableTypeMeta {
  const _$TerrainCollectableTypeMeta();
  TerrainCollectableType get TERRAIN_COLLECTABLE_UNSPECIFIED =>
      _$TERRAIN_COLLECTABLE_UNSPECIFIED;
  TerrainCollectableType get BUSH => _$BUSH;
  TerrainCollectableType get ROCK => _$ROCK;
  TerrainCollectableType get TREE => _$TREE;
  TerrainCollectableType valueOf(String name) => _$valueOf(name);
  BuiltSet<TerrainCollectableType> get values => _$values;
}

abstract class _$TerrainCollectableTypeMixin {
  // ignore: non_constant_identifier_names
  _$TerrainCollectableTypeMeta get TerrainCollectableType =>
      const _$TerrainCollectableTypeMeta();
}

Serializer<TerrainCollectableType> _$terrainCollectableTypeSerializer =
    _$TerrainCollectableTypeSerializer();

class _$TerrainCollectableTypeSerializer
    implements PrimitiveSerializer<TerrainCollectableType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'TERRAIN_COLLECTABLE_UNSPECIFIED': 'TERRAIN_COLLECTABLE_UNSPECIFIED',
    'BUSH': 'BUSH',
    'ROCK': 'ROCK',
    'TREE': 'TREE',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'TERRAIN_COLLECTABLE_UNSPECIFIED': 'TERRAIN_COLLECTABLE_UNSPECIFIED',
    'BUSH': 'BUSH',
    'ROCK': 'ROCK',
    'TREE': 'TREE',
  };

  @override
  final Iterable<Type> types = const <Type>[TerrainCollectableType];
  @override
  final String wireName = 'TerrainCollectableType';

  @override
  Object serialize(Serializers serializers, TerrainCollectableType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  TerrainCollectableType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      TerrainCollectableType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
