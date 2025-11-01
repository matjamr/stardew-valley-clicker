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

import 'package:stardew_valley_api/src/model/action_type.dart';
import 'package:stardew_valley_api/src/model/animal_pen.dart';
import 'package:stardew_valley_api/src/model/asset.dart';
import 'package:stardew_valley_api/src/model/asset_type.dart';
import 'package:stardew_valley_api/src/model/barn.dart';
import 'package:stardew_valley_api/src/model/create_asset_request.dart';
import 'package:stardew_valley_api/src/model/create_asset_response.dart';
import 'package:stardew_valley_api/src/model/create_event_request.dart';
import 'package:stardew_valley_api/src/model/create_event_response.dart';
import 'package:stardew_valley_api/src/model/create_island_request.dart';
import 'package:stardew_valley_api/src/model/create_island_response.dart';
import 'package:stardew_valley_api/src/model/crop_plot.dart';
import 'package:stardew_valley_api/src/model/decoration.dart';
import 'package:stardew_valley_api/src/model/energy_info.dart';
import 'package:stardew_valley_api/src/model/error.dart';
import 'package:stardew_valley_api/src/model/event_request_trigger_type.dart';
import 'package:stardew_valley_api/src/model/farm.dart';
import 'package:stardew_valley_api/src/model/fishing_area.dart';
import 'package:stardew_valley_api/src/model/fishing_spot.dart';
import 'package:stardew_valley_api/src/model/island.dart';
import 'package:stardew_valley_api/src/model/island_variant.dart';
import 'package:stardew_valley_api/src/model/login_user_request.dart';
import 'package:stardew_valley_api/src/model/login_user_response.dart';
import 'package:stardew_valley_api/src/model/mine_level.dart';
import 'package:stardew_valley_api/src/model/mine_tile.dart';
import 'package:stardew_valley_api/src/model/mines.dart';
import 'package:stardew_valley_api/src/model/on_click_action.dart';
import 'package:stardew_valley_api/src/model/read_asset_response.dart';
import 'package:stardew_valley_api/src/model/read_event_response.dart';
import 'package:stardew_valley_api/src/model/read_island_response.dart';
import 'package:stardew_valley_api/src/model/refresh_token_request.dart';
import 'package:stardew_valley_api/src/model/refresh_token_response.dart';
import 'package:stardew_valley_api/src/model/resource_reward.dart';
import 'package:stardew_valley_api/src/model/retrieve_user_request.dart';
import 'package:stardew_valley_api/src/model/retrieve_user_response.dart';
import 'package:stardew_valley_api/src/model/reward_info.dart';
import 'package:stardew_valley_api/src/model/save_user_request.dart';
import 'package:stardew_valley_api/src/model/save_user_response.dart';
import 'package:stardew_valley_api/src/model/scheduled_event.dart';
import 'package:stardew_valley_api/src/model/storage.dart';
import 'package:stardew_valley_api/src/model/timer_info.dart';
import 'package:stardew_valley_api/src/model/verify_user_request.dart';
import 'package:stardew_valley_api/src/model/verify_user_response.dart';

part 'serializers.g.dart';

@SerializersFor([
  ActionType,
  AnimalPen,
  Asset,
  AssetType,
  Barn,
  CreateAssetRequest,
  CreateAssetResponse,
  CreateEventRequest,
  CreateEventResponse,
  CreateIslandRequest,
  CreateIslandResponse,
  CropPlot,
  Decoration,
  EnergyInfo,
  Error,
  EventRequestTriggerType,
  Farm,
  FishingArea,
  FishingSpot,
  Island,
  IslandVariant,
  LoginUserRequest,
  LoginUserResponse,
  MineLevel,
  MineTile,
  Mines,
  OnClickAction,
  ReadAssetResponse,
  ReadEventResponse,
  ReadIslandResponse,
  RefreshTokenRequest,
  RefreshTokenResponse,
  ResourceReward,
  RetrieveUserRequest,
  RetrieveUserResponse,
  RewardInfo,
  SaveUserRequest,
  SaveUserResponse,
  ScheduledEvent,
  Storage,
  TimerInfo,
  VerifyUserRequest,
  VerifyUserResponse,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(IslandVariant)]),
        () => ListBuilder<IslandVariant>(),
      )
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
