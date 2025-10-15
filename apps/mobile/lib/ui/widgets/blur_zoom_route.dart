import 'dart:ui';

import 'package:flutter/material.dart';

/// A subtle game-like transition that blurs the background (previous page)
/// while the new page fades and scales in slightly.
class BlurZoomPageRoute<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;

  BlurZoomPageRoute({
    required this.builder,
    RouteSettings? settings,
    Duration transitionDuration = const Duration(milliseconds: 400),
    Duration reverseTransitionDuration = const Duration(milliseconds: 300),
  }) : super(
         settings: settings,
         pageBuilder: (context, animation, secondaryAnimation) =>
             builder(context),
         transitionDuration: transitionDuration,
         reverseTransitionDuration: reverseTransitionDuration,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           final curved = CurvedAnimation(
             parent: animation,
             curve: Curves.easeOutCubic,
             reverseCurve: Curves.easeInCubic,
           );

           final blur = Tween<double>(begin: 0.0, end: 10.0).animate(curved);
           final scale = Tween<double>(begin: 0.985, end: 1.0).animate(curved);
           final opacity = Tween<double>(begin: 0.0, end: 1.0).animate(curved);

           return AnimatedBuilder(
             animation: animation,
             builder: (context, _) {
               return Stack(
                 fit: StackFit.expand,
                 children: [
                   // Blur whatever is behind this route (previous screen)
                   ClipRect(
                     child: BackdropFilter(
                       filter: ImageFilter.blur(
                         sigmaX: blur.value,
                         sigmaY: blur.value,
                       ),
                       child: Container(color: Colors.transparent),
                     ),
                   ),
                   FadeTransition(
                     opacity: opacity,
                     child: ScaleTransition(scale: scale, child: child),
                   ),
                 ],
               );
             },
           );
         },
       );
}
