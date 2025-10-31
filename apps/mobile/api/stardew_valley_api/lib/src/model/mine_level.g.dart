// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mine_level.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MineLevel extends MineLevel {
  @override
  final int? level;
  @override
  final int? sizeX;
  @override
  final int? sizeY;
  @override
  final int? blockSize;
  @override
  final BuiltList<MineTile>? tiles;
  @override
  final BuiltList<String>? resourceIds;
  @override
  final int? difficulty;

  factory _$MineLevel([void Function(MineLevelBuilder)? updates]) =>
      (MineLevelBuilder()..update(updates))._build();

  _$MineLevel._(
      {this.level,
      this.sizeX,
      this.sizeY,
      this.blockSize,
      this.tiles,
      this.resourceIds,
      this.difficulty})
      : super._();
  @override
  MineLevel rebuild(void Function(MineLevelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MineLevelBuilder toBuilder() => MineLevelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MineLevel &&
        level == other.level &&
        sizeX == other.sizeX &&
        sizeY == other.sizeY &&
        blockSize == other.blockSize &&
        tiles == other.tiles &&
        resourceIds == other.resourceIds &&
        difficulty == other.difficulty;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, level.hashCode);
    _$hash = $jc(_$hash, sizeX.hashCode);
    _$hash = $jc(_$hash, sizeY.hashCode);
    _$hash = $jc(_$hash, blockSize.hashCode);
    _$hash = $jc(_$hash, tiles.hashCode);
    _$hash = $jc(_$hash, resourceIds.hashCode);
    _$hash = $jc(_$hash, difficulty.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MineLevel')
          ..add('level', level)
          ..add('sizeX', sizeX)
          ..add('sizeY', sizeY)
          ..add('blockSize', blockSize)
          ..add('tiles', tiles)
          ..add('resourceIds', resourceIds)
          ..add('difficulty', difficulty))
        .toString();
  }
}

class MineLevelBuilder implements Builder<MineLevel, MineLevelBuilder> {
  _$MineLevel? _$v;

  int? _level;
  int? get level => _$this._level;
  set level(int? level) => _$this._level = level;

  int? _sizeX;
  int? get sizeX => _$this._sizeX;
  set sizeX(int? sizeX) => _$this._sizeX = sizeX;

  int? _sizeY;
  int? get sizeY => _$this._sizeY;
  set sizeY(int? sizeY) => _$this._sizeY = sizeY;

  int? _blockSize;
  int? get blockSize => _$this._blockSize;
  set blockSize(int? blockSize) => _$this._blockSize = blockSize;

  ListBuilder<MineTile>? _tiles;
  ListBuilder<MineTile> get tiles => _$this._tiles ??= ListBuilder<MineTile>();
  set tiles(ListBuilder<MineTile>? tiles) => _$this._tiles = tiles;

  ListBuilder<String>? _resourceIds;
  ListBuilder<String> get resourceIds =>
      _$this._resourceIds ??= ListBuilder<String>();
  set resourceIds(ListBuilder<String>? resourceIds) =>
      _$this._resourceIds = resourceIds;

  int? _difficulty;
  int? get difficulty => _$this._difficulty;
  set difficulty(int? difficulty) => _$this._difficulty = difficulty;

  MineLevelBuilder() {
    MineLevel._defaults(this);
  }

  MineLevelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _level = $v.level;
      _sizeX = $v.sizeX;
      _sizeY = $v.sizeY;
      _blockSize = $v.blockSize;
      _tiles = $v.tiles?.toBuilder();
      _resourceIds = $v.resourceIds?.toBuilder();
      _difficulty = $v.difficulty;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MineLevel other) {
    _$v = other as _$MineLevel;
  }

  @override
  void update(void Function(MineLevelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MineLevel build() => _build();

  _$MineLevel _build() {
    _$MineLevel _$result;
    try {
      _$result = _$v ??
          _$MineLevel._(
            level: level,
            sizeX: sizeX,
            sizeY: sizeY,
            blockSize: blockSize,
            tiles: _tiles?.build(),
            resourceIds: _resourceIds?.build(),
            difficulty: difficulty,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'tiles';
        _tiles?.build();
        _$failedField = 'resourceIds';
        _resourceIds?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'MineLevel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
