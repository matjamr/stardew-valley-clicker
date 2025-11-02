import 'package:flutter/material.dart';

/// A lightweight pinch-zoom + pan wrapper suitable for grid/maps in the game.
/// - Uses InteractiveViewer with sensible defaults
/// - Optional reset on double-tap
/// - Prevents zooming out beyond image bounds by setting minScale to 1.0
/// - Can start with initial zoom for better UX
class ZoomPanViewer extends StatefulWidget {
  final Widget child;
  final double minScale;
  final double maxScale;
  final double initialScale; // Starting zoom level
  final EdgeInsets boundaryMargin;
  final bool clip;
  final bool enableDoubleTapReset;
  final bool constrainScale; // If true, prevents zooming out beyond bounds

  const ZoomPanViewer({
    super.key,
    required this.child,
    this.minScale = 1.0,
    this.maxScale = 3.0,
    this.initialScale = 1.5, // Start zoomed in by default
    this.boundaryMargin = const EdgeInsets.all(48),
    this.clip = true,
    this.enableDoubleTapReset = true,
    this.constrainScale = true,
  });

  @override
  State<ZoomPanViewer> createState() => _ZoomPanViewerState();
}

class _ZoomPanViewerState extends State<ZoomPanViewer> {
  TransformationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = TransformationController();
    // Set initial zoom level
    if (widget.initialScale != 1.0) {
      _controller!.value = Matrix4.identity()..scale(widget.initialScale);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _resetTransform() {
    // Reset to initial scale instead of 1.0
    if (widget.initialScale != 1.0) {
      _controller?.value = Matrix4.identity()..scale(widget.initialScale);
    } else {
      _controller?.value = Matrix4.identity();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use constrained scale or provided minScale
    final effectiveMinScale = widget.constrainScale ? 1.0 : widget.minScale;

    final content = InteractiveViewer(
      transformationController: _controller,
      minScale: effectiveMinScale,
      maxScale: widget.maxScale,
      boundaryMargin: widget.boundaryMargin,
      panEnabled: true,
      scaleEnabled: true,
      clipBehavior: widget.clip ? Clip.hardEdge : Clip.none,
      constrained: false, // Allow child to determine size
      child: widget.child,
    );

    if (!widget.enableDoubleTapReset) return content;

    return GestureDetector(onDoubleTap: _resetTransform, child: content);
  }
}
