package com.mat.jamr.userservice.common.user;

import com.mat.jamr.userservice.api.User;
import com.mat.jamr.userservice.common.user.service.OptionalUserByEmailExtractor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbIndex;

import java.util.Optional;
import java.util.function.Function;

@Configuration
public class UserCommonBeanConfig {

    @Bean
    public Function<String, Optional<User>> optionalUserByEmailExtractor(
            final DynamoDbIndex<User> emailIndex
    ) {
        return new OptionalUserByEmailExtractor(emailIndex);
    }

}
