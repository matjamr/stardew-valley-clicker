package com.mat.jamr.gameservice.service.islands.create.consumers;

import com.mat.jamr.gameservice.api.db.*;
import com.mat.jamr.gameservice.context.IslandAware;
import com.mat.jamr.gameservice.context.IslandVariantAware;
import lombok.RequiredArgsConstructor;

import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.function.Consumer;
import java.util.stream.Collectors;

@RequiredArgsConstructor
public class CreateIslandFromVariantConsumer<T extends IslandVariantAware & IslandAware> implements Consumer<T> {

    @Override
    public void accept(T context) {
        var variant = context.getIslandVariant();
        if (variant == null) {
            throw new IllegalStateException("IslandVariant must be set before creating Island");
        }

        var island = new Island();
        island.setId(UUID.randomUUID().toString());
        island.setNamedVariant(variant.getNamedVariant());
        island.setCreatedAt(Instant.now().toString());
        island.setUpdatedAt(Instant.now().toString());

        // Copy farm template
        if (variant.getFarmTemplate() != null) {
            island.setFarm(copyFarm(variant.getFarmTemplate()));
        }

        // Copy barn template
        if (variant.getBarnTemplate() != null) {
            island.setBarn(copyBarn(variant.getBarnTemplate()));
        }

        // Copy mines template
        if (variant.getMinesTemplate() != null) {
            island.setMines(copyMines(variant.getMinesTemplate()));
        }

        // Copy fishing area template
        if (variant.getFishingAreaTemplate() != null) {
            island.setFishingArea(copyFishingArea(variant.getFishingAreaTemplate()));
        }

        context.setIsland(island);
    }

    private Farm copyFarm(Farm template) {
        var farm = new Farm();
        farm.setId(template.getId());
        farm.setName(template.getName());
        farm.setSizeX(template.getSizeX());
        farm.setSizeY(template.getSizeY());
        farm.setBlockSize(template.getBlockSize());

        if (template.getPlots() != null) {
            farm.setPlots(template.getPlots().stream()
                    .map(this::copyCropPlot)
                    .collect(Collectors.toList()));
        }

        if (template.getDecorations() != null) {
            farm.setDecorations(template.getDecorations().stream()
                    .map(this::copyDecoration)
                    .collect(Collectors.toList()));
        }

        return farm;
    }

    private CropPlot copyCropPlot(CropPlot template) {
        var plot = new CropPlot();
        plot.setX(template.getX());
        plot.setY(template.getY());
        plot.setSizeX(template.getSizeX());
        plot.setSizeY(template.getSizeY());
        if (template.getAsset() != null) {
            plot.setAsset(copyAsset(template.getAsset()));
        }
        return plot;
    }

    private Decoration copyDecoration(Decoration template) {
        var decoration = new Decoration();
        decoration.setX(template.getX());
        decoration.setY(template.getY());
        decoration.setSizeX(template.getSizeX());
        decoration.setSizeY(template.getSizeY());
        if (template.getAsset() != null) {
            decoration.setAsset(copyAsset(template.getAsset()));
        }
        return decoration;
    }

    private Barn copyBarn(Barn template) {
        var barn = new Barn();
        barn.setId(template.getId());
        barn.setName(template.getName());
        barn.setSizeX(template.getSizeX());
        barn.setSizeY(template.getSizeY());
        barn.setBlockSize(template.getBlockSize());

        if (template.getPens() != null) {
            barn.setPens(template.getPens().stream()
                    .map(this::copyAnimalPen)
                    .collect(Collectors.toList()));
        }

        if (template.getStorageUnits() != null) {
            barn.setStorageUnits(template.getStorageUnits().stream()
                    .map(this::copyStorage)
                    .collect(Collectors.toList()));
        }

        return barn;
    }

    private AnimalPen copyAnimalPen(AnimalPen template) {
        var pen = new AnimalPen();
        pen.setX(template.getX());
        pen.setY(template.getY());
        pen.setSizeX(template.getSizeX());
        pen.setSizeY(template.getSizeY());
        pen.setCapacity(template.getCapacity());
        if (template.getAsset() != null) {
            pen.setAsset(copyAsset(template.getAsset()));
        }
        pen.setAnimalIds(new ArrayList<>()); // Start with empty animals
        return pen;
    }

    private Storage copyStorage(Storage template) {
        var storage = new Storage();
        storage.setX(template.getX());
        storage.setY(template.getY());
        storage.setSizeX(template.getSizeX());
        storage.setSizeY(template.getSizeY());
        storage.setCapacity(template.getCapacity());
        if (template.getAsset() != null) {
            storage.setAsset(copyAsset(template.getAsset()));
        }
        return storage;
    }

    private Mines copyMines(Mines template) {
        var mines = new Mines();
        mines.setId(template.getId());
        mines.setName(template.getName());
        mines.setCurrentLevel(template.getCurrentLevel());
        mines.setMaxLevel(template.getMaxLevel());

        if (template.getLevels() != null) {
            mines.setLevels(template.getLevels().stream()
                    .map(this::copyMineLevel)
                    .collect(Collectors.toList()));
        }

        return mines;
    }

    private MineLevel copyMineLevel(MineLevel template) {
        var level = new MineLevel();
        level.setLevel(template.getLevel());
        level.setSizeX(template.getSizeX());
        level.setSizeY(template.getSizeY());
        level.setBlockSize(template.getBlockSize());
        level.setDifficulty(template.getDifficulty());

        if (template.getTiles() != null) {
            level.setTiles(template.getTiles().stream()
                    .map(this::copyMineTile)
                    .collect(Collectors.toList()));
        }

        if (template.getResourceIds() != null) {
            level.setResourceIds(new ArrayList<>(template.getResourceIds()));
        }

        return level;
    }

    private MineTile copyMineTile(MineTile template) {
        var tile = new MineTile();
        tile.setX(template.getX());
        tile.setY(template.getY());
        tile.setSizeX(template.getSizeX());
        tile.setSizeY(template.getSizeY());
        tile.setDiscovered(template.getDiscovered() != null ? template.getDiscovered() : false);
        tile.setTimeTaken(template.getTimeTaken());
        if (template.getAsset() != null) {
            tile.setAsset(copyAsset(template.getAsset()));
        }
        return tile;
    }

    private FishingArea copyFishingArea(FishingArea template) {
        var area = new FishingArea();
        area.setId(template.getId());
        area.setName(template.getName());
        area.setSizeX(template.getSizeX());
        area.setSizeY(template.getSizeY());
        area.setBlockSize(template.getBlockSize());

        if (template.getSpots() != null) {
            area.setSpots(template.getSpots().stream()
                    .map(this::copyFishingSpot)
                    .collect(Collectors.toList()));
        }

        if (template.getAvailableFishIds() != null) {
            area.setAvailableFishIds(new ArrayList<>(template.getAvailableFishIds()));
        }

        return area;
    }

    private FishingSpot copyFishingSpot(FishingSpot template) {
        var spot = new FishingSpot();
        spot.setX(template.getX());
        spot.setY(template.getY());
        spot.setSizeX(template.getSizeX());
        spot.setSizeY(template.getSizeY());
        spot.setQuality(template.getQuality());
        if (template.getAsset() != null) {
            spot.setAsset(copyAsset(template.getAsset()));
        }
        return spot;
    }

    private Asset copyAsset(Asset template) {
        var asset = new Asset();
        asset.setId(template.getId());
        asset.setName(template.getName());
        asset.setType(template.getType());
        asset.setDescription(template.getDescription());
        asset.setUrl(template.getUrl());
        if (template.getOnClickAction() != null) {
            asset.setOnClickAction(copyOnClickAction(template.getOnClickAction()));
        }
        return asset;
    }

    private OnClickAction copyOnClickAction(OnClickAction template) {
        var action = new OnClickAction();
        action.setActionType(template.getActionType());
        if (template.getTimerInfo() != null) {
            action.setTimerInfo(copyTimerInfo(template.getTimerInfo()));
        }
        if (template.getRewardInfo() != null) {
            action.setRewardInfo(copyRewardInfo(template.getRewardInfo()));
        }
        if (template.getEnergyInfo() != null) {
            action.setEnergyInfo(copyEnergyInfo(template.getEnergyInfo()));
        }
        return action;
    }

    private TimerInfo copyTimerInfo(TimerInfo template) {
        var timerInfo = new TimerInfo();
        timerInfo.setDurationSeconds(template.getDurationSeconds());
        timerInfo.setTimerId(template.getTimerId());
        return timerInfo;
    }

    private RewardInfo copyRewardInfo(RewardInfo template) {
        var rewardInfo = new RewardInfo();
        if (template.getResources() != null) {
            rewardInfo.setResources(template.getResources().stream()
                    .map(this::copyResourceReward)
                    .collect(Collectors.toList()));
        }
        rewardInfo.setXpGrant(template.getXpGrant());
        return rewardInfo;
    }

    private ResourceReward copyResourceReward(ResourceReward template) {
        var reward = new ResourceReward();
        reward.setResourceId(template.getResourceId());
        reward.setAmount(template.getAmount());
        return reward;
    }

    private EnergyInfo copyEnergyInfo(EnergyInfo template) {
        var energyInfo = new EnergyInfo();
        energyInfo.setEnergyConsumption(template.getEnergyConsumption());
        return energyInfo;
    }
}
