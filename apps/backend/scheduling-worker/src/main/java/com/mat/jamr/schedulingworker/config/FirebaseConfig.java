package com.mat.jamr.schedulingworker.config;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.messaging.FirebaseMessaging;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;

import java.io.IOException;
import java.io.InputStream;

@Slf4j
@Configuration
public class FirebaseConfig {

    @Value("${firebase.credentials.path:#{null}}")
    private String firebaseCredentialsPath;

    private final ResourceLoader resourceLoader;

    public FirebaseConfig(ResourceLoader resourceLoader) {
        this.resourceLoader = resourceLoader;
    }

    @Bean
    public FirebaseApp firebaseApp() throws IOException {
        if (firebaseCredentialsPath == null || firebaseCredentialsPath.isEmpty()) {
            log.warn("Firebase credentials path not configured. Push notifications will not be available.");
            log.warn("Set 'FIREBASE_CREDENTIALS_PATH' environment variable or 'firebase.credentials.path' property to enable Firebase");
            log.warn("Example: FIREBASE_CREDENTIALS_PATH=/path/to/credentials.json or FIREBASE_CREDENTIALS_PATH=classpath:credentials.json");
            return null;
        }

        try {
            // Use ResourceLoader to support both classpath: and file: paths
            Resource resource = resourceLoader.getResource(firebaseCredentialsPath);
            InputStream serviceAccount = resource.getInputStream();

            FirebaseOptions options = FirebaseOptions.builder()
                    .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                    .build();

            FirebaseApp app = FirebaseApp.initializeApp(options);
            log.info("Firebase initialized successfully from: {}", firebaseCredentialsPath);
            return app;
        } catch (IOException e) {
            log.error("Failed to initialize Firebase from path '{}': {}", firebaseCredentialsPath, e.getMessage());
            log.error("Make sure the path is correct and the file exists");
            throw e;
        }
    }

    @Bean
    public FirebaseMessaging firebaseMessaging(FirebaseApp firebaseApp) {
        if (firebaseApp == null) {
            log.warn("FirebaseApp not initialized. FirebaseMessaging will not be available.");
            return null;
        }
        return FirebaseMessaging.getInstance(firebaseApp);
    }
}
