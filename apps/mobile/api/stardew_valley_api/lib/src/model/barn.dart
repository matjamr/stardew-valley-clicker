//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:stardew_valley_api/src/model/animal_pen.dart';
import 'package:stardew_valley_api/src/model/storage.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'barn.g.dart';

/// Barn
///
/// Properties:
/// * [id]
/// * [name]
/// * [sizeX]
/// * [sizeY]
/// * [blockSize]
/// * [pens]
/// * [storageUnits]
@BuiltValue()
abstract class Barn implements Built<Barn, BarnBuilder> {
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

  @BuiltValueField(wireName: r'pens')
  BuiltList<AnimalPen>? get pens;

  @BuiltValueField(wireName: r'storageUnits')
  BuiltList<Storage>? get storageUnits;

  Barn._();

  factory Barn([void updates(BarnBuilder b)]) = _$Barn;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BarnBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Barn> get serializer => _$BarnSerializer();
}

class _$BarnSerializer implements PrimitiveSerializer<Barn> {
  @override
  final Iterable<Type> types = const [Barn, _$Barn];

  @override
  final String wireName = r'Barn';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Barn object, {
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
    if (object.pens != null) {
      yield r'pens';
      yield serializers.serialize(
        object.pens,
        specifiedType: const FullType(BuiltList, [FullType(AnimalPen)]),
      );
    }
    if (object.storageUnits != null) {
      yield r'storageUnits';
      yield serializers.serialize(
        object.storageUnits,
        specifiedType: const FullType(BuiltList, [FullType(Storage)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Barn object, {
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
    required BarnBuilder result,
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
        case r'pens':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(AnimalPen)]),
          ) as BuiltList<AnimalPen>;
          result.pens.replace(valueDes);
          break;
        case r'storageUnits':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Storage)]),
          ) as BuiltList<Storage>;
          result.storageUnits.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Barn deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BarnBuilder();
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
