// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal_pen.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AnimalPen extends AnimalPen {
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
  final BuiltList<String>? animalIds;
  @override
  final int? capacity;

  factory _$AnimalPen([void Function(AnimalPenBuilder)? updates]) =>
      (AnimalPenBuilder()..update(updates))._build();

  _$AnimalPen._(
      {this.x,
      this.y,
      this.sizeX,
      this.sizeY,
      this.asset,
      this.animalIds,
      this.capacity})
      : super._();
  @override
  AnimalPen rebuild(void Function(AnimalPenBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnimalPenBuilder toBuilder() => AnimalPenBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnimalPen &&
        x == other.x &&
        y == other.y &&
        sizeX == other.sizeX &&
        sizeY == other.sizeY &&
        asset == other.asset &&
        animalIds == other.animalIds &&
        capacity == other.capacity;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, x.hashCode);
    _$hash = $jc(_$hash, y.hashCode);
    _$hash = $jc(_$hash, sizeX.hashCode);
    _$hash = $jc(_$hash, sizeY.hashCode);
    _$hash = $jc(_$hash, asset.hashCode);
    _$hash = $jc(_$hash, animalIds.hashCode);
    _$hash = $jc(_$hash, capacity.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AnimalPen')
          ..add('x', x)
          ..add('y', y)
          ..add('sizeX', sizeX)
          ..add('sizeY', sizeY)
          ..add('asset', asset)
          ..add('animalIds', animalIds)
          ..add('capacity', capacity))
        .toString();
  }
}

class AnimalPenBuilder implements Builder<AnimalPen, AnimalPenBuilder> {
  _$AnimalPen? _$v;

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

  ListBuilder<String>? _animalIds;
  ListBuilder<String> get animalIds =>
      _$this._animalIds ??= ListBuilder<String>();
  set animalIds(ListBuilder<String>? animalIds) =>
      _$this._animalIds = animalIds;

  int? _capacity;
  int? get capacity => _$this._capacity;
  set capacity(int? capacity) => _$this._capacity = capacity;

  AnimalPenBuilder() {
    AnimalPen._defaults(this);
  }

  AnimalPenBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _x = $v.x;
      _y = $v.y;
      _sizeX = $v.sizeX;
      _sizeY = $v.sizeY;
      _asset = $v.asset?.toBuilder();
      _animalIds = $v.animalIds?.toBuilder();
      _capacity = $v.capacity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnimalPen other) {
    _$v = other as _$AnimalPen;
  }

  @override
  void update(void Function(AnimalPenBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AnimalPen build() => _build();

  _$AnimalPen _build() {
    _$AnimalPen _$result;
    try {
      _$result = _$v ??
          _$AnimalPen._(
            x: x,
            y: y,
            sizeX: sizeX,
            sizeY: sizeY,
            asset: _asset?.build(),
            animalIds: _animalIds?.build(),
            capacity: capacity,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'asset';
        _asset?.build();
        _$failedField = 'animalIds';
        _animalIds?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AnimalPen', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
