// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ShopItem extends ShopItem {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final ShopCategory? category;
  @override
  final int? price;
  @override
  final CurrencyType? currency;
  @override
  final String? iconUrl;
  @override
  final int? stackSize;
  @override
  final BuiltMap<String, String>? metadata;
  @override
  final bool? available;
  @override
  final int? stock;

  factory _$ShopItem([void Function(ShopItemBuilder)? updates]) =>
      (ShopItemBuilder()..update(updates))._build();

  _$ShopItem._(
      {this.id,
      this.name,
      this.description,
      this.category,
      this.price,
      this.currency,
      this.iconUrl,
      this.stackSize,
      this.metadata,
      this.available,
      this.stock})
      : super._();
  @override
  ShopItem rebuild(void Function(ShopItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShopItemBuilder toBuilder() => ShopItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShopItem &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        category == other.category &&
        price == other.price &&
        currency == other.currency &&
        iconUrl == other.iconUrl &&
        stackSize == other.stackSize &&
        metadata == other.metadata &&
        available == other.available &&
        stock == other.stock;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, currency.hashCode);
    _$hash = $jc(_$hash, iconUrl.hashCode);
    _$hash = $jc(_$hash, stackSize.hashCode);
    _$hash = $jc(_$hash, metadata.hashCode);
    _$hash = $jc(_$hash, available.hashCode);
    _$hash = $jc(_$hash, stock.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ShopItem')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('category', category)
          ..add('price', price)
          ..add('currency', currency)
          ..add('iconUrl', iconUrl)
          ..add('stackSize', stackSize)
          ..add('metadata', metadata)
          ..add('available', available)
          ..add('stock', stock))
        .toString();
  }
}

class ShopItemBuilder implements Builder<ShopItem, ShopItemBuilder> {
  _$ShopItem? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ShopCategory? _category;
  ShopCategory? get category => _$this._category;
  set category(ShopCategory? category) => _$this._category = category;

  int? _price;
  int? get price => _$this._price;
  set price(int? price) => _$this._price = price;

  CurrencyType? _currency;
  CurrencyType? get currency => _$this._currency;
  set currency(CurrencyType? currency) => _$this._currency = currency;

  String? _iconUrl;
  String? get iconUrl => _$this._iconUrl;
  set iconUrl(String? iconUrl) => _$this._iconUrl = iconUrl;

  int? _stackSize;
  int? get stackSize => _$this._stackSize;
  set stackSize(int? stackSize) => _$this._stackSize = stackSize;

  MapBuilder<String, String>? _metadata;
  MapBuilder<String, String> get metadata =>
      _$this._metadata ??= MapBuilder<String, String>();
  set metadata(MapBuilder<String, String>? metadata) =>
      _$this._metadata = metadata;

  bool? _available;
  bool? get available => _$this._available;
  set available(bool? available) => _$this._available = available;

  int? _stock;
  int? get stock => _$this._stock;
  set stock(int? stock) => _$this._stock = stock;

  ShopItemBuilder() {
    ShopItem._defaults(this);
  }

  ShopItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _description = $v.description;
      _category = $v.category;
      _price = $v.price;
      _currency = $v.currency;
      _iconUrl = $v.iconUrl;
      _stackSize = $v.stackSize;
      _metadata = $v.metadata?.toBuilder();
      _available = $v.available;
      _stock = $v.stock;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShopItem other) {
    _$v = other as _$ShopItem;
  }

  @override
  void update(void Function(ShopItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ShopItem build() => _build();

  _$ShopItem _build() {
    _$ShopItem _$result;
    try {
      _$result = _$v ??
          _$ShopItem._(
            id: id,
            name: name,
            description: description,
            category: category,
            price: price,
            currency: currency,
            iconUrl: iconUrl,
            stackSize: stackSize,
            metadata: _metadata?.build(),
            available: available,
            stock: stock,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'metadata';
        _metadata?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ShopItem', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
