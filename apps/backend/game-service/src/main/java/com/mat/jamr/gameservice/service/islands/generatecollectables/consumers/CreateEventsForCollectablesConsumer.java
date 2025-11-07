package com.mat.jamr.gameservice.service.islands.generatecollectables.consumers;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mat.jamr.gameservice.api.db.ScheduledEvent;
import com.mat.jamr.gameservice.api.db.TerrainCollectable;
import com.mat.jamr.gameservice.context.GenerateCollectablesContext;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.core.KafkaTemplate;

import java.time.Instant;
import java.util.List;
import java.util.UUID;
import java.util.function.Consumer;

@Slf4j
@RequiredArgsConstructor
public class CreateEventsForCollectablesConsumer implements Consumer<GenerateCollectablesContext> {

    private final KafkaTemplate<String, String> kafkaTemplate;
    private final ObjectMapper objectMapper;

    @Override
    public void accept(GenerateCollectablesContext context) {
        var island = context.getIsland();
        var farm = island.getFarm();

        if (farm == null || farm.getTerrainCollectables() == null) {
            log.warn("No farm or collectables to create events for");
            return;
        }

        List<TerrainCollectable> collectables = farm.getTerrainCollectables();

        // Get the newly generated collectables (last generatedCount items)
        int generatedCount = context.getGeneratedCount();
        int totalCount = collectables.size();
        int startIndex = totalCount - generatedCount;

        if (startIndex < 0) {
            startIndex = 0;
        }

        log.info("Creating events for {} newly generated collectables on island {}",
                generatedCount, island.getId());

        for (int i = startIndex; i < totalCount; i++) {
            TerrainCollectable collectable = collectables.get(i);

            if (collectable.getAsset() == null ||
                collectable.getAsset().getOnClickAction() == null ||
                collectable.getAsset().getOnClickAction().getTimerInfo() == null) {
                log.warn("Collectable {} has no timer info, skipping event creation", collectable.getId());
                continue;
            }

            long durationSeconds = collectable.getAsset().getOnClickAction().getTimerInfo().getDurationSeconds();
            Instant now = Instant.now();
            Instant executionTime = now.plusSeconds(durationSeconds);

            // Create scheduled event
            ScheduledEvent event = new ScheduledEvent();
            event.setId(UUID.randomUUID().toString());
            event.setCreatedDate(now.toString());
            event.setExecutionDate(executionTime.toString());
            event.setIslandId(island.getId());
            event.setAssetId(collectable.getId()); // Use collectable ID as assetId
            event.setUserId(island.getOwnerId()); // Get userId from island's ownerId
            event.setStatus("PENDING");

            // Send event to Kafka
            try {
                String eventJson = objectMapper.writeValueAsString(event);
                kafkaTemplate.send("schedule-event", eventJson);
                log.info("Published event {} for collectable {} (duration: {}s) to schedule-event topic",
                        event.getId(), collectable.getId(), durationSeconds);
            } catch (Exception e) {
                log.error("Failed to serialize and publish event for collectable: {}", collectable.getId(), e);
            }
        }
    }
}
