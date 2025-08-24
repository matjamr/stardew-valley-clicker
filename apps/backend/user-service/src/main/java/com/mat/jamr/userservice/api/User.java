package com.mat.jamr.userservice.api;

import lombok.Data;
import lombok.experimental.Accessors;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbBean;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbPartitionKey;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbSecondaryPartitionKey;

import java.util.UUID;

@DynamoDbBean
@Data
@Accessors(chain = true)
public class User {

    private UUID id;
    private String name;
    private String email;
    private String password;

    @DynamoDbPartitionKey
    public UUID getId() {
        return id;
    }

    @DynamoDbSecondaryPartitionKey(indexNames = "email-index")
    public String getEmail() {
        return email;
    }
}