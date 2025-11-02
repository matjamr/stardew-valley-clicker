// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_category_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ShopCategoryInfo extends ShopCategoryInfo {
  @override
  final ShopCategory? category;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? iconUrl;
  @override
  final int? sortOrder;

  factory _$ShopCategoryInfo(
          [void Function(ShopCategoryInfoBuilder)? updates]) =>
      (ShopCategoryInfoBuilder()..update(updates))._build();

  _$ShopCategoryInfo._(
      {this.category,
      this.name,
      this.description,
      this.iconUrl,
      this.sortOrder})
      : super._();
  @override
  ShopCategoryInfo rebuild(void Function(ShopCategoryInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShopCategoryInfoBuilder toBuilder() =>
      ShopCategoryInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShopCategoryInfo &&
        category == other.category &&
        name == other.name &&
        description == other.description &&
        iconUrl == other.iconUrl &&
        sortOrder == other.sortOrder;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, iconUrl.hashCode);
    _$hash = $jc(_$hash, sortOrder.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ShopCategoryInfo')
          ..add('category', category)
          ..add('name', name)
          ..add('description', description)
          ..add('iconUrl', iconUrl)
          ..add('sortOrder', sortOrder))
        .toString();
  }
}

class ShopCategoryInfoBuilder
    implements Builder<ShopCategoryInfo, ShopCategoryInfoBuilder> {
  _$ShopCategoryInfo? _$v;

  ShopCategory? _category;
  ShopCategory? get category => _$this._category;
  set category(ShopCategory? category) => _$this._category = category;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _iconUrl;
  String? get iconUrl => _$this._iconUrl;
  set iconUrl(String? iconUrl) => _$this._iconUrl = iconUrl;

  int? _sortOrder;
  int? get sortOrder => _$this._sortOrder;
  set sortOrder(int? sortOrder) => _$this._sortOrder = sortOrder;

  ShopCategoryInfoBuilder() {
    ShopCategoryInfo._defaults(this);
  }

  ShopCategoryInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _category = $v.category;
      _name = $v.name;
      _description = $v.description;
      _iconUrl = $v.iconUrl;
      _sortOrder = $v.sortOrder;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShopCategoryInfo other) {
    _$v = other as _$ShopCategoryInfo;
  }

  @override
  void update(void Function(ShopCategoryInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ShopCategoryInfo build() => _build();

  _$ShopCategoryInfo _build() {
    final _$result = _$v ??
        _$ShopCategoryInfo._(
          category: category,
          name: name,
          description: description,
          iconUrl: iconUrl,
          sortOrder: sortOrder,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
