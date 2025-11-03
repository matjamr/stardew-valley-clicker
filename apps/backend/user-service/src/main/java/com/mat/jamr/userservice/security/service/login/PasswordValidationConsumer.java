package com.mat.jamr.userservice.security.service.login;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.function.Consumer;

@Slf4j
@RequiredArgsConstructor
public class PasswordValidationConsumer implements Consumer<LoginSecurityContext> {

    private final PasswordEncoder passwordEncoder;

    @Override
    public void accept(LoginSecurityContext context) {
        var user = context.getUser();
        var inputPassword = context.getPassword();

        if (user == null) {
            log.error("User not found for email: {}", context.getEmail());
            throw new BadCredentialsException("Invalid email or password");
        }

        if (user.getPassword() == null || user.getPassword().isEmpty()) {
            log.error("User {} has no password set", user.getEmail());
            throw new BadCredentialsException("Invalid email or password");
        }

        // Validate password using BCrypt
        if (!passwordEncoder.matches(inputPassword, user.getPassword())) {
            log.error("Invalid password for user: {}", user.getEmail());
            throw new BadCredentialsException("Invalid email or password");
        }

        log.info("Password validated successfully for user: {}", user.getEmail());
    }
}
