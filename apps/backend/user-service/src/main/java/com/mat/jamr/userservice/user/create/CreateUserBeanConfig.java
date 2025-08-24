package com.mat.jamr.userservice.user.create;

import com.mat.jamr.userservice.api.Email;
import com.mat.jamr.userservice.api.SaveUserResponse;
import com.mat.jamr.userservice.api.User;
import com.mat.jamr.userservice.user.create.service.CreateUserCommitConsumer;
import com.mat.jamr.userservice.user.create.service.CreateUserContext;
import com.matjamr.commonutils.StrategyBasedConsumer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbEnhancedClient;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

import java.util.List;
import java.util.function.Consumer;
import java.util.function.Function;

@Configuration
public class CreateUserBeanConfig {

    @Bean
    public Function<CreateUserContext, SaveUserResponse> createUserStrategyBasedFlow(
            final Consumer<CreateUserContext> userCommitConsumer,
            final Consumer<CreateUserContext> userCreateResponseMapperImpl,
            final Consumer<CreateUserContext> userCreateRequestMapperImpl
    ) {
        return new StrategyBasedConsumer<>(List.of(userCreateRequestMapperImpl, userCommitConsumer, userCreateResponseMapperImpl),
                CreateUserContext::getSaveUserResponse);
    }

    @Bean
    public Consumer<CreateUserContext> userCommitConsumer(
            final DynamoDbTable<User> userTable,
            final DynamoDbTable<Email> emailTable,
            final DynamoDbEnhancedClient dynamoDbEnhancedClient
    ) {
        return new CreateUserCommitConsumer<>(userTable, emailTable, dynamoDbEnhancedClient);
    }
}
