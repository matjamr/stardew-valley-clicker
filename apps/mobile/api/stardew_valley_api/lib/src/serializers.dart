//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:stardew_valley_api/src/date_serializer.dart';
import 'package:stardew_valley_api/src/model/date.dart';

import 'package:stardew_valley_api/src/model/asset.dart';
import 'package:stardew_valley_api/src/model/asset_type.dart';
import 'package:stardew_valley_api/src/model/create_asset_request.dart';
import 'package:stardew_valley_api/src/model/create_asset_response.dart';
import 'package:stardew_valley_api/src/model/create_island_request.dart';
import 'package:stardew_valley_api/src/model/create_island_response.dart';
import 'package:stardew_valley_api/src/model/error.dart';
import 'package:stardew_valley_api/src/model/island.dart';
import 'package:stardew_valley_api/src/model/island_variant.dart';
import 'package:stardew_valley_api/src/model/login_user_request.dart';
import 'package:stardew_valley_api/src/model/login_user_response.dart';
import 'package:stardew_valley_api/src/model/read_asset_response.dart';
import 'package:stardew_valley_api/src/model/read_island_response.dart';
import 'package:stardew_valley_api/src/model/refresh_token_request.dart';
import 'package:stardew_valley_api/src/model/refresh_token_response.dart';
import 'package:stardew_valley_api/src/model/retrieve_user_request.dart';
import 'package:stardew_valley_api/src/model/retrieve_user_response.dart';
import 'package:stardew_valley_api/src/model/save_user_request.dart';
import 'package:stardew_valley_api/src/model/save_user_response.dart';
import 'package:stardew_valley_api/src/model/terrain.dart';
import 'package:stardew_valley_api/src/model/terrain_tile.dart';
import 'package:stardew_valley_api/src/model/verify_user_request.dart';
import 'package:stardew_valley_api/src/model/verify_user_response.dart';

part 'serializers.g.dart';

@SerializersFor([
  Asset,
  AssetType,
  CreateAssetRequest,
  CreateAssetResponse,
  CreateIslandRequest,
  CreateIslandResponse,
  Error,
  Island,
  IslandVariant,
  LoginUserRequest,
  LoginUserResponse,
  ReadAssetResponse,
  ReadIslandResponse,
  RefreshTokenRequest,
  RefreshTokenResponse,
  RetrieveUserRequest,
  RetrieveUserResponse,
  SaveUserRequest,
  SaveUserResponse,
  Terrain,
  TerrainTile,
  VerifyUserRequest,
  VerifyUserResponse,
])
Serializers serializers = (_$serializers.toBuilder()
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
