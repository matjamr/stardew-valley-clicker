package com.mat.jamr.userservice.common.config;

import com.mat.jamr.userservice.common.security.TokenHolder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;

@Configuration
public class CommonBeanConfig {

    @Bean
    @Scope(scopeName = "grpcRequest", proxyMode = ScopedProxyMode.TARGET_CLASS)
    public TokenHolder tokenHolder() {
        return new TokenHolder();
    }
}
