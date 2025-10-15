import 'package:flutter/material.dart';

class HudPill extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const HudPill({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: const Color(0x802E1F1A),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF7C5A4A), width: 2),
        boxShadow: const [
          BoxShadow(color: Colors.black45, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: child,
    );
  }
}
