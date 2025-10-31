// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fishing_area.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FishingArea extends FishingArea {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final int? sizeX;
  @override
  final int? sizeY;
  @override
  final int? blockSize;
  @override
  final BuiltList<FishingSpot>? spots;
  @override
  final BuiltList<String>? availableFishIds;

  factory _$FishingArea([void Function(FishingAreaBuilder)? updates]) =>
      (FishingAreaBuilder()..update(updates))._build();

  _$FishingArea._(
      {this.id,
      this.name,
      this.sizeX,
      this.sizeY,
      this.blockSize,
      this.spots,
      this.availableFishIds})
      : super._();
  @override
  FishingArea rebuild(void Function(FishingAreaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FishingAreaBuilder toBuilder() => FishingAreaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FishingArea &&
        id == other.id &&
        name == other.name &&
        sizeX == other.sizeX &&
        sizeY == other.sizeY &&
        blockSize == other.blockSize &&
        spots == other.spots &&
        availableFishIds == other.availableFishIds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, sizeX.hashCode);
    _$hash = $jc(_$hash, sizeY.hashCode);
    _$hash = $jc(_$hash, blockSize.hashCode);
    _$hash = $jc(_$hash, spots.hashCode);
    _$hash = $jc(_$hash, availableFishIds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FishingArea')
          ..add('id', id)
          ..add('name', name)
          ..add('sizeX', sizeX)
          ..add('sizeY', sizeY)
          ..add('blockSize', blockSize)
          ..add('spots', spots)
          ..add('availableFishIds', availableFishIds))
        .toString();
  }
}

class FishingAreaBuilder implements Builder<FishingArea, FishingAreaBuilder> {
  _$FishingArea? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _sizeX;
  int? get sizeX => _$this._sizeX;
  set sizeX(int? sizeX) => _$this._sizeX = sizeX;

  int? _sizeY;
  int? get sizeY => _$this._sizeY;
  set sizeY(int? sizeY) => _$this._sizeY = sizeY;

  int? _blockSize;
  int? get blockSize => _$this._blockSize;
  set blockSize(int? blockSize) => _$this._blockSize = blockSize;

  ListBuilder<FishingSpot>? _spots;
  ListBuilder<FishingSpot> get spots =>
      _$this._spots ??= ListBuilder<FishingSpot>();
  set spots(ListBuilder<FishingSpot>? spots) => _$this._spots = spots;

  ListBuilder<String>? _availableFishIds;
  ListBuilder<String> get availableFishIds =>
      _$this._availableFishIds ??= ListBuilder<String>();
  set availableFishIds(ListBuilder<String>? availableFishIds) =>
      _$this._availableFishIds = availableFishIds;

  FishingAreaBuilder() {
    FishingArea._defaults(this);
  }

  FishingAreaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _sizeX = $v.sizeX;
      _sizeY = $v.sizeY;
      _blockSize = $v.blockSize;
      _spots = $v.spots?.toBuilder();
      _availableFishIds = $v.availableFishIds?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FishingArea other) {
    _$v = other as _$FishingArea;
  }

  @override
  void update(void Function(FishingAreaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FishingArea build() => _build();

  _$FishingArea _build() {
    _$FishingArea _$result;
    try {
      _$result = _$v ??
          _$FishingArea._(
            id: id,
            name: name,
            sizeX: sizeX,
            sizeY: sizeY,
            blockSize: blockSize,
            spots: _spots?.build(),
            availableFishIds: _availableFishIds?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'spots';
        _spots?.build();
        _$failedField = 'availableFishIds';
        _availableFishIds?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'FishingArea', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
