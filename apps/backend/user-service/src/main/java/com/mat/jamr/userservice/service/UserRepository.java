package com.mat.jamr.userservice.service;

import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBMapper;
import com.mat.jamr.userservice.api.User;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
@AllArgsConstructor
public class UserRepository {
    final private DynamoDBMapper dynamoDBMapper;

    public String createCustomer(User user) {
        dynamoDBMapper.save(user);
        return user.getId().toString();
    }

    public User getCustomerById(String id) {
        return dynamoDBMapper.load(User.class, UUID.fromString(id));
    }

    public User updateCustomer(String id, User user) {
        User load = dynamoDBMapper.load(User.class, UUID.fromString(id));
        load.setName(user.getName());
        load.setEmail(user.getEmail());
        dynamoDBMapper.save(load);
        return load;
    }

    public String deleteCustomer(String id) {
        User load = dynamoDBMapper.load(User.class, UUID.fromString(id));
        dynamoDBMapper.delete(load);
        return load.getId() + " get deleted !";
    }
}
