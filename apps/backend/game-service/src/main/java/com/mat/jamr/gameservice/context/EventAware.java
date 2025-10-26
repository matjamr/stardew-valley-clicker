package com.mat.jamr.gameservice.context;

import com.mat.jamr.gameservice.api.db.ScheduledEvent;

public interface EventAware {
    ScheduledEvent getEvent();
    void setEvent(ScheduledEvent event);
}
