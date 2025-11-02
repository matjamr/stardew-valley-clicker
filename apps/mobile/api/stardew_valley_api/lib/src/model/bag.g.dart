// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bag.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Bag extends Bag {
  @override
  final BuiltList<BagItem>? items;
  @override
  final int? maxSlots;

  factory _$Bag([void Function(BagBuilder)? updates]) =>
      (BagBuilder()..update(updates))._build();

  _$Bag._({this.items, this.maxSlots}) : super._();
  @override
  Bag rebuild(void Function(BagBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BagBuilder toBuilder() => BagBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Bag && items == other.items && maxSlots == other.maxSlots;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, maxSlots.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Bag')
          ..add('items', items)
          ..add('maxSlots', maxSlots))
        .toString();
  }
}

class BagBuilder implements Builder<Bag, BagBuilder> {
  _$Bag? _$v;

  ListBuilder<BagItem>? _items;
  ListBuilder<BagItem> get items => _$this._items ??= ListBuilder<BagItem>();
  set items(ListBuilder<BagItem>? items) => _$this._items = items;

  int? _maxSlots;
  int? get maxSlots => _$this._maxSlots;
  set maxSlots(int? maxSlots) => _$this._maxSlots = maxSlots;

  BagBuilder() {
    Bag._defaults(this);
  }

  BagBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items?.toBuilder();
      _maxSlots = $v.maxSlots;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Bag other) {
    _$v = other as _$Bag;
  }

  @override
  void update(void Function(BagBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Bag build() => _build();

  _$Bag _build() {
    _$Bag _$result;
    try {
      _$result = _$v ??
          _$Bag._(
            items: _items?.build(),
            maxSlots: maxSlots,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        _items?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'Bag', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
