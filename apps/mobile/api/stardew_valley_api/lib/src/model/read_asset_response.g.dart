// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_asset_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReadAssetResponse extends ReadAssetResponse {
  @override
  final Asset? asset;

  factory _$ReadAssetResponse(
          [void Function(ReadAssetResponseBuilder)? updates]) =>
      (ReadAssetResponseBuilder()..update(updates))._build();

  _$ReadAssetResponse._({this.asset}) : super._();
  @override
  ReadAssetResponse rebuild(void Function(ReadAssetResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReadAssetResponseBuilder toBuilder() =>
      ReadAssetResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReadAssetResponse && asset == other.asset;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, asset.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReadAssetResponse')
          ..add('asset', asset))
        .toString();
  }
}

class ReadAssetResponseBuilder
    implements Builder<ReadAssetResponse, ReadAssetResponseBuilder> {
  _$ReadAssetResponse? _$v;

  AssetBuilder? _asset;
  AssetBuilder get asset => _$this._asset ??= AssetBuilder();
  set asset(AssetBuilder? asset) => _$this._asset = asset;

  ReadAssetResponseBuilder() {
    ReadAssetResponse._defaults(this);
  }

  ReadAssetResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _asset = $v.asset?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReadAssetResponse other) {
    _$v = other as _$ReadAssetResponse;
  }

  @override
  void update(void Function(ReadAssetResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReadAssetResponse build() => _build();

  _$ReadAssetResponse _build() {
    _$ReadAssetResponse _$result;
    try {
      _$result = _$v ??
          _$ReadAssetResponse._(
            asset: _asset?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'asset';
        _asset?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ReadAssetResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
