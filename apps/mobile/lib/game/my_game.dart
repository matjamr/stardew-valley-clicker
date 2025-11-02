import 'package:flame/components.dart';
import 'package:flame/game.dart';
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

    // Background images are now handled by InteractiveTerrain widget
    // No need to load sprites here - Flame game is just used for overlays/logic
  }

  void updateLocation(LocationArea newLocation) {
    location = newLocation;
    _loadBackgroundFor(newLocation);
  }
}
