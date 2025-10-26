package com.mat.jamr.gameservice.context;

import com.mat.jamr.gameservice.scheduler.api.ReadByIdParams;
import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class ReadEventContext implements EventAware, EventIdAware {
    private ReadByIdParams request;
    private com.mat.jamr.gameservice.scheduler.api.ScheduledEvent response;

    private com.mat.jamr.gameservice.api.db.ScheduledEvent dbEvent;

    @Override
    public com.mat.jamr.gameservice.api.db.ScheduledEvent getEvent() {
        return dbEvent;
    }

    @Override
    public void setEvent(com.mat.jamr.gameservice.api.db.ScheduledEvent event) {
        this.dbEvent = event;
    }

    @Override
    public String getEventId() {
        return request.getId();
    }
}
