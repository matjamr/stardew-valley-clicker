// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_asset_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateAssetRequest extends CreateAssetRequest {
  @override
  final AssetType type;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? content;

  factory _$CreateAssetRequest(
          [void Function(CreateAssetRequestBuilder)? updates]) =>
      (CreateAssetRequestBuilder()..update(updates))._build();

  _$CreateAssetRequest._(
      {required this.type, required this.name, this.description, this.content})
      : super._();
  @override
  CreateAssetRequest rebuild(
          void Function(CreateAssetRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateAssetRequestBuilder toBuilder() =>
      CreateAssetRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateAssetRequest &&
        type == other.type &&
        name == other.name &&
        description == other.description &&
        content == other.content;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateAssetRequest')
          ..add('type', type)
          ..add('name', name)
          ..add('description', description)
          ..add('content', content))
        .toString();
  }
}

class CreateAssetRequestBuilder
    implements Builder<CreateAssetRequest, CreateAssetRequestBuilder> {
  _$CreateAssetRequest? _$v;

  AssetType? _type;
  AssetType? get type => _$this._type;
  set type(AssetType? type) => _$this._type = type;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  CreateAssetRequestBuilder() {
    CreateAssetRequest._defaults(this);
  }

  CreateAssetRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _name = $v.name;
      _description = $v.description;
      _content = $v.content;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateAssetRequest other) {
    _$v = other as _$CreateAssetRequest;
  }

  @override
  void update(void Function(CreateAssetRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateAssetRequest build() => _build();

  _$CreateAssetRequest _build() {
    final _$result = _$v ??
        _$CreateAssetRequest._(
          type: BuiltValueNullFieldError.checkNotNull(
              type, r'CreateAssetRequest', 'type'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'CreateAssetRequest', 'name'),
          description: description,
          content: content,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
