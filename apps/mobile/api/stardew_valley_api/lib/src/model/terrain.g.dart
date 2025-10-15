// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terrain.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Terrain extends Terrain {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final BuiltList<TerrainTile>? tiles;
  @override
  final int? blockSize;
  @override
  final int? sizeX;
  @override
  final int? sizeY;

  factory _$Terrain([void Function(TerrainBuilder)? updates]) =>
      (TerrainBuilder()..update(updates))._build();

  _$Terrain._(
      {this.id, this.name, this.tiles, this.blockSize, this.sizeX, this.sizeY})
      : super._();
  @override
  Terrain rebuild(void Function(TerrainBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TerrainBuilder toBuilder() => TerrainBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Terrain &&
        id == other.id &&
        name == other.name &&
        tiles == other.tiles &&
        blockSize == other.blockSize &&
        sizeX == other.sizeX &&
        sizeY == other.sizeY;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, tiles.hashCode);
    _$hash = $jc(_$hash, blockSize.hashCode);
    _$hash = $jc(_$hash, sizeX.hashCode);
    _$hash = $jc(_$hash, sizeY.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Terrain')
          ..add('id', id)
          ..add('name', name)
          ..add('tiles', tiles)
          ..add('blockSize', blockSize)
          ..add('sizeX', sizeX)
          ..add('sizeY', sizeY))
        .toString();
  }
}

class TerrainBuilder implements Builder<Terrain, TerrainBuilder> {
  _$Terrain? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<TerrainTile>? _tiles;
  ListBuilder<TerrainTile> get tiles =>
      _$this._tiles ??= ListBuilder<TerrainTile>();
  set tiles(ListBuilder<TerrainTile>? tiles) => _$this._tiles = tiles;

  int? _blockSize;
  int? get blockSize => _$this._blockSize;
  set blockSize(int? blockSize) => _$this._blockSize = blockSize;

  int? _sizeX;
  int? get sizeX => _$this._sizeX;
  set sizeX(int? sizeX) => _$this._sizeX = sizeX;

  int? _sizeY;
  int? get sizeY => _$this._sizeY;
  set sizeY(int? sizeY) => _$this._sizeY = sizeY;

  TerrainBuilder() {
    Terrain._defaults(this);
  }

  TerrainBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _tiles = $v.tiles?.toBuilder();
      _blockSize = $v.blockSize;
      _sizeX = $v.sizeX;
      _sizeY = $v.sizeY;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Terrain other) {
    _$v = other as _$Terrain;
  }

  @override
  void update(void Function(TerrainBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Terrain build() => _build();

  _$Terrain _build() {
    _$Terrain _$result;
    try {
      _$result = _$v ??
          _$Terrain._(
            id: id,
            name: name,
            tiles: _tiles?.build(),
            blockSize: blockSize,
            sizeX: sizeX,
            sizeY: sizeY,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'tiles';
        _tiles?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'Terrain', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
