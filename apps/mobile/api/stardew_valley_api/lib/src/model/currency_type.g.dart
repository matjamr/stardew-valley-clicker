// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const CurrencyType _$CURRENCY_UNSPECIFIED =
    const CurrencyType._('CURRENCY_UNSPECIFIED');
const CurrencyType _$GOLD = const CurrencyType._('GOLD');
const CurrencyType _$GEMS = const CurrencyType._('GEMS');
const CurrencyType _$TOKENS = const CurrencyType._('TOKENS');

CurrencyType _$valueOf(String name) {
  switch (name) {
    case 'CURRENCY_UNSPECIFIED':
      return _$CURRENCY_UNSPECIFIED;
    case 'GOLD':
      return _$GOLD;
    case 'GEMS':
      return _$GEMS;
    case 'TOKENS':
      return _$TOKENS;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<CurrencyType> _$values =
    BuiltSet<CurrencyType>(const <CurrencyType>[
  _$CURRENCY_UNSPECIFIED,
  _$GOLD,
  _$GEMS,
  _$TOKENS,
]);

class _$CurrencyTypeMeta {
  const _$CurrencyTypeMeta();
  CurrencyType get CURRENCY_UNSPECIFIED => _$CURRENCY_UNSPECIFIED;
  CurrencyType get GOLD => _$GOLD;
  CurrencyType get GEMS => _$GEMS;
  CurrencyType get TOKENS => _$TOKENS;
  CurrencyType valueOf(String name) => _$valueOf(name);
  BuiltSet<CurrencyType> get values => _$values;
}

abstract class _$CurrencyTypeMixin {
  // ignore: non_constant_identifier_names
  _$CurrencyTypeMeta get CurrencyType => const _$CurrencyTypeMeta();
}

Serializer<CurrencyType> _$currencyTypeSerializer = _$CurrencyTypeSerializer();

class _$CurrencyTypeSerializer implements PrimitiveSerializer<CurrencyType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'CURRENCY_UNSPECIFIED': 'CURRENCY_UNSPECIFIED',
    'GOLD': 'GOLD',
    'GEMS': 'GEMS',
    'TOKENS': 'TOKENS',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'CURRENCY_UNSPECIFIED': 'CURRENCY_UNSPECIFIED',
    'GOLD': 'GOLD',
    'GEMS': 'GEMS',
    'TOKENS': 'TOKENS',
  };

  @override
  final Iterable<Type> types = const <Type>[CurrencyType];
  @override
  final String wireName = 'CurrencyType';

  @override
  Object serialize(Serializers serializers, CurrencyType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  CurrencyType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CurrencyType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
