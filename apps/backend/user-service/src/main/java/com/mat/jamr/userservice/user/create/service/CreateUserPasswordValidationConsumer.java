package com.mat.jamr.userservice.user.create.service;

import lombok.extern.slf4j.Slf4j;

import java.util.function.Consumer;

/**
 * Validates password requirements for user creation.
 * Ensures password meets security standards before user is created.
 */
@Slf4j
public class CreateUserPasswordValidationConsumer implements Consumer<CreateUserContext> {

    private static final int MIN_PASSWORD_LENGTH = 8;
    private static final int MAX_PASSWORD_LENGTH = 100;

    @Override
    public void accept(CreateUserContext context) {
        var saveUserRequest = context.getSaveUserRequest();
        var password = saveUserRequest.getPassword();

        if (password == null || password.isEmpty()) {
            log.error("Password is required for user creation");
            throw new IllegalArgumentException("Password is required");
        }

        // Validate password length
        if (password.length() < MIN_PASSWORD_LENGTH) {
            log.error("Password is too short. Minimum length: {}", MIN_PASSWORD_LENGTH);
            throw new IllegalArgumentException(
                    String.format("Password must be at least %d characters long", MIN_PASSWORD_LENGTH)
            );
        }

        if (password.length() > MAX_PASSWORD_LENGTH) {
            log.error("Password is too long. Maximum length: {}", MAX_PASSWORD_LENGTH);
            throw new IllegalArgumentException(
                    String.format("Password must not exceed %d characters", MAX_PASSWORD_LENGTH)
            );
        }

        // Validate password complexity
        boolean hasUpperCase = password.chars().anyMatch(Character::isUpperCase);
        boolean hasLowerCase = password.chars().anyMatch(Character::isLowerCase);
        boolean hasDigit = password.chars().anyMatch(Character::isDigit);

        if (!hasUpperCase || !hasLowerCase || !hasDigit) {
            log.error("Password does not meet complexity requirements");
            throw new IllegalArgumentException(
                    "Password must contain at least one uppercase letter, one lowercase letter, and one digit"
            );
        }

        log.info("Password validation successful for user creation");
    }
}
