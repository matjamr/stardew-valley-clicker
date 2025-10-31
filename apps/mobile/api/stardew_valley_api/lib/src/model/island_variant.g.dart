// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'island_variant.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$IslandVariant extends IslandVariant {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? ownerId;
  @override
  final String? namedVariant;
  @override
  final Farm? farmTemplate;
  @override
  final Barn? barnTemplate;
  @override
  final Mines? minesTemplate;
  @override
  final FishingArea? fishingAreaTemplate;

  factory _$IslandVariant([void Function(IslandVariantBuilder)? updates]) =>
      (IslandVariantBuilder()..update(updates))._build();

  _$IslandVariant._(
      {this.id,
      this.name,
      this.ownerId,
      this.namedVariant,
      this.farmTemplate,
      this.barnTemplate,
      this.minesTemplate,
      this.fishingAreaTemplate})
      : super._();
  @override
  IslandVariant rebuild(void Function(IslandVariantBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IslandVariantBuilder toBuilder() => IslandVariantBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IslandVariant &&
        id == other.id &&
        name == other.name &&
        ownerId == other.ownerId &&
        namedVariant == other.namedVariant &&
        farmTemplate == other.farmTemplate &&
        barnTemplate == other.barnTemplate &&
        minesTemplate == other.minesTemplate &&
        fishingAreaTemplate == other.fishingAreaTemplate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, ownerId.hashCode);
    _$hash = $jc(_$hash, namedVariant.hashCode);
    _$hash = $jc(_$hash, farmTemplate.hashCode);
    _$hash = $jc(_$hash, barnTemplate.hashCode);
    _$hash = $jc(_$hash, minesTemplate.hashCode);
    _$hash = $jc(_$hash, fishingAreaTemplate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IslandVariant')
          ..add('id', id)
          ..add('name', name)
          ..add('ownerId', ownerId)
          ..add('namedVariant', namedVariant)
          ..add('farmTemplate', farmTemplate)
          ..add('barnTemplate', barnTemplate)
          ..add('minesTemplate', minesTemplate)
          ..add('fishingAreaTemplate', fishingAreaTemplate))
        .toString();
  }
}

class IslandVariantBuilder
    implements Builder<IslandVariant, IslandVariantBuilder> {
  _$IslandVariant? _$v;

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

  FarmBuilder? _farmTemplate;
  FarmBuilder get farmTemplate => _$this._farmTemplate ??= FarmBuilder();
  set farmTemplate(FarmBuilder? farmTemplate) =>
      _$this._farmTemplate = farmTemplate;

  BarnBuilder? _barnTemplate;
  BarnBuilder get barnTemplate => _$this._barnTemplate ??= BarnBuilder();
  set barnTemplate(BarnBuilder? barnTemplate) =>
      _$this._barnTemplate = barnTemplate;

  MinesBuilder? _minesTemplate;
  MinesBuilder get minesTemplate => _$this._minesTemplate ??= MinesBuilder();
  set minesTemplate(MinesBuilder? minesTemplate) =>
      _$this._minesTemplate = minesTemplate;

  FishingAreaBuilder? _fishingAreaTemplate;
  FishingAreaBuilder get fishingAreaTemplate =>
      _$this._fishingAreaTemplate ??= FishingAreaBuilder();
  set fishingAreaTemplate(FishingAreaBuilder? fishingAreaTemplate) =>
      _$this._fishingAreaTemplate = fishingAreaTemplate;

  IslandVariantBuilder() {
    IslandVariant._defaults(this);
  }

  IslandVariantBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _ownerId = $v.ownerId;
      _namedVariant = $v.namedVariant;
      _farmTemplate = $v.farmTemplate?.toBuilder();
      _barnTemplate = $v.barnTemplate?.toBuilder();
      _minesTemplate = $v.minesTemplate?.toBuilder();
      _fishingAreaTemplate = $v.fishingAreaTemplate?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IslandVariant other) {
    _$v = other as _$IslandVariant;
  }

  @override
  void update(void Function(IslandVariantBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IslandVariant build() => _build();

  _$IslandVariant _build() {
    _$IslandVariant _$result;
    try {
      _$result = _$v ??
          _$IslandVariant._(
            id: id,
            name: name,
            ownerId: ownerId,
            namedVariant: namedVariant,
            farmTemplate: _farmTemplate?.build(),
            barnTemplate: _barnTemplate?.build(),
            minesTemplate: _minesTemplate?.build(),
            fishingAreaTemplate: _fishingAreaTemplate?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'farmTemplate';
        _farmTemplate?.build();
        _$failedField = 'barnTemplate';
        _barnTemplate?.build();
        _$failedField = 'minesTemplate';
        _minesTemplate?.build();
        _$failedField = 'fishingAreaTemplate';
        _fishingAreaTemplate?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'IslandVariant', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
