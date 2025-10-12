package com.mat.jamr.outbound.common.kafka;

import com.mat.jamr.outbound.api.TopicConstants;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;

@Service
public class KafkaConsumer {

    @KafkaListener(topics = TopicConstants.EMAIL_ACCOUNT_CONFIRMATION, groupId = "1")
    public void consumeEmailAccountConfirmation(String message) {
        System.out.println("Consumed message from email account confirmation: " + message);
    }

    @KafkaListener(topics = TopicConstants.PASSWORD_CHANGE_NOTIFICATION, groupId = "1")
    public void consumePASSWORD_CHANGE_NOTIFICATION(String message) {
        System.out.println("Consumed message PASSWORD_CHANGE_NOTIFICATION: " + message);
    }

    @KafkaListener(topics = TopicConstants.USER_CREATED_NOTIFICATION, groupId = "1")
    public void consumeUSER_CREATED_NOTIFICATION(String message) {
        System.out.println("Consumed message USER_CREATED_NOTIFICATION: " + message);
    }
}
