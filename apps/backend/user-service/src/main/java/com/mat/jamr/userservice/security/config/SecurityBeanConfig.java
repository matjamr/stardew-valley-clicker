package com.mat.jamr.userservice.security.config;

import com.mat.jamr.userservice.api.SecuredUser;
import com.mat.jamr.userservice.api.User;
import com.mat.jamr.userservice.api.error.Error;
import com.mat.jamr.userservice.api.error.UserServiceException;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.util.Optional;
import java.util.function.Function;

@RequiredArgsConstructor
@Configuration
public class SecurityBeanConfig {

    @Bean
    UserDetailsService userDetailsService(
            final Function<String, Optional<User>> optionalUserByEmailExtractor
    ) {
        return username -> optionalUserByEmailExtractor.apply(username)
                .map(SecuredUser::new)
                .orElseThrow(() -> new UserServiceException(Error.USER_DOES_NOT_EXIST));
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
}
