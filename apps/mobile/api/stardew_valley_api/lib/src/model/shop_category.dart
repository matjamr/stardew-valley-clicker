//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'shop_category.g.dart';

class ShopCategory extends EnumClass {
  @BuiltValueEnumConst(wireName: r'CATEGORY_UNSPECIFIED')
  static const ShopCategory CATEGORY_UNSPECIFIED = _$CATEGORY_UNSPECIFIED;
  @BuiltValueEnumConst(wireName: r'SEEDS')
  static const ShopCategory SEEDS = _$SEEDS;
  @BuiltValueEnumConst(wireName: r'TOOLS')
  static const ShopCategory TOOLS = _$TOOLS;
  @BuiltValueEnumConst(wireName: r'FOOD')
  static const ShopCategory FOOD = _$FOOD;
  @BuiltValueEnumConst(wireName: r'ANIMALS')
  static const ShopCategory ANIMALS = _$ANIMALS;
  @BuiltValueEnumConst(wireName: r'BUILDINGS')
  static const ShopCategory BUILDINGS = _$BUILDINGS;
  @BuiltValueEnumConst(wireName: r'FERTILIZER')
  static const ShopCategory FERTILIZER = _$FERTILIZER;
  @BuiltValueEnumConst(wireName: r'COLLECTABLES')
  static const ShopCategory COLLECTABLES = _$COLLECTABLES;

  static Serializer<ShopCategory> get serializer => _$shopCategorySerializer;

  const ShopCategory._(String name) : super(name);

  static BuiltSet<ShopCategory> get values => _$values;
  static ShopCategory valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ShopCategoryMixin = Object with _$ShopCategoryMixin;
