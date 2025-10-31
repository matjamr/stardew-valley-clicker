package com.mat.jamr.apigateway.service.game.mapper;

import com.mat.jamr.externalapi.model.CreateEventRequest;
import com.mat.jamr.externalapi.model.CreateEventResponse;
import com.mat.jamr.externalapi.model.ReadEventResponse;
import com.mat.jamr.externalapi.model.ScheduledEvent;
import com.mat.jamr.gameservice.scheduler.api.TriggerEventRequest;
import com.mat.jamr.gameservice.scheduler.api.TriggerEventResponse;
import org.mapstruct.*;

import java.time.OffsetDateTime;

@Mapper(componentModel = "spring")
public interface EventApiMapper {

    @Mapping(target = "type", source = "type")
    TriggerEventRequest toGrpc(CreateEventRequest req);

    @Mapping(target = "id", source = "id")
    @Mapping(target = "completionTimestamp", source = "completionTimestamp")
    CreateEventResponse toExternal(TriggerEventResponse resp);

    default OffsetDateTime map(String value) {
        return OffsetDateTime.parse(value);
    }

    @Mapping(target = "event", source = ".")
    ReadEventResponse toExternal(com.mat.jamr.gameservice.scheduler.api.ScheduledEvent event, @Context String userId);

    @Mapping(target = "id", source = "event.id")
    @Mapping(target = "createdDate", source = "event.createdDate")
    @Mapping(target = "executionDate", source = "event.executionDate")
    @Mapping(target = "islandId", source = "event.islandId")
    @Mapping(target = "assetId", source = "event.assetId")
    @Mapping(target = "status", source = "event.status")
    @Mapping(target = "userId", source = "userId")
    ScheduledEvent mapScheduledEvent(com.mat.jamr.gameservice.scheduler.api.ScheduledEvent event, String userId);

    // Map external API EventRequestTriggerType to gRPC EventRequestTriggerType
    @ValueMappings({
        @ValueMapping(source = "UNKNOWN_TYPE", target = "UNKNOWN_TYPE"),
        @ValueMapping(source = "MINES_TYPE", target = "MINES_TYPE")
    })
    com.mat.jamr.gameservice.scheduler.api.EventRequestTriggerType mapEventType(
        com.mat.jamr.externalapi.model.EventRequestTriggerType type);
}
