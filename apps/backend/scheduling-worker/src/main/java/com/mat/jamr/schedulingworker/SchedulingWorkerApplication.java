package com.mat.jamr.schedulingworker;

import jakarta.annotation.PostConstruct;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.kafka.core.KafkaTemplate;

@SpringBootApplication
public class SchedulingWorkerApplication {

    @Autowired
    private KafkaTemplate<String, String> kafkaTemplate;

    public static void main(String[] args) {
        SpringApplication.run(SchedulingWorkerApplication.class, args);
    }

    @PostConstruct
    public void postConstruct() {
        kafkaTemplate.send("schedule-event", "Tescik");
    }
}
