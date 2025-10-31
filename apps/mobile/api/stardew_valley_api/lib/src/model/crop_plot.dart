//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:stardew_valley_api/src/model/asset.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'crop_plot.g.dart';

/// CropPlot
///
/// Properties:
/// * [x]
/// * [y]
/// * [sizeX]
/// * [sizeY]
/// * [asset]
/// * [cropId]
/// * [plantedAt]
/// * [growthStage]
/// * [isWatered]
@BuiltValue()
abstract class CropPlot implements Built<CropPlot, CropPlotBuilder> {
  @BuiltValueField(wireName: r'x')
  int? get x;

  @BuiltValueField(wireName: r'y')
  int? get y;

  @BuiltValueField(wireName: r'sizeX')
  int? get sizeX;

  @BuiltValueField(wireName: r'sizeY')
  int? get sizeY;

  @BuiltValueField(wireName: r'asset')
  Asset? get asset;

  @BuiltValueField(wireName: r'cropId')
  String? get cropId;

  @BuiltValueField(wireName: r'plantedAt')
  String? get plantedAt;

  @BuiltValueField(wireName: r'growthStage')
  int? get growthStage;

  @BuiltValueField(wireName: r'isWatered')
  bool? get isWatered;

  CropPlot._();

  factory CropPlot([void updates(CropPlotBuilder b)]) = _$CropPlot;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CropPlotBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CropPlot> get serializer => _$CropPlotSerializer();
}

class _$CropPlotSerializer implements PrimitiveSerializer<CropPlot> {
  @override
  final Iterable<Type> types = const [CropPlot, _$CropPlot];

  @override
  final String wireName = r'CropPlot';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CropPlot object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.x != null) {
      yield r'x';
      yield serializers.serialize(
        object.x,
        specifiedType: const FullType(int),
      );
    }
    if (object.y != null) {
      yield r'y';
      yield serializers.serialize(
        object.y,
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
    if (object.asset != null) {
      yield r'asset';
      yield serializers.serialize(
        object.asset,
        specifiedType: const FullType(Asset),
      );
    }
    if (object.cropId != null) {
      yield r'cropId';
      yield serializers.serialize(
        object.cropId,
        specifiedType: const FullType(String),
      );
    }
    if (object.plantedAt != null) {
      yield r'plantedAt';
      yield serializers.serialize(
        object.plantedAt,
        specifiedType: const FullType(String),
      );
    }
    if (object.growthStage != null) {
      yield r'growthStage';
      yield serializers.serialize(
        object.growthStage,
        specifiedType: const FullType(int),
      );
    }
    if (object.isWatered != null) {
      yield r'isWatered';
      yield serializers.serialize(
        object.isWatered,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CropPlot object, {
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
    required CropPlotBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'x':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.x = valueDes;
          break;
        case r'y':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.y = valueDes;
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
        case r'asset':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Asset),
          ) as Asset;
          result.asset.replace(valueDes);
          break;
        case r'cropId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.cropId = valueDes;
          break;
        case r'plantedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.plantedAt = valueDes;
          break;
        case r'growthStage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.growthStage = valueDes;
          break;
        case r'isWatered':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isWatered = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CropPlot deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CropPlotBuilder();
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
