import 'package:flutter/material.dart';

import 'game_icon_button.dart';

class GameBottomBar extends StatelessWidget {
  final VoidCallback onAlerts;
  final VoidCallback onShop;
  final VoidCallback onBag;
  final VoidCallback onProfile;
  final VoidCallback onLocation;

  const GameBottomBar({
    super.key,
    required this.onAlerts,
    required this.onShop,
    required this.onBag,
    required this.onProfile,
    required this.onLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: const BoxDecoration(
        color: Color(0xCC2E1F1A),
        border: Border(top: BorderSide(color: Color(0xFF7C5A4A), width: 2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          GameIconButton(
            icon: Icons.notifications,
            label: 'Alerts',
            onTap: onAlerts,
            style: GameIconButtonStyle.flat,
          ),
          GameIconButton(
            icon: Icons.store,
            label: 'Shop',
            onTap: onShop,
            style: GameIconButtonStyle.flat,
          ),
          GameIconButton(
            icon: Icons.inventory,
            label: 'Bag',
            onTap: onBag,
            style: GameIconButtonStyle.flat,
          ),
          GameIconButton(
            icon: Icons.person,
            label: 'Profile',
            onTap: onProfile,
            style: GameIconButtonStyle.flat,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
