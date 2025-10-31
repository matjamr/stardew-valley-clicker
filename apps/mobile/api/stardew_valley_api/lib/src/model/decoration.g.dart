// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decoration.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Decoration extends Decoration {
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

  factory _$Decoration([void Function(DecorationBuilder)? updates]) =>
      (DecorationBuilder()..update(updates))._build();

  _$Decoration._({this.x, this.y, this.sizeX, this.sizeY, this.asset})
      : super._();
  @override
  Decoration rebuild(void Function(DecorationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DecorationBuilder toBuilder() => DecorationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Decoration &&
        x == other.x &&
        y == other.y &&
        sizeX == other.sizeX &&
        sizeY == other.sizeY &&
        asset == other.asset;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, x.hashCode);
    _$hash = $jc(_$hash, y.hashCode);
    _$hash = $jc(_$hash, sizeX.hashCode);
    _$hash = $jc(_$hash, sizeY.hashCode);
    _$hash = $jc(_$hash, asset.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Decoration')
          ..add('x', x)
          ..add('y', y)
          ..add('sizeX', sizeX)
          ..add('sizeY', sizeY)
          ..add('asset', asset))
        .toString();
  }
}

class DecorationBuilder implements Builder<Decoration, DecorationBuilder> {
  _$Decoration? _$v;

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

  DecorationBuilder() {
    Decoration._defaults(this);
  }

  DecorationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _x = $v.x;
      _y = $v.y;
      _sizeX = $v.sizeX;
      _sizeY = $v.sizeY;
      _asset = $v.asset?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Decoration other) {
    _$v = other as _$Decoration;
  }

  @override
  void update(void Function(DecorationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Decoration build() => _build();

  _$Decoration _build() {
    _$Decoration _$result;
    try {
      _$result = _$v ??
          _$Decoration._(
            x: x,
            y: y,
            sizeX: sizeX,
            sizeY: sizeY,
            asset: _asset?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'asset';
        _asset?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'Decoration', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
