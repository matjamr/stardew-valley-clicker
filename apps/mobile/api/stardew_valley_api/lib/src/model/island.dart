//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:stardew_valley_api/src/model/barn.dart';
import 'package:built_collection/built_collection.dart';
import 'package:stardew_valley_api/src/model/farm.dart';
import 'package:stardew_valley_api/src/model/terrain.dart';
import 'package:stardew_valley_api/src/model/fishing_area.dart';
import 'package:stardew_valley_api/src/model/mines.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'island.g.dart';

/// Island
///
/// Properties:
/// * [id]
/// * [name]
/// * [ownerId]
/// * [namedVariant]
/// * [allowedPlayers]
/// * [createdAt]
/// * [updatedAt]
/// * [terrains]
/// * [farm]
/// * [barn]
/// * [mines]
/// * [fishingArea]
@BuiltValue()
abstract class Island implements Built<Island, IslandBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'ownerId')
  String? get ownerId;

  @BuiltValueField(wireName: r'namedVariant')
  String? get namedVariant;

  @BuiltValueField(wireName: r'allowedPlayers')
  BuiltList<String>? get allowedPlayers;

  @BuiltValueField(wireName: r'createdAt')
  String? get createdAt;

  @BuiltValueField(wireName: r'updatedAt')
  String? get updatedAt;

  @BuiltValueField(wireName: r'terrains')
  BuiltList<Terrain>? get terrains;

  @BuiltValueField(wireName: r'farm')
  Farm? get farm;

  @BuiltValueField(wireName: r'barn')
  Barn? get barn;

  @BuiltValueField(wireName: r'mines')
  Mines? get mines;

  @BuiltValueField(wireName: r'fishingArea')
  FishingArea? get fishingArea;

  Island._();

  factory Island([void updates(IslandBuilder b)]) = _$Island;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(IslandBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Island> get serializer => _$IslandSerializer();
}

class _$IslandSerializer implements PrimitiveSerializer<Island> {
  @override
  final Iterable<Type> types = const [Island, _$Island];

  @override
  final String wireName = r'Island';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Island object, {
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
    if (object.allowedPlayers != null) {
      yield r'allowedPlayers';
      yield serializers.serialize(
        object.allowedPlayers,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.createdAt != null) {
      yield r'createdAt';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType(String),
      );
    }
    if (object.updatedAt != null) {
      yield r'updatedAt';
      yield serializers.serialize(
        object.updatedAt,
        specifiedType: const FullType(String),
      );
    }
    if (object.terrains != null) {
      yield r'terrains';
      yield serializers.serialize(
        object.terrains,
        specifiedType: const FullType(BuiltList, [FullType(Terrain)]),
      );
    }
    if (object.farm != null) {
      yield r'farm';
      yield serializers.serialize(
        object.farm,
        specifiedType: const FullType(Farm),
      );
    }
    if (object.barn != null) {
      yield r'barn';
      yield serializers.serialize(
        object.barn,
        specifiedType: const FullType(Barn),
      );
    }
    if (object.mines != null) {
      yield r'mines';
      yield serializers.serialize(
        object.mines,
        specifiedType: const FullType(Mines),
      );
    }
    if (object.fishingArea != null) {
      yield r'fishingArea';
      yield serializers.serialize(
        object.fishingArea,
        specifiedType: const FullType(FishingArea),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Island object, {
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
    required IslandBuilder result,
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
        case r'allowedPlayers':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.allowedPlayers.replace(valueDes);
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.createdAt = valueDes;
          break;
        case r'updatedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.updatedAt = valueDes;
          break;
        case r'terrains':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Terrain)]),
          ) as BuiltList<Terrain>;
          result.terrains.replace(valueDes);
          break;
        case r'farm':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Farm),
          ) as Farm;
          result.farm.replace(valueDes);
          break;
        case r'barn':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Barn),
          ) as Barn;
          result.barn.replace(valueDes);
          break;
        case r'mines':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Mines),
          ) as Mines;
          result.mines.replace(valueDes);
          break;
        case r'fishingArea':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(FishingArea),
          ) as FishingArea;
          result.fishingArea.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Island deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = IslandBuilder();
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
