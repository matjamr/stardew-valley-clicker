// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mines.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Mines extends Mines {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final int? currentLevel;
  @override
  final int? maxLevel;
  @override
  final BuiltList<MineLevel>? levels;

  factory _$Mines([void Function(MinesBuilder)? updates]) =>
      (MinesBuilder()..update(updates))._build();

  _$Mines._({this.id, this.name, this.currentLevel, this.maxLevel, this.levels})
      : super._();
  @override
  Mines rebuild(void Function(MinesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MinesBuilder toBuilder() => MinesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Mines &&
        id == other.id &&
        name == other.name &&
        currentLevel == other.currentLevel &&
        maxLevel == other.maxLevel &&
        levels == other.levels;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, currentLevel.hashCode);
    _$hash = $jc(_$hash, maxLevel.hashCode);
    _$hash = $jc(_$hash, levels.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Mines')
          ..add('id', id)
          ..add('name', name)
          ..add('currentLevel', currentLevel)
          ..add('maxLevel', maxLevel)
          ..add('levels', levels))
        .toString();
  }
}

class MinesBuilder implements Builder<Mines, MinesBuilder> {
  _$Mines? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _currentLevel;
  int? get currentLevel => _$this._currentLevel;
  set currentLevel(int? currentLevel) => _$this._currentLevel = currentLevel;

  int? _maxLevel;
  int? get maxLevel => _$this._maxLevel;
  set maxLevel(int? maxLevel) => _$this._maxLevel = maxLevel;

  ListBuilder<MineLevel>? _levels;
  ListBuilder<MineLevel> get levels =>
      _$this._levels ??= ListBuilder<MineLevel>();
  set levels(ListBuilder<MineLevel>? levels) => _$this._levels = levels;

  MinesBuilder() {
    Mines._defaults(this);
  }

  MinesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _currentLevel = $v.currentLevel;
      _maxLevel = $v.maxLevel;
      _levels = $v.levels?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Mines other) {
    _$v = other as _$Mines;
  }

  @override
  void update(void Function(MinesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Mines build() => _build();

  _$Mines _build() {
    _$Mines _$result;
    try {
      _$result = _$v ??
          _$Mines._(
            id: id,
            name: name,
            currentLevel: currentLevel,
            maxLevel: maxLevel,
            levels: _levels?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'levels';
        _levels?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'Mines', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
