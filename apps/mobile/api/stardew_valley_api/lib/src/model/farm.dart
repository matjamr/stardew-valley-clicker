//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:stardew_valley_api/src/model/decoration.dart';
import 'package:stardew_valley_api/src/model/crop_plot.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'farm.g.dart';

/// Farm
///
/// Properties:
/// * [id]
/// * [name]
/// * [sizeX]
/// * [sizeY]
/// * [blockSize]
/// * [plots]
/// * [decorations]
@BuiltValue()
abstract class Farm implements Built<Farm, FarmBuilder> {
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

  @BuiltValueField(wireName: r'plots')
  BuiltList<CropPlot>? get plots;

  @BuiltValueField(wireName: r'decorations')
  BuiltList<Decoration>? get decorations;

  Farm._();

  factory Farm([void updates(FarmBuilder b)]) = _$Farm;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(FarmBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Farm> get serializer => _$FarmSerializer();
}

class _$FarmSerializer implements PrimitiveSerializer<Farm> {
  @override
  final Iterable<Type> types = const [Farm, _$Farm];

  @override
  final String wireName = r'Farm';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Farm object, {
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
    if (object.plots != null) {
      yield r'plots';
      yield serializers.serialize(
        object.plots,
        specifiedType: const FullType(BuiltList, [FullType(CropPlot)]),
      );
    }
    if (object.decorations != null) {
      yield r'decorations';
      yield serializers.serialize(
        object.decorations,
        specifiedType: const FullType(BuiltList, [FullType(Decoration)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Farm object, {
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
    required FarmBuilder result,
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
        case r'plots':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(CropPlot)]),
          ) as BuiltList<CropPlot>;
          result.plots.replace(valueDes);
          break;
        case r'decorations':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Decoration)]),
          ) as BuiltList<Decoration>;
          result.decorations.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Farm deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = FarmBuilder();
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
