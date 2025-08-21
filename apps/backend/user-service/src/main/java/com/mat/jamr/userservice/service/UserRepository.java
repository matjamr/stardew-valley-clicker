package com.mat.jamr.userservice.service;

import com.mat.jamr.userservice.api.User;
import io.awspring.cloud.dynamodb.DynamoDbTemplate;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;
import software.amazon.awssdk.enhanced.dynamodb.Key;

import java.util.UUID;

@Repository
@AllArgsConstructor
public class UserRepository {
    final private DynamoDbTemplate dynamoDbTemplate;

    public String createCustomer(User user) {
        var savedUser = dynamoDbTemplate.save(user);
        return savedUser.getId().toString();
    }

    public User getCustomerById(String id) {
        Key partitionKey = Key.builder().partitionValue(id).build();

        return dynamoDbTemplate.load(partitionKey, User.class);
    }

    public User updateCustomer(String id, User user) {
        Key partitionKey = Key.builder().partitionValue(id).build();
        User load = dynamoDbTemplate.load(partitionKey, User.class);

        load.setName(user.getName());
        load.setEmail(user.getEmail());
        var returnedUser = dynamoDbTemplate.save(load);

        return returnedUser;
    }

    public String deleteCustomer(String id) {
        Key partitionKey = Key.builder().partitionValue(id).build();
        User load = dynamoDbTemplate.load(partitionKey, User.class);

        dynamoDbTemplate.delete(load);

        return load.getId() + " get deleted !";
    }
}
