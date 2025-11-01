// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'energy_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EnergyInfo extends EnergyInfo {
  @override
  final int? energyConsumption;

  factory _$EnergyInfo([void Function(EnergyInfoBuilder)? updates]) =>
      (EnergyInfoBuilder()..update(updates))._build();

  _$EnergyInfo._({this.energyConsumption}) : super._();
  @override
  EnergyInfo rebuild(void Function(EnergyInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EnergyInfoBuilder toBuilder() => EnergyInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EnergyInfo && energyConsumption == other.energyConsumption;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, energyConsumption.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EnergyInfo')
          ..add('energyConsumption', energyConsumption))
        .toString();
  }
}

class EnergyInfoBuilder implements Builder<EnergyInfo, EnergyInfoBuilder> {
  _$EnergyInfo? _$v;

  int? _energyConsumption;
  int? get energyConsumption => _$this._energyConsumption;
  set energyConsumption(int? energyConsumption) =>
      _$this._energyConsumption = energyConsumption;

  EnergyInfoBuilder() {
    EnergyInfo._defaults(this);
  }

  EnergyInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _energyConsumption = $v.energyConsumption;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EnergyInfo other) {
    _$v = other as _$EnergyInfo;
  }

  @override
  void update(void Function(EnergyInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EnergyInfo build() => _build();

  _$EnergyInfo _build() {
    final _$result = _$v ??
        _$EnergyInfo._(
          energyConsumption: energyConsumption,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
