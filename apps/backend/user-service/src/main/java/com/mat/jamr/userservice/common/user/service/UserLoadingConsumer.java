package com.mat.jamr.userservice.common.user.service;

import com.mat.jamr.userservice.api.error.Error;
import com.mat.jamr.userservice.api.User;
import com.mat.jamr.userservice.api.error.UserServiceException;
import com.mat.jamr.userservice.common.user.template.UserAware;
import com.mat.jamr.userservice.common.user.template.UserIdAware;
import lombok.RequiredArgsConstructor;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

import java.util.Optional;
import java.util.function.Consumer;
import java.util.function.Function;

@RequiredArgsConstructor
public class UserLoadingConsumer<T extends UserIdAware & UserAware> implements Consumer<T> {

    private final DynamoDbTable<User> userTable;
    private final Function<String, Optional<User>> optionalUserByEmailExtractor;

    @Override
    public void accept(T t) {

        Optional.ofNullable(t.getUser())
                .filter(user -> optionalUserByEmailExtractor.apply(user.getEmail()).isEmpty())
                .map(user -> userTable.getItem(r -> r.key(k -> k.partitionValue(t.getUserId()))))
                .ifPresentOrElse(t::setUser, () -> {
                    throw new UserServiceException(Error.USER_DOES_NOT_EXIST);
                });

    }
}
