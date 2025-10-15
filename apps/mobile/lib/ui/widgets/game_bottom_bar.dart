import 'package:flutter/material.dart';

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
          _bottomIcon(Icons.notifications, label: 'Alerts', onTap: onAlerts),
          _bottomIcon(Icons.store, label: 'Shop', onTap: onShop),
          _bottomIcon(Icons.inventory, label: 'Bag', onTap: onBag),
          _bottomIcon(Icons.person, label: 'Profile', onTap: onProfile),
          const Spacer(),
          _bottomIcon(Icons.place, label: 'Location', onTap: onLocation),
        ],
      ),
    );
  }

  Widget _bottomIcon(
    IconData icon, {
    required String label,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: const Color(0xFFFFE7A0)),
              const SizedBox(height: 4),
              Text(
                label,
                style: const TextStyle(color: Color(0xFFFFE7A0), fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
