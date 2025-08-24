package com.mat.jamr.userservice.user.retrieve;

import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBMapper;
import com.mat.jamr.userservice.api.RetrieveUserResponse;
import com.mat.jamr.userservice.api.User;
import com.mat.jamr.userservice.common.user.service.UserLoadingConsumer;
import com.mat.jamr.userservice.user.retrieve.service.RetrieveUserContext;
import com.matjamr.commonutils.StrategyBasedConsumer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbIndex;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

import java.util.List;
import java.util.Optional;
import java.util.function.Consumer;
import java.util.function.Function;

@Configuration
public class RetrieveUserBeanConfig {

    @Bean
    public Function<RetrieveUserContext, RetrieveUserResponse> retrieveUserStrategyBasedFlow(
            final Consumer<RetrieveUserContext> userLoadingConsumer,
            final Consumer<RetrieveUserContext> userRetrieveResponseMapperImpl
    ) {
        return new StrategyBasedConsumer<>(List.of(userLoadingConsumer, userRetrieveResponseMapperImpl),
                RetrieveUserContext::getRetrieveUserResponse);
    }

    @Bean
    Consumer<RetrieveUserContext> userLoadingConsumer(
            final DynamoDbTable<User> userTable,
            final Function<String, Optional<User>> optionalUserByEmailExtractor
            ) {
        return new UserLoadingConsumer<>(userTable, optionalUserByEmailExtractor);
    }
}
