import 'package:flutter/material.dart';

/// A lightweight pinch-zoom + pan wrapper suitable for grid/maps in the game.
/// - Uses InteractiveViewer with sensible defaults
/// - Optional reset on double-tap
class ZoomPanViewer extends StatefulWidget {
  final Widget child;
  final double minScale;
  final double maxScale;
  final EdgeInsets boundaryMargin;
  final bool clip;
  final bool enableDoubleTapReset;

  const ZoomPanViewer({
    super.key,
    required this.child,
    this.minScale = 0.9,
    this.maxScale = 3.0,
    this.boundaryMargin = const EdgeInsets.all(48),
    this.clip = true,
    this.enableDoubleTapReset = true,
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
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _resetTransform() {
    _controller?.value = Matrix4.identity();
  }

  @override
  Widget build(BuildContext context) {
    final content = InteractiveViewer(
      transformationController: _controller,
      minScale: widget.minScale,
      maxScale: widget.maxScale,
      boundaryMargin: widget.boundaryMargin,
      panEnabled: true,
      scaleEnabled: true,
      clipBehavior: widget.clip ? Clip.hardEdge : Clip.none,
      child: widget.child,
    );

    if (!widget.enableDoubleTapReset) return content;

    return GestureDetector(onDoubleTap: _resetTransform, child: content);
  }
}
