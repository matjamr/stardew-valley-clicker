// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_event_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReadEventResponse extends ReadEventResponse {
  @override
  final ScheduledEvent? event;

  factory _$ReadEventResponse(
          [void Function(ReadEventResponseBuilder)? updates]) =>
      (ReadEventResponseBuilder()..update(updates))._build();

  _$ReadEventResponse._({this.event}) : super._();
  @override
  ReadEventResponse rebuild(void Function(ReadEventResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReadEventResponseBuilder toBuilder() =>
      ReadEventResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReadEventResponse && event == other.event;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, event.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReadEventResponse')
          ..add('event', event))
        .toString();
  }
}

class ReadEventResponseBuilder
    implements Builder<ReadEventResponse, ReadEventResponseBuilder> {
  _$ReadEventResponse? _$v;

  ScheduledEventBuilder? _event;
  ScheduledEventBuilder get event => _$this._event ??= ScheduledEventBuilder();
  set event(ScheduledEventBuilder? event) => _$this._event = event;

  ReadEventResponseBuilder() {
    ReadEventResponse._defaults(this);
  }

  ReadEventResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _event = $v.event?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReadEventResponse other) {
    _$v = other as _$ReadEventResponse;
  }

  @override
  void update(void Function(ReadEventResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReadEventResponse build() => _build();

  _$ReadEventResponse _build() {
    _$ReadEventResponse _$result;
    try {
      _$result = _$v ??
          _$ReadEventResponse._(
            event: _event?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'event';
        _event?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ReadEventResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
