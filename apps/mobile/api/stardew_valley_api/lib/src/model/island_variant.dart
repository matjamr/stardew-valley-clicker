//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:stardew_valley_api/src/model/barn.dart';
import 'package:stardew_valley_api/src/model/farm.dart';
import 'package:stardew_valley_api/src/model/fishing_area.dart';
import 'package:stardew_valley_api/src/model/mines.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'island_variant.g.dart';

/// IslandVariant
///
/// Properties:
/// * [id]
/// * [name]
/// * [ownerId]
/// * [namedVariant]
/// * [farmTemplate]
/// * [barnTemplate]
/// * [minesTemplate]
/// * [fishingAreaTemplate]
@BuiltValue()
abstract class IslandVariant
    implements Built<IslandVariant, IslandVariantBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'ownerId')
  String? get ownerId;

  @BuiltValueField(wireName: r'namedVariant')
  String? get namedVariant;

  @BuiltValueField(wireName: r'farmTemplate')
  Farm? get farmTemplate;

  @BuiltValueField(wireName: r'barnTemplate')
  Barn? get barnTemplate;

  @BuiltValueField(wireName: r'minesTemplate')
  Mines? get minesTemplate;

  @BuiltValueField(wireName: r'fishingAreaTemplate')
  FishingArea? get fishingAreaTemplate;

  IslandVariant._();

  factory IslandVariant([void updates(IslandVariantBuilder b)]) =
      _$IslandVariant;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(IslandVariantBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<IslandVariant> get serializer =>
      _$IslandVariantSerializer();
}

class _$IslandVariantSerializer implements PrimitiveSerializer<IslandVariant> {
  @override
  final Iterable<Type> types = const [IslandVariant, _$IslandVariant];

  @override
  final String wireName = r'IslandVariant';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    IslandVariant object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.ownerId != null) {
      yield r'ownerId';
      yield serializers.serialize(
        object.ownerId,
        specifiedType: const FullType(String),
      );
    }
    if (object.namedVariant != null) {
      yield r'namedVariant';
      yield serializers.serialize(
        object.namedVariant,
        specifiedType: const FullType(String),
      );
    }
    if (object.farmTemplate != null) {
      yield r'farmTemplate';
      yield serializers.serialize(
        object.farmTemplate,
        specifiedType: const FullType(Farm),
      );
    }
    if (object.barnTemplate != null) {
      yield r'barnTemplate';
      yield serializers.serialize(
        object.barnTemplate,
        specifiedType: const FullType(Barn),
      );
    }
    if (object.minesTemplate != null) {
      yield r'minesTemplate';
      yield serializers.serialize(
        object.minesTemplate,
        specifiedType: const FullType(Mines),
      );
    }
    if (object.fishingAreaTemplate != null) {
      yield r'fishingAreaTemplate';
      yield serializers.serialize(
        object.fishingAreaTemplate,
        specifiedType: const FullType(FishingArea),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    IslandVariant object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required IslandVariantBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'ownerId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.ownerId = valueDes;
          break;
        case r'namedVariant':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.namedVariant = valueDes;
          break;
        case r'farmTemplate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Farm),
          ) as Farm;
          result.farmTemplate.replace(valueDes);
          break;
        case r'barnTemplate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Barn),
          ) as Barn;
          result.barnTemplate.replace(valueDes);
          break;
        case r'minesTemplate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Mines),
          ) as Mines;
          result.minesTemplate.replace(valueDes);
          break;
        case r'fishingAreaTemplate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(FishingArea),
          ) as FishingArea;
          result.fishingAreaTemplate.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  IslandVariant deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = IslandVariantBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}
