package com.mat.jamr.userservice.security.service.verify;

import com.mat.jamr.userservice.api.Email;
import com.mat.jamr.userservice.api.User;
import com.mat.jamr.userservice.api.VerifyUserResponse;
import com.mat.jamr.userservice.common.user.service.UserByEmailFetchingConsumer;
import com.mat.jamr.userservice.security.service.common.AccessTokenVerifier;
import com.mat.jamr.userservice.security.service.common.JwtService;
import com.mat.jamr.userservice.security.service.login.LoginSecurityContext;
import com.matjamr.commonutils.StrategyBasedConsumer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

import java.util.List;
import java.util.function.Consumer;
import java.util.function.Function;

@Configuration
public class VerifyBeanConfig {

    @Bean
    public Function<VerifySecurityContext, VerifyUserResponse> verifyUserStrategyBasedFlow(
            final Consumer<VerifySecurityContext> verifyUserVerifySecurityContext,
            final Consumer<VerifySecurityContext> userByEmailFetchingConsumerVerify,
            final Consumer<VerifySecurityContext> verifyUserResponseMapperImpl
    ) {
        return new StrategyBasedConsumer<>(List.of(
                verifyUserVerifySecurityContext,
                userByEmailFetchingConsumerVerify,
                verifyUserResponseMapperImpl
        ),
                VerifySecurityContext::verifyUserResponse);
    }

    @Bean
    public Consumer<VerifySecurityContext> userByEmailFetchingConsumerVerify(
            final DynamoDbTable<User> userTable,
            final DynamoDbTable<Email> emailTable
    ) {
        return new UserByEmailFetchingConsumer<>(userTable, emailTable);
    }

    @Bean
    public Consumer<VerifySecurityContext> verifyUserVerifySecurityContext(
            final JwtService accessTokenService
    ) {
        return new AccessTokenVerifier<>(accessTokenService);
    }
}
