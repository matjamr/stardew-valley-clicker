// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terrain_tile.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TerrainTile extends TerrainTile {
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
  final int? timeTaken;

  factory _$TerrainTile([void Function(TerrainTileBuilder)? updates]) =>
      (TerrainTileBuilder()..update(updates))._build();

  _$TerrainTile._(
      {this.x, this.y, this.sizeX, this.sizeY, this.asset, this.timeTaken})
      : super._();
  @override
  TerrainTile rebuild(void Function(TerrainTileBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TerrainTileBuilder toBuilder() => TerrainTileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TerrainTile &&
        x == other.x &&
        y == other.y &&
        sizeX == other.sizeX &&
        sizeY == other.sizeY &&
        asset == other.asset &&
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
    _$hash = $jc(_$hash, timeTaken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TerrainTile')
          ..add('x', x)
          ..add('y', y)
          ..add('sizeX', sizeX)
          ..add('sizeY', sizeY)
          ..add('asset', asset)
          ..add('timeTaken', timeTaken))
        .toString();
  }
}

class TerrainTileBuilder implements Builder<TerrainTile, TerrainTileBuilder> {
  _$TerrainTile? _$v;

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

  int? _timeTaken;
  int? get timeTaken => _$this._timeTaken;
  set timeTaken(int? timeTaken) => _$this._timeTaken = timeTaken;

  TerrainTileBuilder() {
    TerrainTile._defaults(this);
  }

  TerrainTileBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _x = $v.x;
      _y = $v.y;
      _sizeX = $v.sizeX;
      _sizeY = $v.sizeY;
      _asset = $v.asset?.toBuilder();
      _timeTaken = $v.timeTaken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TerrainTile other) {
    _$v = other as _$TerrainTile;
  }

  @override
  void update(void Function(TerrainTileBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TerrainTile build() => _build();

  _$TerrainTile _build() {
    _$TerrainTile _$result;
    try {
      _$result = _$v ??
          _$TerrainTile._(
            x: x,
            y: y,
            sizeX: sizeX,
            sizeY: sizeY,
            asset: _asset?.build(),
            timeTaken: timeTaken,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'asset';
        _asset?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TerrainTile', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
