package com.mat.jamr.gameservice.service.event.create.consumers;

import com.mat.jamr.gameservice.api.db.ScheduledEvent;
import com.mat.jamr.gameservice.context.TriggerEventContext;

import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.UUID;
import java.util.function.Consumer;

public class BuildScheduledEventConsumer implements Consumer<TriggerEventContext> {
    private static final long DEFAULT_DURATION_SECONDS = 5; // minimal viable, can be adjusted per type

    @Override
    public void accept(TriggerEventContext context) {
        var req = context.getRequest();
        var now = Instant.now();
        var execution = now.plus(DEFAULT_DURATION_SECONDS, ChronoUnit.SECONDS);

        ScheduledEvent event = new ScheduledEvent();
        event.setId(UUID.randomUUID().toString());
        event.setCreatedDate(now.toString());
        event.setExecutionDate(execution.toString());
        event.setIslandId(req.getIslandId());
        // Map resourceId to assetId for now
        event.setAssetId(req.getResourceId());
        event.setStatus("PENDING");
        event.setUserId(req.getUserId());

        context.setEvent(event);
    }
}
