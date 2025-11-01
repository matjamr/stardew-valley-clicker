package com.mat.jamr.gameservice.service.common.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.util.stream.Collectors;

@Mapper(componentModel = "spring", uses = {ProtobufStringMapper.class})
public interface AssetMapper {

    // DB -> Proto: ensure null/blank strings become "" to satisfy protobuf setters
    @Mapping(target = "id", source = "id", qualifiedByName = "toProto")
    @Mapping(target = "name", source = "name", qualifiedByName = "toProto")
    @Mapping(target = "description", source = "description", qualifiedByName = "toProto")
    @Mapping(target = "url", source = "url", qualifiedByName = "toProto")
    @Mapping(target = "onClickAction", expression = "java(mapOnClickActionToProto(asset.getOnClickAction()))")
    com.mat.jamr.gameservice.api.Asset map(com.mat.jamr.gameservice.api.db.Asset asset);

    // Proto -> DB: ignore empty strings by converting them to null
    @Mapping(target = "id", source = "id", qualifiedByName = "fromProto")
    @Mapping(target = "name", source = "name", qualifiedByName = "fromProto")
    @Mapping(target = "description", source = "description", qualifiedByName = "fromProto")
    @Mapping(target = "url", source = "url", qualifiedByName = "fromProto")
    @Mapping(target = "onClickAction", expression = "java(mapOnClickActionToDb(asset.getOnClickAction()))")
    com.mat.jamr.gameservice.api.db.Asset map(com.mat.jamr.gameservice.api.Asset asset);

    // OnClickAction mappings
    default com.mat.jamr.gameservice.api.OnClickAction mapOnClickActionToProto(com.mat.jamr.gameservice.api.db.OnClickAction db) {
        if (db == null) return null;

        var builder = com.mat.jamr.gameservice.api.OnClickAction.newBuilder();

        if (db.getActionType() != null) {
            builder.setActionType(com.mat.jamr.gameservice.api.ActionType.valueOf(db.getActionType()));
        }

        if (db.getTimerInfo() != null) {
            builder.setTimerInfo(mapTimerInfoToProto(db.getTimerInfo()));
        }

        if (db.getRewardInfo() != null) {
            builder.setRewardInfo(mapRewardInfoToProto(db.getRewardInfo()));
        }

        if (db.getEnergyInfo() != null) {
            builder.setEnergyInfo(mapEnergyInfoToProto(db.getEnergyInfo()));
        }

        return builder.build();
    }

    default com.mat.jamr.gameservice.api.db.OnClickAction mapOnClickActionToDb(com.mat.jamr.gameservice.api.OnClickAction proto) {
        if (proto == null) return null;

        var db = new com.mat.jamr.gameservice.api.db.OnClickAction();

        if (proto.getActionType() != null && proto.getActionType() != com.mat.jamr.gameservice.api.ActionType.UNRECOGNIZED) {
            db.setActionType(proto.getActionType().name());
        }

        if (proto.hasTimerInfo()) {
            db.setTimerInfo(mapTimerInfoToDb(proto.getTimerInfo()));
        }

        if (proto.hasRewardInfo()) {
            db.setRewardInfo(mapRewardInfoToDb(proto.getRewardInfo()));
        }

        if (proto.hasEnergyInfo()) {
            db.setEnergyInfo(mapEnergyInfoToDb(proto.getEnergyInfo()));
        }

        return db;
    }

    // TimerInfo mappings
    default com.mat.jamr.gameservice.api.TimerInfo mapTimerInfoToProto(com.mat.jamr.gameservice.api.db.TimerInfo db) {
        if (db == null) return null;

        var builder = com.mat.jamr.gameservice.api.TimerInfo.newBuilder();

        if (db.getDurationSeconds() != null) {
            builder.setDurationSeconds(db.getDurationSeconds());
        }

        if (db.getTimerId() != null && !db.getTimerId().isEmpty()) {
            builder.setTimerId(db.getTimerId());
        }

        return builder.build();
    }

    default com.mat.jamr.gameservice.api.db.TimerInfo mapTimerInfoToDb(com.mat.jamr.gameservice.api.TimerInfo proto) {
        if (proto == null) return null;

        var db = new com.mat.jamr.gameservice.api.db.TimerInfo();
        db.setDurationSeconds(proto.getDurationSeconds());

        if (proto.getTimerId() != null && !proto.getTimerId().isEmpty()) {
            db.setTimerId(proto.getTimerId());
        }

        return db;
    }

    // RewardInfo mappings
    default com.mat.jamr.gameservice.api.RewardInfo mapRewardInfoToProto(com.mat.jamr.gameservice.api.db.RewardInfo db) {
        if (db == null) return null;

        var builder = com.mat.jamr.gameservice.api.RewardInfo.newBuilder();

        if (db.getResources() != null) {
            builder.addAllResources(
                db.getResources().stream()
                    .map(this::mapResourceRewardToProto)
                    .collect(Collectors.toList())
            );
        }

        if (db.getXpGrant() != null) {
            builder.setXpGrant(db.getXpGrant());
        }

        return builder.build();
    }

    default com.mat.jamr.gameservice.api.db.RewardInfo mapRewardInfoToDb(com.mat.jamr.gameservice.api.RewardInfo proto) {
        if (proto == null) return null;

        var db = new com.mat.jamr.gameservice.api.db.RewardInfo();

        if (proto.getResourcesCount() > 0) {
            db.setResources(
                proto.getResourcesList().stream()
                    .map(this::mapResourceRewardToDb)
                    .collect(Collectors.toList())
            );
        }

        db.setXpGrant(proto.getXpGrant());

        return db;
    }

    // ResourceReward mappings
    default com.mat.jamr.gameservice.api.ResourceReward mapResourceRewardToProto(com.mat.jamr.gameservice.api.db.ResourceReward db) {
        if (db == null) return null;

        var builder = com.mat.jamr.gameservice.api.ResourceReward.newBuilder();

        if (db.getResourceId() != null && !db.getResourceId().isEmpty()) {
            builder.setResourceId(db.getResourceId());
        }

        if (db.getAmount() != null) {
            builder.setAmount(db.getAmount());
        }

        return builder.build();
    }

    default com.mat.jamr.gameservice.api.db.ResourceReward mapResourceRewardToDb(com.mat.jamr.gameservice.api.ResourceReward proto) {
        if (proto == null) return null;

        var db = new com.mat.jamr.gameservice.api.db.ResourceReward();

        if (proto.getResourceId() != null && !proto.getResourceId().isEmpty()) {
            db.setResourceId(proto.getResourceId());
        }

        db.setAmount(proto.getAmount());

        return db;
    }

    // EnergyInfo mappings
    default com.mat.jamr.gameservice.api.EnergyInfo mapEnergyInfoToProto(com.mat.jamr.gameservice.api.db.EnergyInfo db) {
        if (db == null) return null;

        return com.mat.jamr.gameservice.api.EnergyInfo.newBuilder()
            .setEnergyConsumption(db.getEnergyConsumption() != null ? db.getEnergyConsumption() : 0)
            .build();
    }

    default com.mat.jamr.gameservice.api.db.EnergyInfo mapEnergyInfoToDb(com.mat.jamr.gameservice.api.EnergyInfo proto) {
        if (proto == null) return null;

        var db = new com.mat.jamr.gameservice.api.db.EnergyInfo();
        db.setEnergyConsumption(proto.getEnergyConsumption());

        return db;
    }
}
