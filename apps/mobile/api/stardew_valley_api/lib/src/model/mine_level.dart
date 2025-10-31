//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:stardew_valley_api/src/model/mine_tile.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'mine_level.g.dart';

/// MineLevel
///
/// Properties:
/// * [level]
/// * [sizeX]
/// * [sizeY]
/// * [blockSize]
/// * [tiles]
/// * [resourceIds]
/// * [difficulty]
@BuiltValue()
abstract class MineLevel implements Built<MineLevel, MineLevelBuilder> {
  @BuiltValueField(wireName: r'level')
  int? get level;

  @BuiltValueField(wireName: r'sizeX')
  int? get sizeX;

  @BuiltValueField(wireName: r'sizeY')
  int? get sizeY;

  @BuiltValueField(wireName: r'blockSize')
  int? get blockSize;

  @BuiltValueField(wireName: r'tiles')
  BuiltList<MineTile>? get tiles;

  @BuiltValueField(wireName: r'resourceIds')
  BuiltList<String>? get resourceIds;

  @BuiltValueField(wireName: r'difficulty')
  int? get difficulty;

  MineLevel._();

  factory MineLevel([void updates(MineLevelBuilder b)]) = _$MineLevel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MineLevelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MineLevel> get serializer => _$MineLevelSerializer();
}

class _$MineLevelSerializer implements PrimitiveSerializer<MineLevel> {
  @override
  final Iterable<Type> types = const [MineLevel, _$MineLevel];

  @override
  final String wireName = r'MineLevel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MineLevel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.level != null) {
      yield r'level';
      yield serializers.serialize(
        object.level,
        specifiedType: const FullType(int),
      );
    }
    if (object.sizeX != null) {
      yield r'sizeX';
      yield serializers.serialize(
        object.sizeX,
        specifiedType: const FullType(int),
      );
    }
    if (object.sizeY != null) {
      yield r'sizeY';
      yield serializers.serialize(
        object.sizeY,
        specifiedType: const FullType(int),
      );
    }
    if (object.blockSize != null) {
      yield r'blockSize';
      yield serializers.serialize(
        object.blockSize,
        specifiedType: const FullType(int),
      );
    }
    if (object.tiles != null) {
      yield r'tiles';
      yield serializers.serialize(
        object.tiles,
        specifiedType: const FullType(BuiltList, [FullType(MineTile)]),
      );
    }
    if (object.resourceIds != null) {
      yield r'resourceIds';
      yield serializers.serialize(
        object.resourceIds,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.difficulty != null) {
      yield r'difficulty';
      yield serializers.serialize(
        object.difficulty,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    MineLevel object, {
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
    required MineLevelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.level = valueDes;
          break;
        case r'sizeX':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.sizeX = valueDes;
          break;
        case r'sizeY':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.sizeY = valueDes;
          break;
        case r'blockSize':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.blockSize = valueDes;
          break;
        case r'tiles':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(MineTile)]),
          ) as BuiltList<MineTile>;
          result.tiles.replace(valueDes);
          break;
        case r'resourceIds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.resourceIds.replace(valueDes);
          break;
        case r'difficulty':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.difficulty = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MineLevel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MineLevelBuilder();
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
