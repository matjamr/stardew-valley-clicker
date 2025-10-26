package com.mat.jamr.gameservice.service.event.read.consumers;

import com.mat.jamr.gameservice.api.db.ScheduledEvent;
import com.mat.jamr.gameservice.api.error.GameServiceException;
import com.mat.jamr.gameservice.context.EventAware;
import com.mat.jamr.gameservice.context.EventIdAware;
import lombok.RequiredArgsConstructor;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

import java.util.Optional;
import java.util.function.Consumer;

import static com.mat.jamr.gameservice.api.error.Error.ASSET_NOT_FOUND;

@RequiredArgsConstructor
public class LoadScheduledEventFromDbConsumer<T extends EventIdAware & EventAware> implements Consumer<T> {

    private final DynamoDbTable<ScheduledEvent> eventsTable;

    @Override
    public void accept(T context) {
        Optional.ofNullable(context.getEventId())
                .map(id -> eventsTable.getItem(r -> r.key(k -> k.partitionValue(id))))
                .ifPresentOrElse(context::setEvent, () -> {
                    throw new GameServiceException(ASSET_NOT_FOUND);
                });
    }
}
