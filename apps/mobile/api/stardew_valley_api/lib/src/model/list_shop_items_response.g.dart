// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_shop_items_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ListShopItemsResponse extends ListShopItemsResponse {
  @override
  final BuiltList<ShopItem>? items;
  @override
  final BuiltList<ShopCategoryInfo>? categories;

  factory _$ListShopItemsResponse(
          [void Function(ListShopItemsResponseBuilder)? updates]) =>
      (ListShopItemsResponseBuilder()..update(updates))._build();

  _$ListShopItemsResponse._({this.items, this.categories}) : super._();
  @override
  ListShopItemsResponse rebuild(
          void Function(ListShopItemsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ListShopItemsResponseBuilder toBuilder() =>
      ListShopItemsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ListShopItemsResponse &&
        items == other.items &&
        categories == other.categories;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, categories.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ListShopItemsResponse')
          ..add('items', items)
          ..add('categories', categories))
        .toString();
  }
}

class ListShopItemsResponseBuilder
    implements Builder<ListShopItemsResponse, ListShopItemsResponseBuilder> {
  _$ListShopItemsResponse? _$v;

  ListBuilder<ShopItem>? _items;
  ListBuilder<ShopItem> get items => _$this._items ??= ListBuilder<ShopItem>();
  set items(ListBuilder<ShopItem>? items) => _$this._items = items;

  ListBuilder<ShopCategoryInfo>? _categories;
  ListBuilder<ShopCategoryInfo> get categories =>
      _$this._categories ??= ListBuilder<ShopCategoryInfo>();
  set categories(ListBuilder<ShopCategoryInfo>? categories) =>
      _$this._categories = categories;

  ListShopItemsResponseBuilder() {
    ListShopItemsResponse._defaults(this);
  }

  ListShopItemsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items?.toBuilder();
      _categories = $v.categories?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ListShopItemsResponse other) {
    _$v = other as _$ListShopItemsResponse;
  }

  @override
  void update(void Function(ListShopItemsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ListShopItemsResponse build() => _build();

  _$ListShopItemsResponse _build() {
    _$ListShopItemsResponse _$result;
    try {
      _$result = _$v ??
          _$ListShopItemsResponse._(
            items: _items?.build(),
            categories: _categories?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        _items?.build();
        _$failedField = 'categories';
        _categories?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ListShopItemsResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
