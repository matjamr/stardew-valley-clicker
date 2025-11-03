package com.mat.jamr.userservice.security.config;

import com.mat.jamr.userservice.api.SecuredUser;
import com.mat.jamr.userservice.api.User;
import com.mat.jamr.userservice.security.service.common.JwtService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbIndex;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;
import software.amazon.awssdk.enhanced.dynamodb.Key;
import software.amazon.awssdk.enhanced.dynamodb.model.QueryConditional;

import java.util.function.Consumer;

@RequiredArgsConstructor
@Configuration
public class SecurityBeanConfig {

    private final DynamoDbTable<User> userTable;

    @Bean
    UserDetailsService userDetailsService() {
        return email -> {
            // Query DynamoDB using email (which is the sort key)
            // We need to scan or use a GSI since we're looking up by email
            var index = userTable.index("email-index");

            if (index != null) {
                var queryResults = index.query(
                    QueryConditional.keyEqualTo(Key.builder().partitionValue(email).build())
                );

                var page = queryResults.iterator().next();
                if (page.items().isEmpty()) {
                    throw new UsernameNotFoundException("User not found with email: " + email);
                }

                return new SecuredUser(page.items().get(0));
            } else {
                // Fallback: scan the table (not recommended for production)
                var scanResults = userTable.scan();
                for (var page : scanResults) {
                    for (var user : page.items()) {
                        if (email.equals(user.getEmail())) {
                            return new SecuredUser(user);
                        }
                    }
                }
                throw new UsernameNotFoundException("User not found with email: " + email);
            }
        };
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
