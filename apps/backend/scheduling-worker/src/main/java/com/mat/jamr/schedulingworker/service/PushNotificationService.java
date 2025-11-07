package com.mat.jamr.schedulingworker.service;

import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.Notification;
import com.mat.jamr.schedulingworker.dto.ScheduledEventDto;
import com.mat.jamr.schedulingworker.model.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;

@Slf4j
@Service
@RequiredArgsConstructor
public class PushNotificationService {

    private final FirebaseMessaging firebaseMessaging;
    private final DynamoDbTable<User> userTable;

    /**
     * Sends a push notification to the user that their event reward is ready to collect
     */
    public void sendEventReadyNotification(ScheduledEventDto event) {
        if (firebaseMessaging == null) {
            log.warn("FirebaseMessaging not available. Skipping notification for event: {}", event.getId());
            return;
        }

        try {
            // Fetch user to get device token
            User user = userTable.getItem(r -> r.key(k -> k.partitionValue(event.getUserId())));

            if (user == null) {
                log.warn("User not found for event: {}. UserId: {}", event.getId(), event.getUserId());
                return;
            }

            String deviceToken = user.getDeviceToken();
            if (deviceToken == null || deviceToken.isEmpty()) {
                log.debug("No device token for user: {}. Skipping notification.", user.getEmail());
                return;
            }

            // Build notification message
            String title = "Reward Ready to Collect!";
            String body = buildNotificationBody(event);

            Message message = Message.builder()
                    .setToken(deviceToken)
                    .setNotification(Notification.builder()
                            .setTitle(title)
                            .setBody(body)
                            .build())
                    .putData("eventId", event.getId())
                    .putData("islandId", event.getIslandId())
                    .putData("resourceId", event.getResourceId() != null ? event.getResourceId() : "")
                    .putData("type", event.getType() != null ? event.getType() : "")
                    .build();

            // Send the notification
            String response = firebaseMessaging.send(message);
            log.info("Successfully sent notification to user {}. Response: {}", user.getEmail(), response);

        } catch (Exception e) {
            log.error("Failed to send notification for event: {}", event.getId(), e);
        }
    }

    private String buildNotificationBody(ScheduledEventDto event) {
        if (event.getType() == null) {
            return "Your reward is ready to collect!";
        }

        return switch (event.getType().toUpperCase()) {
            case "CROP_READY" -> "Your crops are ready to harvest!";
            case "ANIMAL_READY" -> "Your animals have products ready to collect!";
            case "FISHING_READY" -> "You caught a fish!";
            case "MINING_READY" -> "Your mining expedition is complete!";
            default -> "Your reward is ready to collect!";
        };
    }
}
