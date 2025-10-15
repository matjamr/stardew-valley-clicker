//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'asset_type.g.dart';

class AssetType extends EnumClass {
  @BuiltValueEnumConst(wireName: r'UNKNOWN')
  static const AssetType UNKNOWN = _$UNKNOWN;
  @BuiltValueEnumConst(wireName: r'IMAGE')
  static const AssetType IMAGE = _$IMAGE;
  @BuiltValueEnumConst(wireName: r'AUDIO')
  static const AssetType AUDIO = _$AUDIO;
  @BuiltValueEnumConst(wireName: r'VIDEO')
  static const AssetType VIDEO = _$VIDEO;
  @BuiltValueEnumConst(wireName: r'MODEL')
  static const AssetType MODEL = _$MODEL;
  @BuiltValueEnumConst(wireName: r'BUILDING')
  static const AssetType BUILDING = _$BUILDING;
  @BuiltValueEnumConst(wireName: r'WOOD')
  static const AssetType WOOD = _$WOOD;
  @BuiltValueEnumConst(wireName: r'STONE')
  static const AssetType STONE = _$STONE;
  @BuiltValueEnumConst(wireName: r'HARDWOOD')
  static const AssetType HARDWOOD = _$HARDWOOD;
  @BuiltValueEnumConst(wireName: r'HARDSTONE')
  static const AssetType HARDSTONE = _$HARDSTONE;
  @BuiltValueEnumConst(wireName: r'GROUND')
  static const AssetType GROUND = _$GROUND;
  @BuiltValueEnumConst(wireName: r'DECORATION')
  static const AssetType DECORATION = _$DECORATION;

  static Serializer<AssetType> get serializer => _$assetTypeSerializer;

  const AssetType._(String name) : super(name);

  static BuiltSet<AssetType> get values => _$values;
  static AssetType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class AssetTypeMixin = Object with _$AssetTypeMixin;
