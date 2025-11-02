// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terrain_collectable.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TerrainCollectable extends TerrainCollectable {
  @override
  final String? id;
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
  final TerrainCollectableType? type;
  @override
  final bool? isCollected;
  @override
  final String? collectedAt;

  factory _$TerrainCollectable(
          [void Function(TerrainCollectableBuilder)? updates]) =>
      (TerrainCollectableBuilder()..update(updates))._build();

  _$TerrainCollectable._(
      {this.id,
      this.x,
      this.y,
      this.sizeX,
      this.sizeY,
      this.asset,
      this.type,
      this.isCollected,
      this.collectedAt})
      : super._();
  @override
  TerrainCollectable rebuild(
          void Function(TerrainCollectableBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TerrainCollectableBuilder toBuilder() =>
      TerrainCollectableBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TerrainCollectable &&
        id == other.id &&
        x == other.x &&
        y == other.y &&
        sizeX == other.sizeX &&
        sizeY == other.sizeY &&
        asset == other.asset &&
        type == other.type &&
        isCollected == other.isCollected &&
        collectedAt == other.collectedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, x.hashCode);
    _$hash = $jc(_$hash, y.hashCode);
    _$hash = $jc(_$hash, sizeX.hashCode);
    _$hash = $jc(_$hash, sizeY.hashCode);
    _$hash = $jc(_$hash, asset.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, isCollected.hashCode);
    _$hash = $jc(_$hash, collectedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TerrainCollectable')
          ..add('id', id)
          ..add('x', x)
          ..add('y', y)
          ..add('sizeX', sizeX)
          ..add('sizeY', sizeY)
          ..add('asset', asset)
          ..add('type', type)
          ..add('isCollected', isCollected)
          ..add('collectedAt', collectedAt))
        .toString();
  }
}

class TerrainCollectableBuilder
    implements Builder<TerrainCollectable, TerrainCollectableBuilder> {
  _$TerrainCollectable? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

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

  TerrainCollectableType? _type;
  TerrainCollectableType? get type => _$this._type;
  set type(TerrainCollectableType? type) => _$this._type = type;

  bool? _isCollected;
  bool? get isCollected => _$this._isCollected;
  set isCollected(bool? isCollected) => _$this._isCollected = isCollected;

  String? _collectedAt;
  String? get collectedAt => _$this._collectedAt;
  set collectedAt(String? collectedAt) => _$this._collectedAt = collectedAt;

  TerrainCollectableBuilder() {
    TerrainCollectable._defaults(this);
  }

  TerrainCollectableBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _x = $v.x;
      _y = $v.y;
      _sizeX = $v.sizeX;
      _sizeY = $v.sizeY;
      _asset = $v.asset?.toBuilder();
      _type = $v.type;
      _isCollected = $v.isCollected;
      _collectedAt = $v.collectedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TerrainCollectable other) {
    _$v = other as _$TerrainCollectable;
  }

  @override
  void update(void Function(TerrainCollectableBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TerrainCollectable build() => _build();

  _$TerrainCollectable _build() {
    _$TerrainCollectable _$result;
    try {
      _$result = _$v ??
          _$TerrainCollectable._(
            id: id,
            x: x,
            y: y,
            sizeX: sizeX,
            sizeY: sizeY,
            asset: _asset?.build(),
            type: type,
            isCollected: isCollected,
            collectedAt: collectedAt,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'asset';
        _asset?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TerrainCollectable', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
