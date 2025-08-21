package com.mat.jamr.userservice.api;

import com.mat.jamr.userservice.uil.TableName;
import lombok.Data;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbBean;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbPartitionKey;

import java.util.UUID;

@DynamoDbBean
@TableName(name = "users")
@Data
public class User {

    private UUID id;
    private String name;
    private String email;

    @DynamoDbPartitionKey
    public UUID getId() {
        return id;
    }
}
