// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'island.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Island extends Island {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? ownerId;
  @override
  final String? namedVariant;
  @override
  final BuiltList<String>? allowedPlayers;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final BuiltList<Terrain>? terrains;
  @override
  final Farm? farm;
  @override
  final Barn? barn;
  @override
  final Mines? mines;
  @override
  final FishingArea? fishingArea;

  factory _$Island([void Function(IslandBuilder)? updates]) =>
      (IslandBuilder()..update(updates))._build();

  _$Island._(
      {this.id,
      this.name,
      this.ownerId,
      this.namedVariant,
      this.allowedPlayers,
      this.createdAt,
      this.updatedAt,
      this.terrains,
      this.farm,
      this.barn,
      this.mines,
      this.fishingArea})
      : super._();
  @override
  Island rebuild(void Function(IslandBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IslandBuilder toBuilder() => IslandBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Island &&
        id == other.id &&
        name == other.name &&
        ownerId == other.ownerId &&
        namedVariant == other.namedVariant &&
        allowedPlayers == other.allowedPlayers &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        terrains == other.terrains &&
        farm == other.farm &&
        barn == other.barn &&
        mines == other.mines &&
        fishingArea == other.fishingArea;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, ownerId.hashCode);
    _$hash = $jc(_$hash, namedVariant.hashCode);
    _$hash = $jc(_$hash, allowedPlayers.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, terrains.hashCode);
    _$hash = $jc(_$hash, farm.hashCode);
    _$hash = $jc(_$hash, barn.hashCode);
    _$hash = $jc(_$hash, mines.hashCode);
    _$hash = $jc(_$hash, fishingArea.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Island')
          ..add('id', id)
          ..add('name', name)
          ..add('ownerId', ownerId)
          ..add('namedVariant', namedVariant)
          ..add('allowedPlayers', allowedPlayers)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('terrains', terrains)
          ..add('farm', farm)
          ..add('barn', barn)
          ..add('mines', mines)
          ..add('fishingArea', fishingArea))
        .toString();
  }
}

class IslandBuilder implements Builder<Island, IslandBuilder> {
  _$Island? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _ownerId;
  String? get ownerId => _$this._ownerId;
  set ownerId(String? ownerId) => _$this._ownerId = ownerId;

  String? _namedVariant;
  String? get namedVariant => _$this._namedVariant;
  set namedVariant(String? namedVariant) => _$this._namedVariant = namedVariant;

  ListBuilder<String>? _allowedPlayers;
  ListBuilder<String> get allowedPlayers =>
      _$this._allowedPlayers ??= ListBuilder<String>();
  set allowedPlayers(ListBuilder<String>? allowedPlayers) =>
      _$this._allowedPlayers = allowedPlayers;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  ListBuilder<Terrain>? _terrains;
  ListBuilder<Terrain> get terrains =>
      _$this._terrains ??= ListBuilder<Terrain>();
  set terrains(ListBuilder<Terrain>? terrains) => _$this._terrains = terrains;

  FarmBuilder? _farm;
  FarmBuilder get farm => _$this._farm ??= FarmBuilder();
  set farm(FarmBuilder? farm) => _$this._farm = farm;

  BarnBuilder? _barn;
  BarnBuilder get barn => _$this._barn ??= BarnBuilder();
  set barn(BarnBuilder? barn) => _$this._barn = barn;

  MinesBuilder? _mines;
  MinesBuilder get mines => _$this._mines ??= MinesBuilder();
  set mines(MinesBuilder? mines) => _$this._mines = mines;

  FishingAreaBuilder? _fishingArea;
  FishingAreaBuilder get fishingArea =>
      _$this._fishingArea ??= FishingAreaBuilder();
  set fishingArea(FishingAreaBuilder? fishingArea) =>
      _$this._fishingArea = fishingArea;

  IslandBuilder() {
    Island._defaults(this);
  }

  IslandBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _ownerId = $v.ownerId;
      _namedVariant = $v.namedVariant;
      _allowedPlayers = $v.allowedPlayers?.toBuilder();
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _terrains = $v.terrains?.toBuilder();
      _farm = $v.farm?.toBuilder();
      _barn = $v.barn?.toBuilder();
      _mines = $v.mines?.toBuilder();
      _fishingArea = $v.fishingArea?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Island other) {
    _$v = other as _$Island;
  }

  @override
  void update(void Function(IslandBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Island build() => _build();

  _$Island _build() {
    _$Island _$result;
    try {
      _$result = _$v ??
          _$Island._(
            id: id,
            name: name,
            ownerId: ownerId,
            namedVariant: namedVariant,
            allowedPlayers: _allowedPlayers?.build(),
            createdAt: createdAt,
            updatedAt: updatedAt,
            terrains: _terrains?.build(),
            farm: _farm?.build(),
            barn: _barn?.build(),
            mines: _mines?.build(),
            fishingArea: _fishingArea?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'allowedPlayers';
        _allowedPlayers?.build();

        _$failedField = 'terrains';
        _terrains?.build();
        _$failedField = 'farm';
        _farm?.build();
        _$failedField = 'barn';
        _barn?.build();
        _$failedField = 'mines';
        _mines?.build();
        _$failedField = 'fishingArea';
        _fishingArea?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'Island', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
