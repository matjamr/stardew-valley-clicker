//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'currency_type.g.dart';

class CurrencyType extends EnumClass {
  @BuiltValueEnumConst(wireName: r'CURRENCY_UNSPECIFIED')
  static const CurrencyType CURRENCY_UNSPECIFIED = _$CURRENCY_UNSPECIFIED;
  @BuiltValueEnumConst(wireName: r'GOLD')
  static const CurrencyType GOLD = _$GOLD;
  @BuiltValueEnumConst(wireName: r'GEMS')
  static const CurrencyType GEMS = _$GEMS;
  @BuiltValueEnumConst(wireName: r'TOKENS')
  static const CurrencyType TOKENS = _$TOKENS;

  static Serializer<CurrencyType> get serializer => _$currencyTypeSerializer;

  const CurrencyType._(String name) : super(name);

  static BuiltSet<CurrencyType> get values => _$values;
  static CurrencyType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class CurrencyTypeMixin = Object with _$CurrencyTypeMixin;
