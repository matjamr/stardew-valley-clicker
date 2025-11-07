package com.mat.jamr.userservice.security.service.login;

import com.mat.jamr.userservice.api.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

import java.util.function.Consumer;

/**
 * Updates the user's device token in the database during login.
 * This token is used for Firebase Cloud Messaging push notifications.
 */
@Slf4j
@RequiredArgsConstructor
public class DeviceTokenUpdateConsumer implements Consumer<LoginSecurityContext> {

    private final DynamoDbTable<User> userTable;

    @Override
    public void accept(LoginSecurityContext context) {
        var deviceToken = context.getLoginUserRequest().getDeviceToken();
        var user = context.getUser();

        log.info("=== DEVICE TOKEN UPDATE ===");
        log.info("User ID: {}", user.getId());
        log.info("User email: {}", user.getEmail());
        log.info("Device token from request: {}", deviceToken);
        log.info("Device token is null: {}", deviceToken == null);
        log.info("Device token is empty: {}", deviceToken != null && deviceToken.isEmpty());

        if (deviceToken == null || deviceToken.isEmpty()) {
            log.warn("No device token provided for user: {}", user.getEmail());
            return;
        }

        log.info("Updating device token (first 20 chars): {}...", deviceToken.substring(0, Math.min(20, deviceToken.length())));

        // Update the user's device token
        // Use putItem instead of updateItem since we have the full user object
        user.setDeviceToken(deviceToken);
        userTable.putItem(user);

        log.info("Successfully updated device token for user: {}", user.getEmail());
        log.info("===========================");
    }
}
