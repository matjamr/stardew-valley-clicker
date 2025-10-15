import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:mobile/game/model/location.dart';

import 'game_icon_button.dart';

enum LocationMenuAnchor { auto, bottomRight, centerRight }

class LocationRadialMenu extends StatelessWidget {
  final bool isOpen;
  final LocationArea current;
  final ValueChanged<LocationArea> onSelect;

  /// Optional: provide the padding from screen edges to place the cluster.
  /// For bottomRight, bottom padding should clear the bottom bar.
  final EdgeInsets padding;

  /// Where to anchor the cluster. auto = choose based on screen height.
  final LocationMenuAnchor anchor;

  const LocationRadialMenu({
    super.key,
    required this.isOpen,
    required this.current,
    required this.onSelect,
    this.padding = const EdgeInsets.only(right: 16, bottom: 68),
    this.anchor = LocationMenuAnchor.auto,
  });

  @override
  Widget build(BuildContext context) {
    // Theme colors consistent with the app
    const cardColor = Color(0xFF3B2A24);
    const borderColor = Color(0xFF7C5A4A);
    const textColor = Color(0xFFFFE7A0);

    final size = MediaQuery.of(context).size;
    final viewInsets = MediaQuery.viewPaddingOf(context);

    // Decide anchor automatically for small heights to avoid overflow.
    final effectiveAnchor = anchor == LocationMenuAnchor.auto
        ? (size.height < 640
              ? LocationMenuAnchor.centerRight
              : LocationMenuAnchor.bottomRight)
        : anchor;

    // Build item layouts based on anchor.
    late final Alignment alignment;
    late final List<_LocItem> items;
    late final double boxWidth;
    late final double boxHeight;
    late final EdgeInsets effectivePadding;

    if (effectiveAnchor == LocationMenuAnchor.centerRight) {
      alignment = Alignment.centerRight;
      // Arrange items on a semicircle arc from -180° to 180° originating at center-right.
      final arcStart = -90.0;
      final arcEnd = 90.0;
      final count = 4; // we have four locations
      final radius = [
        size.width * 0.22,
        size.height * 0.22,
        120.0,
      ].reduce((a, b) => a < b ? a : b);
      final step = count == 1 ? 0.0 : (arcEnd - arcStart) / (count - 1);
      final computed = <_LocItem>[];
      final defs = [
        (LocationArea.farm, Icons.agriculture, 'Farm'),
        (LocationArea.fishing, Icons.water, 'Fishing'),
        (LocationArea.barn, Icons.pets, 'Barn'),
        (LocationArea.mines, Icons.terrain, 'Mines'),
      ];
      for (var i = 0; i < count; i++) {
        final angleDeg = arcStart + step * i;
        final rad = angleDeg * 3.141592653589793 / 180.0;
        final x = radius * math.cos(rad);
        final y = radius * math.sin(rad);
        // UI coords: we use Positioned(right, bottom). Positive right moves left; positive bottom moves up.
        final dx = x; // allow negative to overflow to right slightly if needed
        final dy = y; // dy>0 goes up, dy<0 goes down
        final def = defs[i];
        computed.add(
          _LocItem(
            area: def.$1,
            icon: def.$2,
            label: def.$3,
            offset: Offset(dx, dy),
          ),
        );
      }
      items = computed;
      // Box sized to cover full arc area around the origin point.
      boxWidth = radius + 140; // extend leftwards enough for labels
      boxHeight = radius * 2 + 80; // span up and down around center
      // Respect right safe area.
      effectivePadding = EdgeInsets.only(
        right: padding.right + viewInsets.right + 8,
      );
    } else {
      alignment = Alignment.bottomRight;
      // Fan upward/left so nothing is pushed below bottom bar.
      items = <_LocItem>[
        _LocItem(
          area: LocationArea.farm,
          icon: Icons.agriculture,
          label: 'Farm',
          offset: const Offset(0, -72),
        ),
        _LocItem(
          area: LocationArea.fishing,
          icon: Icons.water,
          label: 'Fishing',
          offset: const Offset(-64, -24),
        ),
        _LocItem(
          area: LocationArea.barn,
          icon: Icons.pets,
          label: 'Barn',
          offset: const Offset(-96, -72),
        ),
        _LocItem(
          area: LocationArea.mines,
          icon: Icons.terrain,
          label: 'Mines',
          offset: const Offset(-64, -120),
        ),
      ];
      boxWidth = 240;
      boxHeight = 240;
      // Add system safe area to provided bottom padding to clear bottom bar + gesture area.
      effectivePadding = EdgeInsets.only(
        right: padding.right + viewInsets.right + 8,
        bottom: padding.bottom + viewInsets.bottom + 8,
      );
    }

    return IgnorePointer(
      ignoring: !isOpen,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 220),
        opacity: isOpen ? 1.0 : 0.0,
        child: Padding(
          padding: effectivePadding,
          child: Align(
            alignment: alignment,
            child: SizedBox(
              width: boxWidth,
              height: boxHeight,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Cluster items
                  for (final it in items)
                    _AnimatedLocButton(
                      isOpen: isOpen,
                      delay: items.indexOf(it) * 30,
                      offset: it.offset,
                      baseRight: 0,
                      baseBottom:
                          effectiveAnchor == LocationMenuAnchor.centerRight
                          ? boxHeight / 2
                          : 0,
                      child: GameIconButton(
                        selected: current == it.area,
                        icon: it.icon,
                        label: it.label,
                        onTap: () => onSelect(it.area),
                        style: GameIconButtonStyle.card,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AnimatedLocButton extends StatelessWidget {
  final bool isOpen;
  final int delay; // ms
  final Offset offset;
  final double baseRight;
  final double baseBottom;
  final Widget child;

  const _AnimatedLocButton({
    required this.isOpen,
    required this.delay,
    required this.offset,
    this.baseRight = 0,
    this.baseBottom = 0,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: isOpen ? 1 : 0),
      duration: Duration(milliseconds: 240 + delay),
      curve: Curves.easeOutBack,
      builder: (context, t, _) {
        final dx = offset.dx * t;
        final dy = offset.dy * t;
        return Positioned(
          right: baseRight + dx,
          bottom: baseBottom + dy,
          child: Transform.scale(
            scale: 0.9 + 0.1 * t,
            child: Opacity(opacity: t.clamp(0, 1), child: child),
          ),
        );
      },
    );
  }
}

class _LocItem {
  final LocationArea area;
  final IconData icon;
  final String label;
  final Offset offset;
  const _LocItem({
    required this.area,
    required this.icon,
    required this.label,
    required this.offset,
  });
}
