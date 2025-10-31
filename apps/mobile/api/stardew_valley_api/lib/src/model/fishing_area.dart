//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:stardew_valley_api/src/model/fishing_spot.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'fishing_area.g.dart';

/// FishingArea
///
/// Properties:
/// * [id]
/// * [name]
/// * [sizeX]
/// * [sizeY]
/// * [blockSize]
/// * [spots]
/// * [availableFishIds]
@BuiltValue()
abstract class FishingArea implements Built<FishingArea, FishingAreaBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'sizeX')
  int? get sizeX;

  @BuiltValueField(wireName: r'sizeY')
  int? get sizeY;

  @BuiltValueField(wireName: r'blockSize')
  int? get blockSize;

  @BuiltValueField(wireName: r'spots')
  BuiltList<FishingSpot>? get spots;

  @BuiltValueField(wireName: r'availableFishIds')
  BuiltList<String>? get availableFishIds;

  FishingArea._();

  factory FishingArea([void updates(FishingAreaBuilder b)]) = _$FishingArea;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(FishingAreaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<FishingArea> get serializer => _$FishingAreaSerializer();
}

class _$FishingAreaSerializer implements PrimitiveSerializer<FishingArea> {
  @override
  final Iterable<Type> types = const [FishingArea, _$FishingArea];

  @override
  final String wireName = r'FishingArea';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    FishingArea object, {
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
    if (object.spots != null) {
      yield r'spots';
      yield serializers.serialize(
        object.spots,
        specifiedType: const FullType(BuiltList, [FullType(FishingSpot)]),
      );
    }
    if (object.availableFishIds != null) {
      yield r'availableFishIds';
      yield serializers.serialize(
        object.availableFishIds,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    FishingArea object, {
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
    required FishingAreaBuilder result,
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
        case r'spots':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(FishingSpot)]),
          ) as BuiltList<FishingSpot>;
          result.spots.replace(valueDes);
          break;
        case r'availableFishIds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.availableFishIds.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  FishingArea deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = FishingAreaBuilder();
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
