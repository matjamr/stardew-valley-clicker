import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/text.dart';
import 'package:flutter/painting.dart';
import 'package:mobile/game/model/location.dart';

class MyGame extends FlameGame {
  LocationArea location;

  SpriteComponent? _background;

  MyGame({required this.location});

  @override
  Color backgroundColor() => const Color(0xFF1F2A1F);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await _loadBackgroundFor(location);
  }

  Future<void> _loadBackgroundFor(LocationArea loc) async {
    // remove existing
    if (_background != null) {
      _background!.removeFromParent();
      _background = null;
    }

    // pick an asset per location (using available assets as placeholders)
    late String asset;
    switch (loc) {
      case LocationArea.farm:
        asset = 'grass.png';
        break;
      case LocationArea.fishing:
        asset = 'ground.png';
        break;
      case LocationArea.barn:
        asset = 'bush.png';
        break;
      case LocationArea.mines:
        asset = 'rock.png';
        break;
    }

    final sprite = await loadSprite(asset);
    final comp = SpriteComponent(sprite: sprite, size: size);
    // stretch to cover screen
    comp.position = Vector2.zero();
    comp.size = size;
    _background = comp;
    add(comp);

    // Add simple centered text for the location name overlaying background
    final text = TextComponent(
      text: loc.name.toUpperCase(),
      position: size / 2,
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    add(text);
  }

  void updateLocation(LocationArea newLocation) {
    location = newLocation;
    _loadBackgroundFor(newLocation);
  }
}
