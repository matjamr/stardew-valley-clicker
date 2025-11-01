package com.mat.jamr.gameservice.api.db;

import com.mat.jamr.gameservice.api.ActionType;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbAttribute;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbBean;

import java.util.Optional;

@DynamoDbBean
public class OnClickAction {

    private ActionType actionType;
    private TimerInfo timerInfo;
    private RewardInfo rewardInfo;
    private EnergyInfo energyInfo;

    @DynamoDbAttribute("actionType")
    public String getActionType() {
        return Optional.ofNullable(actionType).map(Enum::name).orElse(null);
    }

    public void setActionType(String actionType) {
        this.actionType = actionType != null ? ActionType.valueOf(actionType) : null;
    }

    @DynamoDbAttribute("timerInfo")
    public TimerInfo getTimerInfo() {
        return timerInfo;
    }

    public void setTimerInfo(TimerInfo timerInfo) {
        this.timerInfo = timerInfo;
    }

    @DynamoDbAttribute("rewardInfo")
    public RewardInfo getRewardInfo() {
        return rewardInfo;
    }

    public void setRewardInfo(RewardInfo rewardInfo) {
        this.rewardInfo = rewardInfo;
    }

    @DynamoDbAttribute("energyInfo")
    public EnergyInfo getEnergyInfo() {
        return energyInfo;
    }

    public void setEnergyInfo(EnergyInfo energyInfo) {
        this.energyInfo = energyInfo;
    }
}
