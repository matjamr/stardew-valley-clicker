// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barn.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Barn extends Barn {
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
  final BuiltList<AnimalPen>? pens;
  @override
  final BuiltList<Storage>? storageUnits;

  factory _$Barn([void Function(BarnBuilder)? updates]) =>
      (BarnBuilder()..update(updates))._build();

  _$Barn._(
      {this.id,
      this.name,
      this.sizeX,
      this.sizeY,
      this.blockSize,
      this.pens,
      this.storageUnits})
      : super._();
  @override
  Barn rebuild(void Function(BarnBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BarnBuilder toBuilder() => BarnBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Barn &&
        id == other.id &&
        name == other.name &&
        sizeX == other.sizeX &&
        sizeY == other.sizeY &&
        blockSize == other.blockSize &&
        pens == other.pens &&
        storageUnits == other.storageUnits;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, sizeX.hashCode);
    _$hash = $jc(_$hash, sizeY.hashCode);
    _$hash = $jc(_$hash, blockSize.hashCode);
    _$hash = $jc(_$hash, pens.hashCode);
    _$hash = $jc(_$hash, storageUnits.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Barn')
          ..add('id', id)
          ..add('name', name)
          ..add('sizeX', sizeX)
          ..add('sizeY', sizeY)
          ..add('blockSize', blockSize)
          ..add('pens', pens)
          ..add('storageUnits', storageUnits))
        .toString();
  }
}

class BarnBuilder implements Builder<Barn, BarnBuilder> {
  _$Barn? _$v;

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

  ListBuilder<AnimalPen>? _pens;
  ListBuilder<AnimalPen> get pens => _$this._pens ??= ListBuilder<AnimalPen>();
  set pens(ListBuilder<AnimalPen>? pens) => _$this._pens = pens;

  ListBuilder<Storage>? _storageUnits;
  ListBuilder<Storage> get storageUnits =>
      _$this._storageUnits ??= ListBuilder<Storage>();
  set storageUnits(ListBuilder<Storage>? storageUnits) =>
      _$this._storageUnits = storageUnits;

  BarnBuilder() {
    Barn._defaults(this);
  }

  BarnBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _sizeX = $v.sizeX;
      _sizeY = $v.sizeY;
      _blockSize = $v.blockSize;
      _pens = $v.pens?.toBuilder();
      _storageUnits = $v.storageUnits?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Barn other) {
    _$v = other as _$Barn;
  }

  @override
  void update(void Function(BarnBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Barn build() => _build();

  _$Barn _build() {
    _$Barn _$result;
    try {
      _$result = _$v ??
          _$Barn._(
            id: id,
            name: name,
            sizeX: sizeX,
            sizeY: sizeY,
            blockSize: blockSize,
            pens: _pens?.build(),
            storageUnits: _storageUnits?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pens';
        _pens?.build();
        _$failedField = 'storageUnits';
        _storageUnits?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'Barn', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
