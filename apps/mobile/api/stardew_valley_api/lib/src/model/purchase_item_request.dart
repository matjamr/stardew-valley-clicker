//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'purchase_item_request.g.dart';

/// PurchaseItemRequest
///
/// Properties:
/// * [userId]
/// * [islandId]
/// * [itemId]
/// * [quantity]
@BuiltValue()
abstract class PurchaseItemRequest
    implements Built<PurchaseItemRequest, PurchaseItemRequestBuilder> {
  @BuiltValueField(wireName: r'userId')
  String get userId;

  @BuiltValueField(wireName: r'islandId')
  String get islandId;

  @BuiltValueField(wireName: r'itemId')
  String get itemId;

  @BuiltValueField(wireName: r'quantity')
  int get quantity;

  PurchaseItemRequest._();

  factory PurchaseItemRequest([void updates(PurchaseItemRequestBuilder b)]) =
      _$PurchaseItemRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PurchaseItemRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PurchaseItemRequest> get serializer =>
      _$PurchaseItemRequestSerializer();
}

class _$PurchaseItemRequestSerializer
    implements PrimitiveSerializer<PurchaseItemRequest> {
  @override
  final Iterable<Type> types = const [
    PurchaseItemRequest,
    _$PurchaseItemRequest
  ];

  @override
  final String wireName = r'PurchaseItemRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PurchaseItemRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'userId';
    yield serializers.serialize(
      object.userId,
      specifiedType: const FullType(String),
    );
    yield r'islandId';
    yield serializers.serialize(
      object.islandId,
      specifiedType: const FullType(String),
    );
    yield r'itemId';
    yield serializers.serialize(
      object.itemId,
      specifiedType: const FullType(String),
    );
    yield r'quantity';
    yield serializers.serialize(
      object.quantity,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PurchaseItemRequest object, {
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
    required PurchaseItemRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'userId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.userId = valueDes;
          break;
        case r'islandId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.islandId = valueDes;
          break;
        case r'itemId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.itemId = valueDes;
          break;
        case r'quantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.quantity = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PurchaseItemRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PurchaseItemRequestBuilder();
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
