// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_category.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ShopCategory _$CATEGORY_UNSPECIFIED =
    const ShopCategory._('CATEGORY_UNSPECIFIED');
const ShopCategory _$SEEDS = const ShopCategory._('SEEDS');
const ShopCategory _$TOOLS = const ShopCategory._('TOOLS');
const ShopCategory _$FOOD = const ShopCategory._('FOOD');
const ShopCategory _$ANIMALS = const ShopCategory._('ANIMALS');
const ShopCategory _$BUILDINGS = const ShopCategory._('BUILDINGS');
const ShopCategory _$FERTILIZER = const ShopCategory._('FERTILIZER');
const ShopCategory _$COLLECTABLES = const ShopCategory._('COLLECTABLES');

ShopCategory _$valueOf(String name) {
  switch (name) {
    case 'CATEGORY_UNSPECIFIED':
      return _$CATEGORY_UNSPECIFIED;
    case 'SEEDS':
      return _$SEEDS;
    case 'TOOLS':
      return _$TOOLS;
    case 'FOOD':
      return _$FOOD;
    case 'ANIMALS':
      return _$ANIMALS;
    case 'BUILDINGS':
      return _$BUILDINGS;
    case 'FERTILIZER':
      return _$FERTILIZER;
    case 'COLLECTABLES':
      return _$COLLECTABLES;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ShopCategory> _$values =
    BuiltSet<ShopCategory>(const <ShopCategory>[
  _$CATEGORY_UNSPECIFIED,
  _$SEEDS,
  _$TOOLS,
  _$FOOD,
  _$ANIMALS,
  _$BUILDINGS,
  _$FERTILIZER,
  _$COLLECTABLES,
]);

class _$ShopCategoryMeta {
  const _$ShopCategoryMeta();
  ShopCategory get CATEGORY_UNSPECIFIED => _$CATEGORY_UNSPECIFIED;
  ShopCategory get SEEDS => _$SEEDS;
  ShopCategory get TOOLS => _$TOOLS;
  ShopCategory get FOOD => _$FOOD;
  ShopCategory get ANIMALS => _$ANIMALS;
  ShopCategory get BUILDINGS => _$BUILDINGS;
  ShopCategory get FERTILIZER => _$FERTILIZER;
  ShopCategory get COLLECTABLES => _$COLLECTABLES;
  ShopCategory valueOf(String name) => _$valueOf(name);
  BuiltSet<ShopCategory> get values => _$values;
}

abstract class _$ShopCategoryMixin {
  // ignore: non_constant_identifier_names
  _$ShopCategoryMeta get ShopCategory => const _$ShopCategoryMeta();
}

Serializer<ShopCategory> _$shopCategorySerializer = _$ShopCategorySerializer();

class _$ShopCategorySerializer implements PrimitiveSerializer<ShopCategory> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'CATEGORY_UNSPECIFIED': 'CATEGORY_UNSPECIFIED',
    'SEEDS': 'SEEDS',
    'TOOLS': 'TOOLS',
    'FOOD': 'FOOD',
    'ANIMALS': 'ANIMALS',
    'BUILDINGS': 'BUILDINGS',
    'FERTILIZER': 'FERTILIZER',
    'COLLECTABLES': 'COLLECTABLES',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'CATEGORY_UNSPECIFIED': 'CATEGORY_UNSPECIFIED',
    'SEEDS': 'SEEDS',
    'TOOLS': 'TOOLS',
    'FOOD': 'FOOD',
    'ANIMALS': 'ANIMALS',
    'BUILDINGS': 'BUILDINGS',
    'FERTILIZER': 'FERTILIZER',
    'COLLECTABLES': 'COLLECTABLES',
  };

  @override
  final Iterable<Type> types = const <Type>[ShopCategory];
  @override
  final String wireName = 'ShopCategory';

  @override
  Object serialize(Serializers serializers, ShopCategory object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ShopCategory deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ShopCategory.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
