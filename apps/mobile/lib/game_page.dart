import 'dart:async';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:mobile/game/my_game.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late MyGame _game;
  LocationArea _location = LocationArea.farm;
  int _energy = 100; // mocked energy
  int _notifications = 2; // mocked notifications
  late Timer _clockTimer;
  TimeOfDay _timeOfDay = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    _game = MyGame(location: _location);
    _clockTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => _timeOfDay = TimeOfDay.now());
    });
  }

  @override
  void dispose() {
    _clockTimer.cancel();
    super.dispose();
  }

  void _pickLocation() async {
    final selected = await showModalBottomSheet<LocationArea>(
      context: context,
      backgroundColor: const Color(0xFF2E1F1A),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              _locationTile(LocationArea.farm, Icons.agriculture, 'Farm'),
              _locationTile(LocationArea.fishing, Icons.water, 'Fishing'),
              _locationTile(LocationArea.barn, Icons.pets, 'Barn'),
              _locationTile(LocationArea.mines, Icons.landscape, 'Mines'),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
    if (selected != null && selected != _location) {
      setState(() => _location = selected);
      _game.updateLocation(selected);
    }
  }

  ListTile _locationTile(LocationArea area, IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFFFFE7A0)),
      title: Text(title, style: const TextStyle(color: Color(0xFFFFE7A0))),
      selected: _location == area,
      onTap: () => Navigator.of(context).pop(area),
    );
  }

  @override
  Widget build(BuildContext context) {
    final timeLabel = _timeOfDay.format(context);

    return Scaffold(
      backgroundColor: const Color(0xFF1B1B1B),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(child: GameWidget(game: _game)),
            // Top-left notifications
            Positioned(
              left: 8,
              top: 8,
              child: _pill(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 18,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '$_notifications',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Top-right clock and energy
            Positioned(
              right: 8,
              top: 8,
              child: Row(
                children: [
                  _pill(
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/clock.png',
                          width: 16,
                          height: 16,
                          errorBuilder: (_, __, ___) => const Icon(
                            Icons.access_time,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          timeLabel,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  _pill(
                    child: Row(
                      children: [
                        const Icon(Icons.bolt, color: Colors.yellow, size: 16),
                        const SizedBox(width: 6),
                        Text(
                          '$_energy',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Bottom bar with 5 buttons
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xCC2E1F1A),
                  border: const Border(
                    top: BorderSide(color: Color(0xFF7C5A4A), width: 2),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 8,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    _bottomIcon(
                      Icons.notifications,
                      label: 'Alerts',
                      onTap: () {
                        setState(() => _notifications = 0);
                      },
                    ),
                    _bottomIcon(Icons.store, label: 'Shop', onTap: () {}),
                    _bottomIcon(Icons.backpack, label: 'Bag', onTap: () {}),
                    _bottomIcon(Icons.person, label: 'Profile', onTap: () {}),
                    const Spacer(),
                    _bottomIcon(
                      Icons.map,
                      label: 'Location',
                      onTap: _pickLocation,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _pill({required Widget child}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0x99212121),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0xFF7C5A4A), width: 1.5),
      ),
      child: child,
    );
  }

  Widget _bottomIcon(
    IconData icon, {
    required String label,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkResponse(
            onTap: onTap,
            radius: 28,
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFF4A372F),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF7C5A4A), width: 2),
              ),
              child: Icon(icon, color: const Color(0xFFFFE7A0)),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(color: Color(0xFFFFE7A0), fontSize: 11),
          ),
        ],
      ),
    );
  }
}
