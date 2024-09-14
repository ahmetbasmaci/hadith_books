import 'package:flutter/material.dart';

class AnimatedSwicherTransition extends StatelessWidget {
  const AnimatedSwicherTransition({super.key, required this.child, this.duration});
  final Duration? duration;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration ?? const Duration(milliseconds: 500),
      child: child,
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: ScaleTransition(scale: animation, child: child),
      ),
    );
  }
}
