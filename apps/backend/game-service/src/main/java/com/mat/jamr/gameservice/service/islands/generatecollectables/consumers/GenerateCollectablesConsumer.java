package com.mat.jamr.gameservice.service.islands.generatecollectables.consumers;

import com.mat.jamr.gameservice.api.db.Asset;
import com.mat.jamr.gameservice.api.db.Farm;
import com.mat.jamr.gameservice.api.db.OnClickAction;
import com.mat.jamr.gameservice.api.db.RewardInfo;
import com.mat.jamr.gameservice.api.db.ResourceReward;
import com.mat.jamr.gameservice.api.db.TerrainCollectable;
import com.mat.jamr.gameservice.api.db.TimerInfo;
import com.mat.jamr.gameservice.context.GenerateCollectablesContext;
import lombok.RequiredArgsConstructor;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.UUID;
import java.util.function.Consumer;

@RequiredArgsConstructor
public class GenerateCollectablesConsumer implements Consumer<GenerateCollectablesContext> {

    private static final Random RANDOM = new Random();
    private static final String[] TYPES = {"BUSH", "ROCK", "TREE"};

    // Asset configuration for each type
    private static final String BUSH_ASSET_ID = "asset-bush";
    private static final String ROCK_ASSET_ID = "asset-rock";
    private static final String TREE_ASSET_ID = "asset-tree";

    private Asset createAssetForType(String type) {
        Asset asset = new Asset();

        // Set asset ID and metadata based on type
        switch (type) {
            case "BUSH":
                asset.setId(BUSH_ASSET_ID);
                asset.setName("Bush");
                asset.setDescription("A bush that can be harvested");
                asset.setUrl("assets/images/bush.png");
                break;
            case "ROCK":
                asset.setId(ROCK_ASSET_ID);
                asset.setName("Rock");
                asset.setDescription("A rock that can be mined");
                asset.setUrl("assets/images/rock.png");
                break;
            case "TREE":
                asset.setId(TREE_ASSET_ID);
                asset.setName("Tree");
                asset.setDescription("A tree that can be chopped");
                asset.setUrl("assets/images/tree.png");
                break;
        }

        // Create OnClickAction with timer and reward
        OnClickAction onClick = new OnClickAction();
        onClick.setActionType("START_TIMER");

        // Timer: 10-60 seconds based on type
        TimerInfo timerInfo = new TimerInfo();
        long duration;
        switch (type) {
            case "TREE":
                duration = 40L + RANDOM.nextInt(21); // 40-60 seconds
                break;
            case "ROCK":
                duration = 25L + RANDOM.nextInt(16); // 25-40 seconds
                break;
            case "BUSH":
            default:
                duration = 10L + RANDOM.nextInt(11); // 10-20 seconds
                break;
        }
        timerInfo.setDurationSeconds(duration);
        onClick.setTimerInfo(timerInfo);

        // Reward based on type
        RewardInfo rewardInfo = new RewardInfo();
        ResourceReward goldReward = new ResourceReward();
        goldReward.setResourceId("gold");
        switch (type) {
            case "TREE":
                goldReward.setAmount(15);
                break;
            case "ROCK":
                goldReward.setAmount(12);
                break;
            case "BUSH":
            default:
                goldReward.setAmount(8);
                break;
        }
        rewardInfo.setResources(List.of(goldReward));
        onClick.setRewardInfo(rewardInfo);

        asset.setOnClickAction(onClick);
        return asset;
    }

    @Override
    public void accept(GenerateCollectablesContext context) {
        var island = context.getIsland();
        if (island.getFarm() == null) {
            throw new IllegalStateException("Island has no farm");
        }

        var farm = island.getFarm();
        var farmWidth = farm.getSizeX() != null ? farm.getSizeX() : 12;
        var farmHeight = farm.getSizeY() != null ? farm.getSizeY() : 8;

        // Determine count: use requested count or default to 3-5
        int count = context.getRequest().getCount();
        if (count <= 0) {
            count = 3 + RANDOM.nextInt(3); // 3 to 5
        }

        // Get existing collectables
        List<TerrainCollectable> existingCollectables = farm.getTerrainCollectables();
        if (existingCollectables == null) {
            existingCollectables = new ArrayList<>();
        } else {
            existingCollectables = new ArrayList<>(existingCollectables);
        }

        // Generate new collectables
        for (int i = 0; i < count; i++) {
            var type = TYPES[RANDOM.nextInt(TYPES.length)];
            var collectable = new TerrainCollectable();
            collectable.setId(UUID.randomUUID().toString());
            collectable.setX(RANDOM.nextInt(farmWidth));
            collectable.setY(RANDOM.nextInt(farmHeight));
            collectable.setSizeX(1);
            collectable.setSizeY(1);
            collectable.setType(type);
            collectable.setIsCollected(false);
            collectable.setAsset(createAssetForType(type));

            existingCollectables.add(collectable);
        }

        // Update farm with new collectables
        var updatedFarm = new Farm();
        updatedFarm.setId(farm.getId());
        updatedFarm.setName(farm.getName());
        updatedFarm.setBlockSize(farm.getBlockSize());
        updatedFarm.setSizeX(farm.getSizeX());
        updatedFarm.setSizeY(farm.getSizeY());
        updatedFarm.setPlots(farm.getPlots());
        updatedFarm.setDecorations(farm.getDecorations());
        updatedFarm.setTerrainCollectables(existingCollectables);

        island.setFarm(updatedFarm);
        context.setGeneratedCount(count);
    }
}
