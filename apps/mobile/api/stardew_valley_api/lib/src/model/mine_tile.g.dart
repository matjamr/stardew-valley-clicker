// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mine_tile.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MineTile extends MineTile {
  @override
  final int? x;
  @override
  final int? y;
  @override
  final int? sizeX;
  @override
  final int? sizeY;
  @override
  final Asset? asset;
  @override
  final String? resourceId;
  @override
  final int? resourceQuantity;
  @override
  final bool? discovered;
  @override
  final int? timeTaken;

  factory _$MineTile([void Function(MineTileBuilder)? updates]) =>
      (MineTileBuilder()..update(updates))._build();

  _$MineTile._(
      {this.x,
      this.y,
      this.sizeX,
      this.sizeY,
      this.asset,
      this.resourceId,
      this.resourceQuantity,
      this.discovered,
      this.timeTaken})
      : super._();
  @override
  MineTile rebuild(void Function(MineTileBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MineTileBuilder toBuilder() => MineTileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MineTile &&
        x == other.x &&
        y == other.y &&
        sizeX == other.sizeX &&
        sizeY == other.sizeY &&
        asset == other.asset &&
        resourceId == other.resourceId &&
        resourceQuantity == other.resourceQuantity &&
        discovered == other.discovered &&
        timeTaken == other.timeTaken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, x.hashCode);
    _$hash = $jc(_$hash, y.hashCode);
    _$hash = $jc(_$hash, sizeX.hashCode);
    _$hash = $jc(_$hash, sizeY.hashCode);
    _$hash = $jc(_$hash, asset.hashCode);
    _$hash = $jc(_$hash, resourceId.hashCode);
    _$hash = $jc(_$hash, resourceQuantity.hashCode);
    _$hash = $jc(_$hash, discovered.hashCode);
    _$hash = $jc(_$hash, timeTaken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MineTile')
          ..add('x', x)
          ..add('y', y)
          ..add('sizeX', sizeX)
          ..add('sizeY', sizeY)
          ..add('asset', asset)
          ..add('resourceId', resourceId)
          ..add('resourceQuantity', resourceQuantity)
          ..add('discovered', discovered)
          ..add('timeTaken', timeTaken))
        .toString();
  }
}

class MineTileBuilder implements Builder<MineTile, MineTileBuilder> {
  _$MineTile? _$v;

  int? _x;
  int? get x => _$this._x;
  set x(int? x) => _$this._x = x;

  int? _y;
  int? get y => _$this._y;
  set y(int? y) => _$this._y = y;

  int? _sizeX;
  int? get sizeX => _$this._sizeX;
  set sizeX(int? sizeX) => _$this._sizeX = sizeX;

  int? _sizeY;
  int? get sizeY => _$this._sizeY;
  set sizeY(int? sizeY) => _$this._sizeY = sizeY;

  AssetBuilder? _asset;
  AssetBuilder get asset => _$this._asset ??= AssetBuilder();
  set asset(AssetBuilder? asset) => _$this._asset = asset;

  String? _resourceId;
  String? get resourceId => _$this._resourceId;
  set resourceId(String? resourceId) => _$this._resourceId = resourceId;

  int? _resourceQuantity;
  int? get resourceQuantity => _$this._resourceQuantity;
  set resourceQuantity(int? resourceQuantity) =>
      _$this._resourceQuantity = resourceQuantity;

  bool? _discovered;
  bool? get discovered => _$this._discovered;
  set discovered(bool? discovered) => _$this._discovered = discovered;

  int? _timeTaken;
  int? get timeTaken => _$this._timeTaken;
  set timeTaken(int? timeTaken) => _$this._timeTaken = timeTaken;

  MineTileBuilder() {
    MineTile._defaults(this);
  }

  MineTileBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _x = $v.x;
      _y = $v.y;
      _sizeX = $v.sizeX;
      _sizeY = $v.sizeY;
      _asset = $v.asset?.toBuilder();
      _resourceId = $v.resourceId;
      _resourceQuantity = $v.resourceQuantity;
      _discovered = $v.discovered;
      _timeTaken = $v.timeTaken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MineTile other) {
    _$v = other as _$MineTile;
  }

  @override
  void update(void Function(MineTileBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MineTile build() => _build();

  _$MineTile _build() {
    _$MineTile _$result;
    try {
      _$result = _$v ??
          _$MineTile._(
            x: x,
            y: y,
            sizeX: sizeX,
            sizeY: sizeY,
            asset: _asset?.build(),
            resourceId: resourceId,
            resourceQuantity: resourceQuantity,
            discovered: discovered,
            timeTaken: timeTaken,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'asset';
        _asset?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'MineTile', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
