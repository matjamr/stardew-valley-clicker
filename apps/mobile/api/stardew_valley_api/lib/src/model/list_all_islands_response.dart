//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:stardew_valley_api/src/model/island.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'list_all_islands_response.g.dart';

/// ListAllIslandsResponse
///
/// Properties:
/// * [islands]
@BuiltValue()
abstract class ListAllIslandsResponse
    implements Built<ListAllIslandsResponse, ListAllIslandsResponseBuilder> {
  @BuiltValueField(wireName: r'islands')
  BuiltList<Island>? get islands;

  ListAllIslandsResponse._();

  factory ListAllIslandsResponse(
          [void updates(ListAllIslandsResponseBuilder b)]) =
      _$ListAllIslandsResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ListAllIslandsResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ListAllIslandsResponse> get serializer =>
      _$ListAllIslandsResponseSerializer();
}

class _$ListAllIslandsResponseSerializer
    implements PrimitiveSerializer<ListAllIslandsResponse> {
  @override
  final Iterable<Type> types = const [
    ListAllIslandsResponse,
    _$ListAllIslandsResponse
  ];

  @override
  final String wireName = r'ListAllIslandsResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ListAllIslandsResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.islands != null) {
      yield r'islands';
      yield serializers.serialize(
        object.islands,
        specifiedType: const FullType(BuiltList, [FullType(Island)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ListAllIslandsResponse object, {
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
    required ListAllIslandsResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'islands':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Island)]),
          ) as BuiltList<Island>;
          result.islands.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ListAllIslandsResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ListAllIslandsResponseBuilder();
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
