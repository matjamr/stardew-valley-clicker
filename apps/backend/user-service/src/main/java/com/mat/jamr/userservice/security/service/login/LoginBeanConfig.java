package com.mat.jamr.userservice.security.service.login;

import com.mat.jamr.userservice.api.Email;
import com.mat.jamr.userservice.api.LoginUserResponse;
import com.mat.jamr.userservice.api.User;
import com.mat.jamr.userservice.common.user.service.UserByEmailFetchingConsumer;
import com.mat.jamr.userservice.security.service.common.JwtService;
import com.mat.jamr.userservice.security.service.common.TokenGenerator;
import com.matjamr.commonutils.StrategyBasedConsumer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

import java.util.List;
import java.util.function.Consumer;
import java.util.function.Function;

@Configuration
public class LoginBeanConfig {

    @Bean
    public Function<LoginSecurityContext, LoginUserResponse> loginUserStrategyBasedFlow(
            Consumer<LoginSecurityContext> userByEmailFetchingConsumer,
            Consumer<LoginSecurityContext> loginUserTokenGenerator,
            Consumer<LoginSecurityContext> loginUserResponseMapper
    ) {
        return new StrategyBasedConsumer<>(List.of(
                userByEmailFetchingConsumer,
                loginUserTokenGenerator,
                loginUserResponseMapper
        ),
                LoginSecurityContext::getLoginUserResponse);
    }

    @Bean
    public Consumer<LoginSecurityContext> userByEmailFetchingConsumer(
            final DynamoDbTable<User> userTable,
            final DynamoDbTable<Email> emailTable
    ) {
        return new UserByEmailFetchingConsumer<>(userTable, emailTable);
    }

    @Bean
    public Consumer<LoginSecurityContext> loginUserTokenGenerator(
            final JwtService accessTokenService,
            final JwtService refreshTokenService
    ) {
        return new TokenGenerator<>(accessTokenService, refreshTokenService);
    }

    @Bean
    public Consumer<LoginSecurityContext> loginUserResponseMapper() {
        return new LoginUserResponseMapper();
    }
}
