// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AssetType _$UNKNOWN = const AssetType._('UNKNOWN');
const AssetType _$IMAGE = const AssetType._('IMAGE');
const AssetType _$AUDIO = const AssetType._('AUDIO');
const AssetType _$VIDEO = const AssetType._('VIDEO');
const AssetType _$MODEL = const AssetType._('MODEL');
const AssetType _$BUILDING = const AssetType._('BUILDING');
const AssetType _$WOOD = const AssetType._('WOOD');
const AssetType _$STONE = const AssetType._('STONE');
const AssetType _$HARDWOOD = const AssetType._('HARDWOOD');
const AssetType _$HARDSTONE = const AssetType._('HARDSTONE');
const AssetType _$GROUND = const AssetType._('GROUND');
const AssetType _$DECORATION = const AssetType._('DECORATION');

AssetType _$valueOf(String name) {
  switch (name) {
    case 'UNKNOWN':
      return _$UNKNOWN;
    case 'IMAGE':
      return _$IMAGE;
    case 'AUDIO':
      return _$AUDIO;
    case 'VIDEO':
      return _$VIDEO;
    case 'MODEL':
      return _$MODEL;
    case 'BUILDING':
      return _$BUILDING;
    case 'WOOD':
      return _$WOOD;
    case 'STONE':
      return _$STONE;
    case 'HARDWOOD':
      return _$HARDWOOD;
    case 'HARDSTONE':
      return _$HARDSTONE;
    case 'GROUND':
      return _$GROUND;
    case 'DECORATION':
      return _$DECORATION;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<AssetType> _$values = BuiltSet<AssetType>(const <AssetType>[
  _$UNKNOWN,
  _$IMAGE,
  _$AUDIO,
  _$VIDEO,
  _$MODEL,
  _$BUILDING,
  _$WOOD,
  _$STONE,
  _$HARDWOOD,
  _$HARDSTONE,
  _$GROUND,
  _$DECORATION,
]);

class _$AssetTypeMeta {
  const _$AssetTypeMeta();
  AssetType get UNKNOWN => _$UNKNOWN;
  AssetType get IMAGE => _$IMAGE;
  AssetType get AUDIO => _$AUDIO;
  AssetType get VIDEO => _$VIDEO;
  AssetType get MODEL => _$MODEL;
  AssetType get BUILDING => _$BUILDING;
  AssetType get WOOD => _$WOOD;
  AssetType get STONE => _$STONE;
  AssetType get HARDWOOD => _$HARDWOOD;
  AssetType get HARDSTONE => _$HARDSTONE;
  AssetType get GROUND => _$GROUND;
  AssetType get DECORATION => _$DECORATION;
  AssetType valueOf(String name) => _$valueOf(name);
  BuiltSet<AssetType> get values => _$values;
}

abstract class _$AssetTypeMixin {
  // ignore: non_constant_identifier_names
  _$AssetTypeMeta get AssetType => const _$AssetTypeMeta();
}

Serializer<AssetType> _$assetTypeSerializer = _$AssetTypeSerializer();

class _$AssetTypeSerializer implements PrimitiveSerializer<AssetType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'UNKNOWN': 'UNKNOWN',
    'IMAGE': 'IMAGE',
    'AUDIO': 'AUDIO',
    'VIDEO': 'VIDEO',
    'MODEL': 'MODEL',
    'BUILDING': 'BUILDING',
    'WOOD': 'WOOD',
    'STONE': 'STONE',
    'HARDWOOD': 'HARDWOOD',
    'HARDSTONE': 'HARDSTONE',
    'GROUND': 'GROUND',
    'DECORATION': 'DECORATION',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'UNKNOWN': 'UNKNOWN',
    'IMAGE': 'IMAGE',
    'AUDIO': 'AUDIO',
    'VIDEO': 'VIDEO',
    'MODEL': 'MODEL',
    'BUILDING': 'BUILDING',
    'WOOD': 'WOOD',
    'STONE': 'STONE',
    'HARDWOOD': 'HARDWOOD',
    'HARDSTONE': 'HARDSTONE',
    'GROUND': 'GROUND',
    'DECORATION': 'DECORATION',
  };

  @override
  final Iterable<Type> types = const <Type>[AssetType];
  @override
  final String wireName = 'AssetType';

  @override
  Object serialize(Serializers serializers, AssetType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AssetType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AssetType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
