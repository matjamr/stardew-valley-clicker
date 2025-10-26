package com.mat.jamr.gameservice.service.event.create.consumers;

import com.mat.jamr.gameservice.context.TriggerEventContext;

import java.util.Objects;
import java.util.function.Consumer;

public class ValidateTriggerEventConsumer implements Consumer<TriggerEventContext> {
    @Override
    public void accept(TriggerEventContext context) {
        var request = context.getRequest();
        if (request == null) {
            throw new IllegalArgumentException("TriggerEventRequest must not be null");
        }
        if (isBlank(request.getIslandId())) {
            throw new IllegalArgumentException("islandId must not be null or blank");
        }
        if (isBlank(request.getUserId())) {
            throw new IllegalArgumentException("userId must not be null or blank");
        }
        // type/resourceId can be optional depending on trigger type; keep minimal validation
    }

    private boolean isBlank(String s) { return s == null || s.isEmpty(); }
}
