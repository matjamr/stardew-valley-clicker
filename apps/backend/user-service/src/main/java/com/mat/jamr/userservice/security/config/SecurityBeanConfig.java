package com.mat.jamr.userservice.security.config;

import com.mat.jamr.userservice.security.service.common.JwtService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.util.function.Consumer;

@RequiredArgsConstructor
@Configuration
public class SecurityBeanConfig {

    @Bean
    UserDetailsService userDetailsService(
    ) {
        return username -> null;
    }

    @Bean
    BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

//    @Bean
//    AuthenticationManager authenticationManager(AuthenticationConfiguration config) throws Exception {
//        return config.getAuthenticationManager();
//    }

    @Bean
    AuthenticationProvider authenticationProvider(
            final UserDetailsService userDetailsService
    ) {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();

        authProvider.setUserDetailsService(userDetailsService);
        authProvider.setPasswordEncoder(passwordEncoder());

        return authProvider;
    }

    @Bean
    JwtService accessTokenService(
            @Value("${security.jwt.access.secret-key}") String secretKey,
            @Value("${security.jwt.access.expiration-time}") long jwtExpiration
    ) {
        return new JwtService(secretKey, jwtExpiration);
    }

    @Bean
    JwtService refreshTokenService(
            @Value("${security.jwt.refresh.secret-key}") String secretKey,
            @Value("${security.jwt.refresh.expiration-time}") long jwtExpiration
    ) {
        return new JwtService(secretKey, jwtExpiration);
    }
}
