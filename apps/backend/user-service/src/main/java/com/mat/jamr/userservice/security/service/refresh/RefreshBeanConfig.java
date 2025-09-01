package com.mat.jamr.userservice.security.service.refresh;

import com.mat.jamr.userservice.api.Email;
import com.mat.jamr.userservice.api.RefreshTokenResponse;
import com.mat.jamr.userservice.api.User;
import com.mat.jamr.userservice.common.user.service.UserByEmailFetchingConsumer;
import com.mat.jamr.userservice.security.service.common.AccessTokenGenerator;
import com.mat.jamr.userservice.security.service.common.JwtService;
import com.mat.jamr.userservice.security.service.common.RefreshTokenVerifier;
import com.matjamr.commonutils.StrategyBasedConsumer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

import java.util.List;
import java.util.function.Consumer;
import java.util.function.Function;

@Configuration
public class RefreshBeanConfig {

    @Bean
    public Function<RefreshSecurityContext, RefreshTokenResponse> refreshUserStrategyBasedFlow(
            final Consumer<RefreshSecurityContext> refreshTokenVerifyRefreshContext,
            final Consumer<RefreshSecurityContext> userByEmailFetchingConsumerRefresh,
            final Consumer<RefreshSecurityContext> accessTokenGenerator,
            final Consumer<RefreshSecurityContext> refreshTokenResponseMapperImpl
    ) {
        return new StrategyBasedConsumer<>(List.of(
                refreshTokenVerifyRefreshContext,
                userByEmailFetchingConsumerRefresh,
                accessTokenGenerator,
                refreshTokenResponseMapperImpl
        ),
                RefreshSecurityContext::getRefreshTokenResponse);
    }

    @Bean
    public Consumer<RefreshSecurityContext> userByEmailFetchingConsumerRefresh(
            final DynamoDbTable<User> userTable,
            final DynamoDbTable<Email> emailTable
    ) {
        return new UserByEmailFetchingConsumer<>(userTable, emailTable);
    }

    @Bean
    public Consumer<RefreshSecurityContext> refreshTokenVerifyRefreshContext(
            final JwtService refreshTokenService
    ) {
        return new RefreshTokenVerifier<>(refreshTokenService);
    }

    @Bean
    public Consumer<RefreshSecurityContext> accessTokenGenerator(
            final JwtService accessTokenService
    ) {
        return new AccessTokenGenerator<>(accessTokenService);
    }
}
