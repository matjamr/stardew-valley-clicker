// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'island_variant.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const IslandVariantTypeEnum _$islandVariantTypeEnum_DEFAULT =
    const IslandVariantTypeEnum._('DEFAULT');
const IslandVariantTypeEnum _$islandVariantTypeEnum_CLASSIC =
    const IslandVariantTypeEnum._('CLASSIC');
const IslandVariantTypeEnum _$islandVariantTypeEnum_FOREST =
    const IslandVariantTypeEnum._('FOREST');

IslandVariantTypeEnum _$islandVariantTypeEnumValueOf(String name) {
  switch (name) {
    case 'DEFAULT':
      return _$islandVariantTypeEnum_DEFAULT;
    case 'CLASSIC':
      return _$islandVariantTypeEnum_CLASSIC;
    case 'FOREST':
      return _$islandVariantTypeEnum_FOREST;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<IslandVariantTypeEnum> _$islandVariantTypeEnumValues =
    BuiltSet<IslandVariantTypeEnum>(const <IslandVariantTypeEnum>[
  _$islandVariantTypeEnum_DEFAULT,
  _$islandVariantTypeEnum_CLASSIC,
  _$islandVariantTypeEnum_FOREST,
]);

Serializer<IslandVariantTypeEnum> _$islandVariantTypeEnumSerializer =
    _$IslandVariantTypeEnumSerializer();

class _$IslandVariantTypeEnumSerializer
    implements PrimitiveSerializer<IslandVariantTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'DEFAULT': 'DEFAULT',
    'CLASSIC': 'CLASSIC',
    'FOREST': 'FOREST',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'DEFAULT': 'DEFAULT',
    'CLASSIC': 'CLASSIC',
    'FOREST': 'FOREST',
  };

  @override
  final Iterable<Type> types = const <Type>[IslandVariantTypeEnum];
  @override
  final String wireName = 'IslandVariantTypeEnum';

  @override
  Object serialize(Serializers serializers, IslandVariantTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  IslandVariantTypeEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      IslandVariantTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$IslandVariant extends IslandVariant {
  @override
  final String? id;
  @override
  final IslandVariantTypeEnum? type;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final BuiltList<Terrain>? startingTerrains;

  factory _$IslandVariant([void Function(IslandVariantBuilder)? updates]) =>
      (IslandVariantBuilder()..update(updates))._build();

  _$IslandVariant._(
      {this.id, this.type, this.name, this.description, this.startingTerrains})
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
        type == other.type &&
        name == other.name &&
        description == other.description &&
        startingTerrains == other.startingTerrains;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, startingTerrains.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IslandVariant')
          ..add('id', id)
          ..add('type', type)
          ..add('name', name)
          ..add('description', description)
          ..add('startingTerrains', startingTerrains))
        .toString();
  }
}

class IslandVariantBuilder
    implements Builder<IslandVariant, IslandVariantBuilder> {
  _$IslandVariant? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  IslandVariantTypeEnum? _type;
  IslandVariantTypeEnum? get type => _$this._type;
  set type(IslandVariantTypeEnum? type) => _$this._type = type;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ListBuilder<Terrain>? _startingTerrains;
  ListBuilder<Terrain> get startingTerrains =>
      _$this._startingTerrains ??= ListBuilder<Terrain>();
  set startingTerrains(ListBuilder<Terrain>? startingTerrains) =>
      _$this._startingTerrains = startingTerrains;

  IslandVariantBuilder() {
    IslandVariant._defaults(this);
  }

  IslandVariantBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _type = $v.type;
      _name = $v.name;
      _description = $v.description;
      _startingTerrains = $v.startingTerrains?.toBuilder();
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
            type: type,
            name: name,
            description: description,
            startingTerrains: _startingTerrains?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'startingTerrains';
        _startingTerrains?.build();
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
