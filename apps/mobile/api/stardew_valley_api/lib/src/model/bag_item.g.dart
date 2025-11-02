// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bag_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BagItem extends BagItem {
  @override
  final String? itemId;
  @override
  final String? name;
  @override
  final int? quantity;
  @override
  final String? iconUrl;

  factory _$BagItem([void Function(BagItemBuilder)? updates]) =>
      (BagItemBuilder()..update(updates))._build();

  _$BagItem._({this.itemId, this.name, this.quantity, this.iconUrl})
      : super._();
  @override
  BagItem rebuild(void Function(BagItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BagItemBuilder toBuilder() => BagItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BagItem &&
        itemId == other.itemId &&
        name == other.name &&
        quantity == other.quantity &&
        iconUrl == other.iconUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, itemId.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, iconUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BagItem')
          ..add('itemId', itemId)
          ..add('name', name)
          ..add('quantity', quantity)
          ..add('iconUrl', iconUrl))
        .toString();
  }
}

class BagItemBuilder implements Builder<BagItem, BagItemBuilder> {
  _$BagItem? _$v;

  String? _itemId;
  String? get itemId => _$this._itemId;
  set itemId(String? itemId) => _$this._itemId = itemId;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  String? _iconUrl;
  String? get iconUrl => _$this._iconUrl;
  set iconUrl(String? iconUrl) => _$this._iconUrl = iconUrl;

  BagItemBuilder() {
    BagItem._defaults(this);
  }

  BagItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _itemId = $v.itemId;
      _name = $v.name;
      _quantity = $v.quantity;
      _iconUrl = $v.iconUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BagItem other) {
    _$v = other as _$BagItem;
  }

  @override
  void update(void Function(BagItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BagItem build() => _build();

  _$BagItem _build() {
    final _$result = _$v ??
        _$BagItem._(
          itemId: itemId,
          name: name,
          quantity: quantity,
          iconUrl: iconUrl,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
