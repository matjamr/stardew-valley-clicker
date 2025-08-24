package com.mat.jamr.userservice.user.create.service;


import com.mat.jamr.userservice.api.User;
import com.mat.jamr.userservice.common.user.template.UserAware;
import lombok.RequiredArgsConstructor;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbEnhancedClient;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;
import software.amazon.awssdk.enhanced.dynamodb.Expression;
import software.amazon.awssdk.enhanced.dynamodb.model.TransactPutItemEnhancedRequest;
import software.amazon.awssdk.enhanced.dynamodb.model.TransactWriteItemsEnhancedRequest;
import software.amazon.awssdk.services.dynamodb.model.TransactionCanceledException;

import java.util.function.Consumer;

@RequiredArgsConstructor
public class CreateUserCommitConsumer<T extends UserAware> implements Consumer<T> {

    private final DynamoDbTable<User> userTable;
    private final DynamoDbEnhancedClient dynamoDbEnhancedClient;

    @Override
    public void accept(T context) {
        TransactWriteItemsEnhancedRequest transactWriteRequest = TransactWriteItemsEnhancedRequest.builder()
                .addPutItem(userTable, TransactPutItemEnhancedRequest.builder(User.class)
                        .conditionExpression(Expression.builder()
                                .expression("attribute_not_exists(id)")
                                .build())
                        .item(buildUniqueEmail(context.getUser()))
                        .returnValuesOnConditionCheckFailure("Email exists")
                        .build())
                .addPutItem(userTable, TransactPutItemEnhancedRequest.builder(User.class)
                        .conditionExpression(Expression.builder()
                                .expression("attribute_not_exists(id)")
                                .build())
                        .item(context.getUser())
                        .returnValuesOnConditionCheckFailure("User exists")
                        .build())
                .build();

        try {
            var ret = dynamoDbEnhancedClient.transactWriteItems(transactWriteRequest);
        } catch (TransactionCanceledException e) {
            System.err.println("Transaction was canceled. Items were not written. Details:");
            e.cancellationReasons().forEach(reason ->
                    System.err.println("  Code: " + reason.code() + ", Message: " + reason.message())
            );
            throw new RuntimeException("Transactional write failed.", e);
        }
    }

    private User buildUniqueEmail(User user) {
        var usr = new User();
        usr.setId("email#" + user.getEmail());

        return usr;
    }
}
