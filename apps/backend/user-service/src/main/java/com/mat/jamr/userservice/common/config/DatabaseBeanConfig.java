package com.mat.jamr.userservice.common.config;

import com.mat.jamr.userservice.api.Email;
import com.mat.jamr.userservice.api.User;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.AwsSessionCredentials;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbEnhancedClient;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;
import software.amazon.awssdk.enhanced.dynamodb.TableSchema;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.dynamodb.DynamoDbClient;
import software.amazon.awssdk.services.dynamodb.DynamoDbClientBuilder;

import java.net.URI;

@Configuration("DatabaseBeanConfig")
public class DatabaseBeanConfig {

    @Value("${aws.dynamodb.endpoint}")
    private String dynamodbEndpoint;

    @Value("${aws.region}")
    private String awsRegion;

    @Value("${aws.dynamodb.accessKey}")
    private String dynamodbAccessKey;

    @Value("${aws.dynamodb.secretKey}")
    private String dynamodbSecretKey;

    @Value("${aws.dynamo.sessionToken}")
    private String dynamodbSessionToken;

    @Bean
    public DynamoDbClient dynamoDbClient() {
        DynamoDbClientBuilder builder = DynamoDbClient.builder()
                .region(Region.of(awsRegion));

        if (dynamodbSessionToken != null && !dynamodbSessionToken.isEmpty()) {
            builder.credentialsProvider(
                    StaticCredentialsProvider.create(
                            AwsSessionCredentials.create(
                                    dynamodbAccessKey,
                                    dynamodbSecretKey,
                                    dynamodbSessionToken
                            )
                    )
            );
        } else {
            builder.credentialsProvider(
                    StaticCredentialsProvider.create(
                            AwsBasicCredentials.create(
                                    dynamodbAccessKey,
                                    dynamodbSecretKey
                            )
                    )
            );
        }

        if (dynamodbEndpoint != null && !dynamodbEndpoint.isEmpty()) {
            builder.endpointOverride(URI.create(dynamodbEndpoint));
        }

        return builder.build();
    }

    @Bean
    public DynamoDbEnhancedClient dynamoDbEnhancedClient(DynamoDbClient dynamoDbClient) {
        return DynamoDbEnhancedClient.builder()
                .dynamoDbClient(dynamoDbClient)
                .build();
    }

    @Bean
    public LettuceConnectionFactory connectionFactory() {
        return new LettuceConnectionFactory();
    }

    @Bean
    public RedisTemplate<String, Object> redisTemplate() {
        RedisTemplate<String, Object> template = new RedisTemplate<>();
        template.setConnectionFactory(connectionFactory());
        template.setDefaultSerializer(
                new Jackson2JsonRedisSerializer<>(Object.class));
        return template;
    }

    @Bean
    public DynamoDbTable<User> userTable(
            DynamoDbEnhancedClient enhancedClient
    ) {
        return enhancedClient.table("users", TableSchema.fromBean(User.class));
    }

    @Bean
    public DynamoDbTable<Email> emailTable(
            DynamoDbEnhancedClient enhancedClient
    ) {
        return enhancedClient.table("emails", TableSchema.fromBean(Email.class));
    }
}
