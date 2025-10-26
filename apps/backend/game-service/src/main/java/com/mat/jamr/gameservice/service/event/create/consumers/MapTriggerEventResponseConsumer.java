package com.mat.jamr.gameservice.service.event.create.consumers;

import com.mat.jamr.gameservice.context.TriggerEventContext;
import com.mat.jamr.gameservice.service.common.mapper.ScheduledEventMapper;
import lombok.RequiredArgsConstructor;

import java.util.function.Consumer;

@RequiredArgsConstructor
public class MapTriggerEventResponseConsumer implements Consumer<TriggerEventContext> {

    private final ScheduledEventMapper scheduledEventMapper;

    @Override
    public void accept(TriggerEventContext context) {
        var response = scheduledEventMapper.toTriggerEventResponse(context.getEvent());
        context.setResponse(response);
    }
}
