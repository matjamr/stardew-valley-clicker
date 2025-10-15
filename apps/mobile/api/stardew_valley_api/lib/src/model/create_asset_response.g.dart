// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_asset_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateAssetResponse extends CreateAssetResponse {
  @override
  final Asset? asset;

  factory _$CreateAssetResponse(
          [void Function(CreateAssetResponseBuilder)? updates]) =>
      (CreateAssetResponseBuilder()..update(updates))._build();

  _$CreateAssetResponse._({this.asset}) : super._();
  @override
  CreateAssetResponse rebuild(
          void Function(CreateAssetResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateAssetResponseBuilder toBuilder() =>
      CreateAssetResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateAssetResponse && asset == other.asset;
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
    return (newBuiltValueToStringHelper(r'CreateAssetResponse')
          ..add('asset', asset))
        .toString();
  }
}

class CreateAssetResponseBuilder
    implements Builder<CreateAssetResponse, CreateAssetResponseBuilder> {
  _$CreateAssetResponse? _$v;

  AssetBuilder? _asset;
  AssetBuilder get asset => _$this._asset ??= AssetBuilder();
  set asset(AssetBuilder? asset) => _$this._asset = asset;

  CreateAssetResponseBuilder() {
    CreateAssetResponse._defaults(this);
  }

  CreateAssetResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _asset = $v.asset?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateAssetResponse other) {
    _$v = other as _$CreateAssetResponse;
  }

  @override
  void update(void Function(CreateAssetResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateAssetResponse build() => _build();

  _$CreateAssetResponse _build() {
    _$CreateAssetResponse _$result;
    try {
      _$result = _$v ??
          _$CreateAssetResponse._(
            asset: _asset?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'asset';
        _asset?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CreateAssetResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
