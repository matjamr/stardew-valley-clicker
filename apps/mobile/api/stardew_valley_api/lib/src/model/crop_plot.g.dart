// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crop_plot.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CropPlot extends CropPlot {
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
  final String? cropId;
  @override
  final String? plantedAt;
  @override
  final int? growthStage;
  @override
  final bool? isWatered;

  factory _$CropPlot([void Function(CropPlotBuilder)? updates]) =>
      (CropPlotBuilder()..update(updates))._build();

  _$CropPlot._(
      {this.x,
      this.y,
      this.sizeX,
      this.sizeY,
      this.asset,
      this.cropId,
      this.plantedAt,
      this.growthStage,
      this.isWatered})
      : super._();
  @override
  CropPlot rebuild(void Function(CropPlotBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CropPlotBuilder toBuilder() => CropPlotBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CropPlot &&
        x == other.x &&
        y == other.y &&
        sizeX == other.sizeX &&
        sizeY == other.sizeY &&
        asset == other.asset &&
        cropId == other.cropId &&
        plantedAt == other.plantedAt &&
        growthStage == other.growthStage &&
        isWatered == other.isWatered;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, x.hashCode);
    _$hash = $jc(_$hash, y.hashCode);
    _$hash = $jc(_$hash, sizeX.hashCode);
    _$hash = $jc(_$hash, sizeY.hashCode);
    _$hash = $jc(_$hash, asset.hashCode);
    _$hash = $jc(_$hash, cropId.hashCode);
    _$hash = $jc(_$hash, plantedAt.hashCode);
    _$hash = $jc(_$hash, growthStage.hashCode);
    _$hash = $jc(_$hash, isWatered.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CropPlot')
          ..add('x', x)
          ..add('y', y)
          ..add('sizeX', sizeX)
          ..add('sizeY', sizeY)
          ..add('asset', asset)
          ..add('cropId', cropId)
          ..add('plantedAt', plantedAt)
          ..add('growthStage', growthStage)
          ..add('isWatered', isWatered))
        .toString();
  }
}

class CropPlotBuilder implements Builder<CropPlot, CropPlotBuilder> {
  _$CropPlot? _$v;

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

  String? _cropId;
  String? get cropId => _$this._cropId;
  set cropId(String? cropId) => _$this._cropId = cropId;

  String? _plantedAt;
  String? get plantedAt => _$this._plantedAt;
  set plantedAt(String? plantedAt) => _$this._plantedAt = plantedAt;

  int? _growthStage;
  int? get growthStage => _$this._growthStage;
  set growthStage(int? growthStage) => _$this._growthStage = growthStage;

  bool? _isWatered;
  bool? get isWatered => _$this._isWatered;
  set isWatered(bool? isWatered) => _$this._isWatered = isWatered;

  CropPlotBuilder() {
    CropPlot._defaults(this);
  }

  CropPlotBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _x = $v.x;
      _y = $v.y;
      _sizeX = $v.sizeX;
      _sizeY = $v.sizeY;
      _asset = $v.asset?.toBuilder();
      _cropId = $v.cropId;
      _plantedAt = $v.plantedAt;
      _growthStage = $v.growthStage;
      _isWatered = $v.isWatered;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CropPlot other) {
    _$v = other as _$CropPlot;
  }

  @override
  void update(void Function(CropPlotBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CropPlot build() => _build();

  _$CropPlot _build() {
    _$CropPlot _$result;
    try {
      _$result = _$v ??
          _$CropPlot._(
            x: x,
            y: y,
            sizeX: sizeX,
            sizeY: sizeY,
            asset: _asset?.build(),
            cropId: cropId,
            plantedAt: plantedAt,
            growthStage: growthStage,
            isWatered: isWatered,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'asset';
        _asset?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CropPlot', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
