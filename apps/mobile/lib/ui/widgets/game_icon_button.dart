import 'package:flutter/material.dart';

/// Unified icon+label button used across the game UI.
///
/// Supports two styles:
/// - flat: minimal icon+label (used in bottom bar)
/// - card: bordered pill (used in location radial menu and standalone location button)
class GameIconButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool selected;
  final GameIconButtonStyle style;

  const GameIconButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.selected = false,
    this.style = GameIconButtonStyle.flat,
  });

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case GameIconButtonStyle.flat:
        return _FlatIconButton(icon: icon, label: label, onTap: onTap);
      case GameIconButtonStyle.card:
        return _CardIconButton(
          icon: icon,
          label: label,
          onTap: onTap,
          selected: selected,
        );
    }
  }
}

enum GameIconButtonStyle { flat, card }

class _FlatIconButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _FlatIconButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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

class _CardIconButton extends StatelessWidget {
  final bool selected;
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _CardIconButton({
    required this.selected,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const cardColor = Color(0xFF3B2A24);
    const borderColor = Color(0xFF7C5A4A);
    const textColor = Color(0xFFFFE7A0);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? textColor : borderColor,
            width: 2,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: textColor, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: textColor,
                fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
