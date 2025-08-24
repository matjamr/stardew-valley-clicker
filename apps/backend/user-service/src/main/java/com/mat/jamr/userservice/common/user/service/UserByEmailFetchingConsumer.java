package com.mat.jamr.userservice.common.user.service;

import com.mat.jamr.userservice.api.Email;
import com.mat.jamr.userservice.api.User;
import com.mat.jamr.userservice.api.error.Error;
import com.mat.jamr.userservice.api.error.UserServiceException;
import com.mat.jamr.userservice.common.user.template.EmailAware;
import com.mat.jamr.userservice.common.user.template.UserAware;
import lombok.RequiredArgsConstructor;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

import java.util.function.Consumer;

@RequiredArgsConstructor
public class UserByEmailFetchingConsumer<T extends EmailAware & UserAware> implements Consumer<T> {
    private final DynamoDbTable<User> userTable;
    private final DynamoDbTable<Email> emailTable;

    @Override
    public void accept(T t) {
        var email = emailTable.getItem(r -> r.key(k -> k.partitionValue("email#" + t.getEmail())));

        if (email == null) {
            throw new UserServiceException(Error.EMAIL_DOES_NOT_EXIST);
        }

        var user = userTable.getItem(r -> r.key(k -> k.partitionValue(email.getUserId())));
        t.setUser(user);
    }
}
