// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farm.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Farm extends Farm {
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
  final BuiltList<CropPlot>? plots;
  @override
  final BuiltList<Decoration>? decorations;

  factory _$Farm([void Function(FarmBuilder)? updates]) =>
      (FarmBuilder()..update(updates))._build();

  _$Farm._(
      {this.id,
      this.name,
      this.sizeX,
      this.sizeY,
      this.blockSize,
      this.plots,
      this.decorations})
      : super._();
  @override
  Farm rebuild(void Function(FarmBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FarmBuilder toBuilder() => FarmBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Farm &&
        id == other.id &&
        name == other.name &&
        sizeX == other.sizeX &&
        sizeY == other.sizeY &&
        blockSize == other.blockSize &&
        plots == other.plots &&
        decorations == other.decorations;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, sizeX.hashCode);
    _$hash = $jc(_$hash, sizeY.hashCode);
    _$hash = $jc(_$hash, blockSize.hashCode);
    _$hash = $jc(_$hash, plots.hashCode);
    _$hash = $jc(_$hash, decorations.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Farm')
          ..add('id', id)
          ..add('name', name)
          ..add('sizeX', sizeX)
          ..add('sizeY', sizeY)
          ..add('blockSize', blockSize)
          ..add('plots', plots)
          ..add('decorations', decorations))
        .toString();
  }
}

class FarmBuilder implements Builder<Farm, FarmBuilder> {
  _$Farm? _$v;

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

  ListBuilder<CropPlot>? _plots;
  ListBuilder<CropPlot> get plots => _$this._plots ??= ListBuilder<CropPlot>();
  set plots(ListBuilder<CropPlot>? plots) => _$this._plots = plots;

  ListBuilder<Decoration>? _decorations;
  ListBuilder<Decoration> get decorations =>
      _$this._decorations ??= ListBuilder<Decoration>();
  set decorations(ListBuilder<Decoration>? decorations) =>
      _$this._decorations = decorations;

  FarmBuilder() {
    Farm._defaults(this);
  }

  FarmBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _sizeX = $v.sizeX;
      _sizeY = $v.sizeY;
      _blockSize = $v.blockSize;
      _plots = $v.plots?.toBuilder();
      _decorations = $v.decorations?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Farm other) {
    _$v = other as _$Farm;
  }

  @override
  void update(void Function(FarmBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Farm build() => _build();

  _$Farm _build() {
    _$Farm _$result;
    try {
      _$result = _$v ??
          _$Farm._(
            id: id,
            name: name,
            sizeX: sizeX,
            sizeY: sizeY,
            blockSize: blockSize,
            plots: _plots?.build(),
            decorations: _decorations?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'plots';
        _plots?.build();
        _$failedField = 'decorations';
        _decorations?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'Farm', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
