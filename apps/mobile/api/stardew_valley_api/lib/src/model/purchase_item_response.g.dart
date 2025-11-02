// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_item_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PurchaseItemResponse extends PurchaseItemResponse {
  @override
  final bool? success;
  @override
  final String? transactionId;
  @override
  final String? message;
  @override
  final int? remainingCurrency;

  factory _$PurchaseItemResponse(
          [void Function(PurchaseItemResponseBuilder)? updates]) =>
      (PurchaseItemResponseBuilder()..update(updates))._build();

  _$PurchaseItemResponse._(
      {this.success, this.transactionId, this.message, this.remainingCurrency})
      : super._();
  @override
  PurchaseItemResponse rebuild(
          void Function(PurchaseItemResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PurchaseItemResponseBuilder toBuilder() =>
      PurchaseItemResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PurchaseItemResponse &&
        success == other.success &&
        transactionId == other.transactionId &&
        message == other.message &&
        remainingCurrency == other.remainingCurrency;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, transactionId.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, remainingCurrency.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PurchaseItemResponse')
          ..add('success', success)
          ..add('transactionId', transactionId)
          ..add('message', message)
          ..add('remainingCurrency', remainingCurrency))
        .toString();
  }
}

class PurchaseItemResponseBuilder
    implements Builder<PurchaseItemResponse, PurchaseItemResponseBuilder> {
  _$PurchaseItemResponse? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  String? _transactionId;
  String? get transactionId => _$this._transactionId;
  set transactionId(String? transactionId) =>
      _$this._transactionId = transactionId;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  int? _remainingCurrency;
  int? get remainingCurrency => _$this._remainingCurrency;
  set remainingCurrency(int? remainingCurrency) =>
      _$this._remainingCurrency = remainingCurrency;

  PurchaseItemResponseBuilder() {
    PurchaseItemResponse._defaults(this);
  }

  PurchaseItemResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _transactionId = $v.transactionId;
      _message = $v.message;
      _remainingCurrency = $v.remainingCurrency;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PurchaseItemResponse other) {
    _$v = other as _$PurchaseItemResponse;
  }

  @override
  void update(void Function(PurchaseItemResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PurchaseItemResponse build() => _build();

  _$PurchaseItemResponse _build() {
    final _$result = _$v ??
        _$PurchaseItemResponse._(
          success: success,
          transactionId: transactionId,
          message: message,
          remainingCurrency: remainingCurrency,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
