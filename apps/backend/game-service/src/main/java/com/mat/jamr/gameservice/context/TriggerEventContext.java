package com.mat.jamr.gameservice.context;

import com.mat.jamr.gameservice.api.db.ScheduledEvent;
import com.mat.jamr.gameservice.scheduler.api.TriggerEventRequest;
import com.mat.jamr.gameservice.scheduler.api.TriggerEventResponse;
import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true, prefix = "with")
public class TriggerEventContext implements EventAware {
    private TriggerEventRequest request;
    private TriggerEventResponse response;

    private ScheduledEvent event;

    public TriggerEventRequest getRequest() {
        return request;
    }

    public void setRequest(TriggerEventRequest request) {
        this.request = request;
    }

    public TriggerEventContext withRequest(TriggerEventRequest request) {
        this.request = request;
        return this;
    }

    public TriggerEventResponse getResponse() {
        return response;
    }

    public void setResponse(TriggerEventResponse response) {
        this.response = response;
    }

    public ScheduledEvent getEvent() {
        return event;
    }

    public void setEvent(ScheduledEvent event) {
        this.event = event;
    }
}
