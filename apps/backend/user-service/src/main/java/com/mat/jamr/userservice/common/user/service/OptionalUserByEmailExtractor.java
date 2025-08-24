package com.mat.jamr.userservice.common.user.service;

import com.mat.jamr.userservice.api.User;
import lombok.RequiredArgsConstructor;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbIndex;
import software.amazon.awssdk.enhanced.dynamodb.model.QueryConditional;

import java.util.Optional;
import java.util.function.Function;

@RequiredArgsConstructor
public class OptionalUserByEmailExtractor implements Function<String, Optional<User>> {

    private final DynamoDbIndex<User> emailIndex;

    @Override
    public Optional<User> apply(String email) {
        return emailIndex.query(r -> r.queryConditional(QueryConditional.keyEqualTo(k -> k.partitionValue(email)))).stream().flatMap(p -> p.items().stream()).findFirst();
    }
}
