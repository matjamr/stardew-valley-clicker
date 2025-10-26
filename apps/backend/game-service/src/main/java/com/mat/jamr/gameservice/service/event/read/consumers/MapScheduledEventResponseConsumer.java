package com.mat.jamr.gameservice.service.event.read.consumers;

import com.mat.jamr.gameservice.context.ReadEventContext;
import com.mat.jamr.gameservice.service.common.mapper.ScheduledEventMapper;
import lombok.RequiredArgsConstructor;

import java.util.function.Consumer;

@RequiredArgsConstructor
public class MapScheduledEventResponseConsumer implements Consumer<ReadEventContext> {

    private final ScheduledEventMapper scheduledEventMapper;

    @Override
    public void accept(ReadEventContext context) {
        var response = scheduledEventMapper.toProto(context.getEvent());
        context.setResponse(response);
    }
}
