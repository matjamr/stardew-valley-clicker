import 'dart:ui';

import 'package:flutter/material.dart';

/// A cozy, centered modal that matches the app theme.
/// Use with [showGameCenteredModal] to get blur + scale/fade animations.
class GameCenteredModal extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry padding;

  const GameCenteredModal({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding = const EdgeInsets.all(16.0),
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final content = Material(
      color: const Color(0xFF3B2A24),
      elevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFF7C5A4A), width: 2),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: width ?? 520,
          maxHeight: height ?? 600,
          // also enforce minimum for small content
          minWidth: 280,
        ),
        child: Padding(
          padding: padding,
          child: Stack(
            children: [
              // content
              Positioned.fill(
                child: DefaultTextStyle(
                  style:
                      theme.textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFFFFF3C4),
                      ) ??
                      const TextStyle(color: Color(0xFFFFF3C4)),
                  child: child,
                ),
              ),
              // close button
              Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                  tooltip: 'Close',
                  icon: const Icon(Icons.close, color: Color(0xFFFFE7A0)),
                  onPressed: () => Navigator.of(context).maybePop(),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return Center(child: content);
  }
}

Future<T?> showGameCenteredModal<T>({
  required BuildContext context,
  required Widget child,
  double? width,
  double? height,
  bool barrierDismissible = true,
}) {
  return showGeneralDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierLabel: 'Dismiss',
    barrierColor: Colors.black.withOpacity(0.3),
    transitionDuration: const Duration(milliseconds: 260),
    pageBuilder: (context, anim, secondaryAnim) {
      // The backdrop blur + centered card
      return Stack(
        children: [
          // Blur whatever is behind
          Positioned.fill(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),
          // Centered modal
          SafeArea(
            child: GameCenteredModal(
              width: width,
              height: height,
              child: child,
            ),
          ),
        ],
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final curved = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutBack,
        reverseCurve: Curves.easeInCubic,
      );
      final scale = Tween<double>(begin: 0.92, end: 1.0).animate(curved);
      final opacity = Tween<double>(begin: 0.0, end: 1.0).animate(curved);
      return FadeTransition(
        opacity: opacity,
        child: ScaleTransition(scale: scale, child: child),
      );
    },
  );
}
