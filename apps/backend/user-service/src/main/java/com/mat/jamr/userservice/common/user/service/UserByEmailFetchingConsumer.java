package com.mat.jamr.userservice.common.user.service;

import com.mat.jamr.userservice.api.User;
import com.mat.jamr.userservice.common.user.template.EmailAware;
import com.mat.jamr.userservice.common.user.template.UserAware;
import lombok.RequiredArgsConstructor;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

import java.util.function.Consumer;

@RequiredArgsConstructor
public class UserByEmailFetchingConsumer<T extends EmailAware & UserAware> implements Consumer<T> {
    private final DynamoDbTable<User> dynamoDbTable;

    @Override
    public void accept(T t) {
        dynamoDbTable.getItem(r -> r.key(k -> k.sortValue(t.getEmail())));
    }
}
