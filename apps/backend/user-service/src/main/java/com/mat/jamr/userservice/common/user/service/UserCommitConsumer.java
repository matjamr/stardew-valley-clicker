package com.mat.jamr.userservice.common.user.service;


import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBMapper;
import com.mat.jamr.userservice.common.user.template.UserAware;
import lombok.RequiredArgsConstructor;

import java.util.function.Consumer;

@RequiredArgsConstructor
public class UserCommitConsumer<T extends UserAware> implements Consumer<T> {

    private final DynamoDBMapper dynamoDBMapper;

    @Override
    public void accept(T context) {
        dynamoDBMapper.save(context.getUser());
    }
}
