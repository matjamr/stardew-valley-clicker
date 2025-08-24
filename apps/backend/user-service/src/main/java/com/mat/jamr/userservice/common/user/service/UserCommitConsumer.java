package com.mat.jamr.userservice.common.user.service;


import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBMapper;
import com.mat.jamr.userservice.api.User;
import com.mat.jamr.userservice.common.user.template.UserAware;
import lombok.RequiredArgsConstructor;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

import java.util.function.Consumer;

@RequiredArgsConstructor
public class UserCommitConsumer<T extends UserAware> implements Consumer<T> {

    private final DynamoDbTable<User> userTable;

    @Override
    public void accept(T context) {
        userTable.putItem(context.getUser());
    }
}
