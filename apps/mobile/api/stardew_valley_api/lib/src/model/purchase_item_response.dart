//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'purchase_item_response.g.dart';

/// PurchaseItemResponse
///
/// Properties:
/// * [success]
/// * [transactionId]
/// * [message] - Error message if success = false
/// * [remainingCurrency]
@BuiltValue()
abstract class PurchaseItemResponse
    implements Built<PurchaseItemResponse, PurchaseItemResponseBuilder> {
  @BuiltValueField(wireName: r'success')
  bool? get success;

  @BuiltValueField(wireName: r'transactionId')
  String? get transactionId;

  /// Error message if success = false
  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'remainingCurrency')
  int? get remainingCurrency;

  PurchaseItemResponse._();

  factory PurchaseItemResponse([void updates(PurchaseItemResponseBuilder b)]) =
      _$PurchaseItemResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PurchaseItemResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PurchaseItemResponse> get serializer =>
      _$PurchaseItemResponseSerializer();
}

class _$PurchaseItemResponseSerializer
    implements PrimitiveSerializer<PurchaseItemResponse> {
  @override
  final Iterable<Type> types = const [
    PurchaseItemResponse,
    _$PurchaseItemResponse
  ];

  @override
  final String wireName = r'PurchaseItemResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PurchaseItemResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.success != null) {
      yield r'success';
      yield serializers.serialize(
        object.success,
        specifiedType: const FullType(bool),
      );
    }
    if (object.transactionId != null) {
      yield r'transactionId';
      yield serializers.serialize(
        object.transactionId,
        specifiedType: const FullType(String),
      );
    }
    if (object.message != null) {
      yield r'message';
      yield serializers.serialize(
        object.message,
        specifiedType: const FullType(String),
      );
    }
    if (object.remainingCurrency != null) {
      yield r'remainingCurrency';
      yield serializers.serialize(
        object.remainingCurrency,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PurchaseItemResponse object, {
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
    required PurchaseItemResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'success':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.success = valueDes;
          break;
        case r'transactionId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.transactionId = valueDes;
          break;
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.message = valueDes;
          break;
        case r'remainingCurrency':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.remainingCurrency = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PurchaseItemResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PurchaseItemResponseBuilder();
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
