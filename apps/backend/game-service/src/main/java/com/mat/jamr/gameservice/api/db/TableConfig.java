package com.mat.jamr.gameservice.api.db;

import io.minio.MinioClient;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
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

@Configuration
public class TableConfig {

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
    public DynamoDbTable<com.mat.jamr.gameservice.api.db.Asset> userTable(
            DynamoDbEnhancedClient enhancedClient
    ) {
        return enhancedClient.table("Assets", TableSchema.fromBean(Asset.class));
    }

    @Bean
    public DynamoDbTable<com.mat.jamr.gameservice.api.db.Island> islandTable(
            DynamoDbEnhancedClient enhancedClient
    ) {
        return enhancedClient.table("Islands", TableSchema.fromBean(Island.class));
    }

    @Bean
    public DynamoDbTable<com.mat.jamr.gameservice.api.db.IslandVariant> islandVariantTable(
            DynamoDbEnhancedClient enhancedClient
    ) {
        return enhancedClient.table("IslandVariants", TableSchema.fromBean(IslandVariant.class));
    }

    @Bean
    public DynamoDbTable<com.mat.jamr.gameservice.api.db.ScheduledEvent> eventsTable(
            DynamoDbEnhancedClient enhancedClient
    ) {
        return enhancedClient.table("Events", TableSchema.fromBean(ScheduledEvent.class));
    }


    @Value("${minio.url}")
    private String url;

    @Value("${minio.access.name}")
    private String accessKey;

    @Value("${minio.access.secret}")
    private String accessSecret;

    @Bean
    public MinioClient minioClient() {
        return MinioClient.builder()
                .endpoint(url)
                .credentials(accessKey, accessSecret)
                .build();
    }
}
