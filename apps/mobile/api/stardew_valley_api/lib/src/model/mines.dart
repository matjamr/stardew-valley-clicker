//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:stardew_valley_api/src/model/mine_level.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'mines.g.dart';

/// Mines
///
/// Properties:
/// * [id]
/// * [name]
/// * [currentLevel]
/// * [maxLevel]
/// * [levels]
@BuiltValue()
abstract class Mines implements Built<Mines, MinesBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'currentLevel')
  int? get currentLevel;

  @BuiltValueField(wireName: r'maxLevel')
  int? get maxLevel;

  @BuiltValueField(wireName: r'levels')
  BuiltList<MineLevel>? get levels;

  Mines._();

  factory Mines([void updates(MinesBuilder b)]) = _$Mines;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MinesBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Mines> get serializer => _$MinesSerializer();
}

class _$MinesSerializer implements PrimitiveSerializer<Mines> {
  @override
  final Iterable<Type> types = const [Mines, _$Mines];

  @override
  final String wireName = r'Mines';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Mines object, {
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
    if (object.currentLevel != null) {
      yield r'currentLevel';
      yield serializers.serialize(
        object.currentLevel,
        specifiedType: const FullType(int),
      );
    }
    if (object.maxLevel != null) {
      yield r'maxLevel';
      yield serializers.serialize(
        object.maxLevel,
        specifiedType: const FullType(int),
      );
    }
    if (object.levels != null) {
      yield r'levels';
      yield serializers.serialize(
        object.levels,
        specifiedType: const FullType(BuiltList, [FullType(MineLevel)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Mines object, {
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
    required MinesBuilder result,
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
        case r'currentLevel':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.currentLevel = valueDes;
          break;
        case r'maxLevel':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.maxLevel = valueDes;
          break;
        case r'levels':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(MineLevel)]),
          ) as BuiltList<MineLevel>;
          result.levels.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Mines deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MinesBuilder();
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
