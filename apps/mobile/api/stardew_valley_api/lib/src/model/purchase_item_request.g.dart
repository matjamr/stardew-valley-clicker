// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_item_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PurchaseItemRequest extends PurchaseItemRequest {
  @override
  final String userId;
  @override
  final String islandId;
  @override
  final String itemId;
  @override
  final int quantity;

  factory _$PurchaseItemRequest(
          [void Function(PurchaseItemRequestBuilder)? updates]) =>
      (PurchaseItemRequestBuilder()..update(updates))._build();

  _$PurchaseItemRequest._(
      {required this.userId,
      required this.islandId,
      required this.itemId,
      required this.quantity})
      : super._();
  @override
  PurchaseItemRequest rebuild(
          void Function(PurchaseItemRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PurchaseItemRequestBuilder toBuilder() =>
      PurchaseItemRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PurchaseItemRequest &&
        userId == other.userId &&
        islandId == other.islandId &&
        itemId == other.itemId &&
        quantity == other.quantity;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, islandId.hashCode);
    _$hash = $jc(_$hash, itemId.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PurchaseItemRequest')
          ..add('userId', userId)
          ..add('islandId', islandId)
          ..add('itemId', itemId)
          ..add('quantity', quantity))
        .toString();
  }
}

class PurchaseItemRequestBuilder
    implements Builder<PurchaseItemRequest, PurchaseItemRequestBuilder> {
  _$PurchaseItemRequest? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _islandId;
  String? get islandId => _$this._islandId;
  set islandId(String? islandId) => _$this._islandId = islandId;

  String? _itemId;
  String? get itemId => _$this._itemId;
  set itemId(String? itemId) => _$this._itemId = itemId;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  PurchaseItemRequestBuilder() {
    PurchaseItemRequest._defaults(this);
  }

  PurchaseItemRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _islandId = $v.islandId;
      _itemId = $v.itemId;
      _quantity = $v.quantity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PurchaseItemRequest other) {
    _$v = other as _$PurchaseItemRequest;
  }

  @override
  void update(void Function(PurchaseItemRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PurchaseItemRequest build() => _build();

  _$PurchaseItemRequest _build() {
    final _$result = _$v ??
        _$PurchaseItemRequest._(
          userId: BuiltValueNullFieldError.checkNotNull(
              userId, r'PurchaseItemRequest', 'userId'),
          islandId: BuiltValueNullFieldError.checkNotNull(
              islandId, r'PurchaseItemRequest', 'islandId'),
          itemId: BuiltValueNullFieldError.checkNotNull(
              itemId, r'PurchaseItemRequest', 'itemId'),
          quantity: BuiltValueNullFieldError.checkNotNull(
              quantity, r'PurchaseItemRequest', 'quantity'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
