import 'package:flutter/material.dart';
import 'package:mobile/state/island_providers.dart';

class TerrainGrid extends StatelessWidget {
  final TerrainSpec terrain;
  final double maxWidth;
  final double maxHeight;
  final double gap;
  final double tileSize;
  final bool useFixedTileSize;

  const TerrainGrid({
    super.key,
    required this.terrain,
    this.maxWidth = 240,
    this.maxHeight = 160,
    this.gap = 1,
    this.tileSize = 16,
    this.useFixedTileSize = false,
  });

  Color _colorFor(TileKind kind) {
    switch (kind) {
      case TileKind.soil:
        return const Color(0xFF6D4C41).withOpacity(0.8); // brown
      case TileKind.water:
        return const Color(0xFF42A5F5).withOpacity(0.8); // blue
      case TileKind.rock:
        return const Color(0xFF90A4AE).withOpacity(0.8); // gray
      case TileKind.path:
        return const Color(0xFF8D6E63).withOpacity(0.8); // light brown
      case TileKind.grass:
        return const Color(0xFF66BB6A).withOpacity(0.8); // green
      case TileKind.tree:
        return const Color(0xFF2E7D32).withOpacity(0.8); // dark green
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use fixed tile size if requested, otherwise compute dynamically
    final cols = terrain.sizeX;
    final rows = terrain.sizeY;

    final double tile;
    if (useFixedTileSize) {
      tile = tileSize;
    } else {
      final tileSizeW = (maxWidth - (cols - 1) * gap) / cols;
      final tileSizeH = (maxHeight - (rows - 1) * gap) / rows;
      tile = tileSizeW < tileSizeH ? tileSizeW : tileSizeH;
    }

    final width = cols * tile + (cols - 1) * gap;
    final height = rows * tile + (rows - 1) * gap;

    // expand individual tiles (including multi-size tiles) to absolute positioned boxes
    final children = <Widget>[];

    // Add background image
    children.add(
      Positioned.fill(
        child: Image.asset(
          'assets/images/riverside_background.png',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            // Fallback to gradient if image not found
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFF4CAF50),
                    const Color(0xFF81C784),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );

    // Add tile overlays
    for (final t in terrain.tiles) {
      final left = t.x * (tile + gap);
      final top = t.y * (tile + gap);
      final w = t.sizeX * tile + (t.sizeX - 1) * gap;
      final h = t.sizeY * tile + (t.sizeY - 1) * gap;
      children.add(
        Positioned(
          left: left,
          top: top,
          width: w,
          height: h,
          child: Container(
            decoration: BoxDecoration(
              color: _colorFor(t.kind),
              borderRadius: BorderRadius.circular(2),
              border: Border.all(color: const Color(0xFF2E1F1A), width: 1),
            ),
          ),
        ),
      );
    }

    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(children: children),
      ),
    );
  }
}
