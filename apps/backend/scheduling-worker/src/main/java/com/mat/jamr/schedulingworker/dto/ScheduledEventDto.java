package com.mat.jamr.schedulingworker.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ScheduledEventDto {
    private String id;
    private String createdDate;
    private String executionDate;
    private String islandId;
    private String assetId;
    private String status;
    private String userId;
}
