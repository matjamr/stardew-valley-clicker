package com.mat.jamr.gameservice.service.common.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface ScheduledEventMapper {

    @Mapping(target = "id", source = "id")
    @Mapping(target = "createdDate", source = "createdDate", defaultValue = "")
    @Mapping(target = "executionDate", source = "executionDate", defaultValue = "")
    @Mapping(target = "islandId", source = "islandId", defaultValue = "")
    @Mapping(target = "assetId", source = "assetId", defaultValue = "")
    @Mapping(target = "status", source = "status", defaultValue = "")
    com.mat.jamr.gameservice.scheduler.api.ScheduledEvent toProto(com.mat.jamr.gameservice.api.db.ScheduledEvent s);

    @Mapping(target = "id", source = "id")
    @Mapping(target = "completionTimestamp", source = "executionDate", defaultValue = "")
    com.mat.jamr.gameservice.scheduler.api.TriggerEventResponse toTriggerEventResponse(com.mat.jamr.gameservice.api.db.ScheduledEvent s);
}
