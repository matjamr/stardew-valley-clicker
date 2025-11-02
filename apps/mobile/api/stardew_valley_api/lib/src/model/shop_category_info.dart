//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:stardew_valley_api/src/model/shop_category.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'shop_category_info.g.dart';

/// ShopCategoryInfo
///
/// Properties:
/// * [category]
/// * [name]
/// * [description]
/// * [iconUrl]
/// * [sortOrder]
@BuiltValue()
abstract class ShopCategoryInfo
    implements Built<ShopCategoryInfo, ShopCategoryInfoBuilder> {
  @BuiltValueField(wireName: r'category')
  ShopCategory? get category;
  // enum categoryEnum {  CATEGORY_UNSPECIFIED,  SEEDS,  TOOLS,  FOOD,  ANIMALS,  BUILDINGS,  FERTILIZER,  COLLECTABLES,  };

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'iconUrl')
  String? get iconUrl;

  @BuiltValueField(wireName: r'sortOrder')
  int? get sortOrder;

  ShopCategoryInfo._();

  factory ShopCategoryInfo([void updates(ShopCategoryInfoBuilder b)]) =
      _$ShopCategoryInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ShopCategoryInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ShopCategoryInfo> get serializer =>
      _$ShopCategoryInfoSerializer();
}

class _$ShopCategoryInfoSerializer
    implements PrimitiveSerializer<ShopCategoryInfo> {
  @override
  final Iterable<Type> types = const [ShopCategoryInfo, _$ShopCategoryInfo];

  @override
  final String wireName = r'ShopCategoryInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ShopCategoryInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.category != null) {
      yield r'category';
      yield serializers.serialize(
        object.category,
        specifiedType: const FullType(ShopCategory),
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
    if (object.iconUrl != null) {
      yield r'iconUrl';
      yield serializers.serialize(
        object.iconUrl,
        specifiedType: const FullType(String),
      );
    }
    if (object.sortOrder != null) {
      yield r'sortOrder';
      yield serializers.serialize(
        object.sortOrder,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ShopCategoryInfo object, {
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
    required ShopCategoryInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'category':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ShopCategory),
          ) as ShopCategory;
          result.category = valueDes;
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
        case r'iconUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.iconUrl = valueDes;
          break;
        case r'sortOrder':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.sortOrder = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ShopCategoryInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShopCategoryInfoBuilder();
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
