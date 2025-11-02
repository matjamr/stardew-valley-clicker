// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_all_islands_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ListAllIslandsResponse extends ListAllIslandsResponse {
  @override
  final BuiltList<Island>? islands;

  factory _$ListAllIslandsResponse(
          [void Function(ListAllIslandsResponseBuilder)? updates]) =>
      (ListAllIslandsResponseBuilder()..update(updates))._build();

  _$ListAllIslandsResponse._({this.islands}) : super._();
  @override
  ListAllIslandsResponse rebuild(
          void Function(ListAllIslandsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ListAllIslandsResponseBuilder toBuilder() =>
      ListAllIslandsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ListAllIslandsResponse && islands == other.islands;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, islands.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ListAllIslandsResponse')
          ..add('islands', islands))
        .toString();
  }
}

class ListAllIslandsResponseBuilder
    implements Builder<ListAllIslandsResponse, ListAllIslandsResponseBuilder> {
  _$ListAllIslandsResponse? _$v;

  ListBuilder<Island>? _islands;
  ListBuilder<Island> get islands => _$this._islands ??= ListBuilder<Island>();
  set islands(ListBuilder<Island>? islands) => _$this._islands = islands;

  ListAllIslandsResponseBuilder() {
    ListAllIslandsResponse._defaults(this);
  }

  ListAllIslandsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _islands = $v.islands?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ListAllIslandsResponse other) {
    _$v = other as _$ListAllIslandsResponse;
  }

  @override
  void update(void Function(ListAllIslandsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ListAllIslandsResponse build() => _build();

  _$ListAllIslandsResponse _build() {
    _$ListAllIslandsResponse _$result;
    try {
      _$result = _$v ??
          _$ListAllIslandsResponse._(
            islands: _islands?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'islands';
        _islands?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ListAllIslandsResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
