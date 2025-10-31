// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Storage extends Storage {
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
  final String? storageId;
  @override
  final int? capacity;

  factory _$Storage([void Function(StorageBuilder)? updates]) =>
      (StorageBuilder()..update(updates))._build();

  _$Storage._(
      {this.x,
      this.y,
      this.sizeX,
      this.sizeY,
      this.asset,
      this.storageId,
      this.capacity})
      : super._();
  @override
  Storage rebuild(void Function(StorageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StorageBuilder toBuilder() => StorageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Storage &&
        x == other.x &&
        y == other.y &&
        sizeX == other.sizeX &&
        sizeY == other.sizeY &&
        asset == other.asset &&
        storageId == other.storageId &&
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
    _$hash = $jc(_$hash, storageId.hashCode);
    _$hash = $jc(_$hash, capacity.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Storage')
          ..add('x', x)
          ..add('y', y)
          ..add('sizeX', sizeX)
          ..add('sizeY', sizeY)
          ..add('asset', asset)
          ..add('storageId', storageId)
          ..add('capacity', capacity))
        .toString();
  }
}

class StorageBuilder implements Builder<Storage, StorageBuilder> {
  _$Storage? _$v;

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

  String? _storageId;
  String? get storageId => _$this._storageId;
  set storageId(String? storageId) => _$this._storageId = storageId;

  int? _capacity;
  int? get capacity => _$this._capacity;
  set capacity(int? capacity) => _$this._capacity = capacity;

  StorageBuilder() {
    Storage._defaults(this);
  }

  StorageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _x = $v.x;
      _y = $v.y;
      _sizeX = $v.sizeX;
      _sizeY = $v.sizeY;
      _asset = $v.asset?.toBuilder();
      _storageId = $v.storageId;
      _capacity = $v.capacity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Storage other) {
    _$v = other as _$Storage;
  }

  @override
  void update(void Function(StorageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Storage build() => _build();

  _$Storage _build() {
    _$Storage _$result;
    try {
      _$result = _$v ??
          _$Storage._(
            x: x,
            y: y,
            sizeX: sizeX,
            sizeY: sizeY,
            asset: _asset?.build(),
            storageId: storageId,
            capacity: capacity,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'asset';
        _asset?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'Storage', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
