package com.mat.jamr.userservice.common.user.service;

import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBMapper;
import com.mat.jamr.userservice.api.Error;
import com.mat.jamr.userservice.api.User;
import com.mat.jamr.userservice.api.UserServiceException;
import com.mat.jamr.userservice.common.user.template.UserAware;
import com.mat.jamr.userservice.common.user.template.UserIdAware;
import lombok.RequiredArgsConstructor;

import java.util.Optional;
import java.util.UUID;
import java.util.function.Consumer;

@RequiredArgsConstructor
public class UserLoadingConsumer<T extends UserIdAware & UserAware> implements Consumer<T> {

    private final DynamoDBMapper dynamoDbMapper;

    @Override
    public void accept(T t) {
        Optional.ofNullable(dynamoDbMapper.load(User.class, UUID.fromString(t.getUserId())))
                .ifPresentOrElse(t::setUser, () -> {
                    throw new UserServiceException(Error.USER_ALREADY_EXISTS);
                });

    }
}
