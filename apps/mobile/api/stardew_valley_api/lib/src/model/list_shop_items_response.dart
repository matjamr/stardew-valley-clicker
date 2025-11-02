//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:stardew_valley_api/src/model/shop_category_info.dart';
import 'package:stardew_valley_api/src/model/shop_item.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'list_shop_items_response.g.dart';

/// ListShopItemsResponse
///
/// Properties:
/// * [items]
/// * [categories]
@BuiltValue()
abstract class ListShopItemsResponse
    implements Built<ListShopItemsResponse, ListShopItemsResponseBuilder> {
  @BuiltValueField(wireName: r'items')
  BuiltList<ShopItem>? get items;

  @BuiltValueField(wireName: r'categories')
  BuiltList<ShopCategoryInfo>? get categories;

  ListShopItemsResponse._();

  factory ListShopItemsResponse(
      [void updates(ListShopItemsResponseBuilder b)]) = _$ListShopItemsResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ListShopItemsResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ListShopItemsResponse> get serializer =>
      _$ListShopItemsResponseSerializer();
}

class _$ListShopItemsResponseSerializer
    implements PrimitiveSerializer<ListShopItemsResponse> {
  @override
  final Iterable<Type> types = const [
    ListShopItemsResponse,
    _$ListShopItemsResponse
  ];

  @override
  final String wireName = r'ListShopItemsResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ListShopItemsResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.items != null) {
      yield r'items';
      yield serializers.serialize(
        object.items,
        specifiedType: const FullType(BuiltList, [FullType(ShopItem)]),
      );
    }
    if (object.categories != null) {
      yield r'categories';
      yield serializers.serialize(
        object.categories,
        specifiedType: const FullType(BuiltList, [FullType(ShopCategoryInfo)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ListShopItemsResponse object, {
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
    required ListShopItemsResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ShopItem)]),
          ) as BuiltList<ShopItem>;
          result.items.replace(valueDes);
          break;
        case r'categories':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(ShopCategoryInfo)]),
          ) as BuiltList<ShopCategoryInfo>;
          result.categories.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ListShopItemsResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ListShopItemsResponseBuilder();
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
