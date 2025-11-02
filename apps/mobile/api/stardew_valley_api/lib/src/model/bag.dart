//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:stardew_valley_api/src/model/bag_item.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'bag.g.dart';

/// Bag
///
/// Properties:
/// * [items]
/// * [maxSlots] - Maximum number of item slots (e.g., 20, 40)
@BuiltValue()
abstract class Bag implements Built<Bag, BagBuilder> {
  @BuiltValueField(wireName: r'items')
  BuiltList<BagItem>? get items;

  /// Maximum number of item slots (e.g., 20, 40)
  @BuiltValueField(wireName: r'maxSlots')
  int? get maxSlots;

  Bag._();

  factory Bag([void updates(BagBuilder b)]) = _$Bag;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BagBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Bag> get serializer => _$BagSerializer();
}

class _$BagSerializer implements PrimitiveSerializer<Bag> {
  @override
  final Iterable<Type> types = const [Bag, _$Bag];

  @override
  final String wireName = r'Bag';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Bag object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.items != null) {
      yield r'items';
      yield serializers.serialize(
        object.items,
        specifiedType: const FullType(BuiltList, [FullType(BagItem)]),
      );
    }
    if (object.maxSlots != null) {
      yield r'maxSlots';
      yield serializers.serialize(
        object.maxSlots,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Bag object, {
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
    required BagBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(BagItem)]),
          ) as BuiltList<BagItem>;
          result.items.replace(valueDes);
          break;
        case r'maxSlots':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.maxSlots = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Bag deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BagBuilder();
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
