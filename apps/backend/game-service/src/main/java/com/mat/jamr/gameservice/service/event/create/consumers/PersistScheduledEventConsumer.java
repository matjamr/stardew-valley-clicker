package com.mat.jamr.gameservice.service.event.create.consumers;

import com.mat.jamr.gameservice.context.TriggerEventContext;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

import java.util.function.Consumer;

public class PersistScheduledEventConsumer implements Consumer<TriggerEventContext> {

    private final DynamoDbTable<com.mat.jamr.gameservice.api.db.ScheduledEvent> eventsTable;

    public PersistScheduledEventConsumer(DynamoDbTable<com.mat.jamr.gameservice.api.db.ScheduledEvent> eventsTable) {
        this.eventsTable = eventsTable;
    }

    @Override
    public void accept(TriggerEventContext context) {
        var event = context.getEvent();
        eventsTable.putItem(event);
    }
}
