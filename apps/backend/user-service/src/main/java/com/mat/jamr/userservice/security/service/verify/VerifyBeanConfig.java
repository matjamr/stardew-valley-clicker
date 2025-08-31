package com.mat.jamr.userservice.security.service.verify;

import com.mat.jamr.userservice.api.LoginUserResponse;
import com.mat.jamr.userservice.api.VerifyUserResponse;
import com.mat.jamr.userservice.security.service.common.AccessTokenVerifier;
import com.mat.jamr.userservice.security.service.common.JwtService;
import com.mat.jamr.userservice.security.service.login.LoginSecurityContext;
import com.matjamr.commonutils.StrategyBasedConsumer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.List;
import java.util.function.Consumer;
import java.util.function.Function;

@Configuration
public class VerifyBeanConfig {

    @Bean
    public Function<VerifySecurityContext, VerifyUserResponse> verifyUserStrategyBasedFlow(
            final Consumer<VerifySecurityContext> verifyUserVerifySecurityContext
    ) {
        return new StrategyBasedConsumer<>(List.of(
                verifyUserVerifySecurityContext
        ),
                (__) -> VerifyUserResponse.getDefaultInstance());
    }


    @Bean
    public Consumer<VerifySecurityContext> verifyUserVerifySecurityContext(
            final JwtService accessTokenService
    ) {
        return new AccessTokenVerifier<>(accessTokenService);
    }
}
