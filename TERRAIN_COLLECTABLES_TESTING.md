# Testing Terrain Collectables E2E

This guide explains how to test the terrain collectables feature end-to-end.

## What Was Implemented

1. **Backend**: Added `terrainCollectables` field to Farm in Island
   - Proto definition with TerrainCollectable message (id, x, y, sizeX, sizeY, asset, type, isCollected, collectedAt)
   - TerrainCollectableType enum (BUSH, ROCK, TREE)
   - DB entities and mappers
   - External API schema
   - API gateway mappings

2. **Flutter**: Updated farm rendering to use `terrainCollectables` from backend
   - `getFarmTerrainFromIsland` now reads `farm.terrainCollectables` instead of hardcoded decorations/plots
   - Maps terrain collectable types to visual TileKinds (BUSH→grass, ROCK→rock, TREE→tree)
   - Filters out already collected items (isCollected=true)
   - Added FloatingActionButton on farm screen for testing

## How to Test

### Option 1: Add Terrain Collectables via DynamoDB Console

1. Open AWS DynamoDB Console
2. Navigate to your Islands table
3. Find your test island
4. Edit the island item and add to the `farm` object:

```json
{
  "farm": {
    "id": "farm-001",
    "name": "My Farm",
    "sizeX": 12,
    "sizeY": 8,
    "blockSize": 16,
    "terrainCollectables": [
      {
        "id": "collectable-1",
        "x": 2,
        "y": 2,
        "sizeX": 1,
        "sizeY": 1,
        "type": "ROCK",
        "isCollected": false,
        "asset": {
          "id": "asset-rock-1",
          "name": "Rock",
          "type": "IMAGE"
        }
      },
      {
        "id": "collectable-2",
        "x": 5,
        "y": 3,
        "sizeX": 1,
        "sizeY": 1,
        "type": "TREE",
        "isCollected": false,
        "asset": {
          "id": "asset-tree-1",
          "name": "Tree",
          "type": "IMAGE"
        }
      },
      {
        "id": "collectable-3",
        "x": 8,
        "y": 5,
        "sizeX": 1,
        "sizeY": 1,
        "type": "BUSH",
        "isCollected": false,
        "asset": {
          "id": "asset-bush-1",
          "name": "Bush",
          "type": "IMAGE"
        }
      },
      {
        "id": "collectable-4",
        "x": 3,
        "y": 6,
        "sizeX": 2,
        "sizeY": 2,
        "type": "ROCK",
        "isCollected": false,
        "asset": {
          "id": "asset-rock-2",
          "name": "Large Rock",
          "type": "IMAGE"
        }
      }
    ]
  }
}
```

### Option 2: Create Island with Terrain Collectables (Backend)

You can modify the island creation logic in `CreateIslandFromVariantConsumer.java` to initialize some terrain collectables:

```java
// In CreateIslandFromVariantConsumer.java, after creating farm:

// Add some initial terrain collectables
List<TerrainCollectable> collectables = new ArrayList<>();

// Rock at position (2, 2)
TerrainCollectable rock1 = new TerrainCollectable();
rock1.setId(UUID.randomUUID().toString());
rock1.setX(2);
rock1.setY(2);
rock1.setSizeX(1);
rock1.setSizeY(1);
rock1.setType("ROCK");
rock1.setIsCollected(false);
collectables.add(rock1);

// Tree at position (5, 3)
TerrainCollectable tree1 = new TerrainCollectable();
tree1.setId(UUID.randomUUID().toString());
tree1.setX(5);
tree1.setY(3);
tree1.setSizeX(1);
tree1.setSizeY(1);
tree1.setType("TREE");
tree1.setIsCollected(false);
collectables.add(tree1);

// Bush at position (8, 5)
TerrainCollectable bush1 = new TerrainCollectable();
bush1.setId(UUID.randomUUID().toString());
bush1.setX(8);
bush1.setY(5);
bush1.setSizeX(1);
bush1.setSizeY(1);
bush1.setType("BUSH");
bush1.setIsCollected(false);
collectables.add(bush1);

farm.setTerrainCollectables(collectables);
```

### Option 3: Use Flutter FAB (Placeholder)

The green FloatingActionButton (FAB) with a location icon appears on the farm screen. Currently it just shows a reminder message - you'll need to add terrain collectables via DynamoDB or backend for now.

## Verification

1. **Backend**: Check that terrain collectables are stored in DynamoDB
   - Query your island and verify the `farm.terrainCollectables` array exists

2. **API**: Test the GET island endpoint returns terrain collectables
   ```bash
   curl http://localhost:8080/islands/{islandId}
   ```
   Should include `terrainCollectables` in the farm object

3. **Flutter**:
   - Open the app and navigate to your island's farm
   - You should see rocks, trees, and bushes rendered on the terrain grid
   - Tapping them should trigger the existing interactive terrain logic (timers, collection, etc.)
   - Already collected items (isCollected=true) should not appear

## Interactive Behavior

The terrain collectables integrate with the existing `InteractiveTerrain` widget:
- **Tap once**: Starts a timer (10-60 seconds)
- **During timer**: Shows progress bar
- **When ready**: Shows pulsing star indicator
- **Tap when ready**: Collects the item and awards gold

The existing event system will handle creating events for terrain collectables just like any other interactive tile.

## Coordinate System

- Farm size: 12x8 (sizeX x sizeY)
- Coordinates: (0,0) is top-left, (11,7) is bottom-right
- sizeX/sizeY: Size of the collectable (1x1 for small, 2x2 for large rocks/trees)

## Next Steps

To fully complete the feature:
1. Create an API endpoint to add/update terrain collectables
2. Implement collection logic that updates `isCollected=true` when harvested
3. Add `collectedAt` timestamp when collected
4. Possibly add respawn logic (reset isCollected after some time)
