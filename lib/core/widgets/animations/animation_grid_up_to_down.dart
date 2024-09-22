import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimationGridUpToDown extends StatelessWidget {
  const AnimationGridUpToDown({
    super.key,
    required this.index,
    required this.columnCount,
    required this.child,
    this.duration,
  });
  final int index;
  final int columnCount;
  final Widget child;
  final Duration? duration;
  @override
  Widget build(BuildContext context) {
    var durationToUse = duration ?? const Duration(milliseconds: 700);
    return AnimationConfiguration.staggeredGrid(
      position: index,
      key:key,
      columnCount: columnCount,
      duration: durationToUse,
      child: SlideAnimation(
        duration: durationToUse,
        verticalOffset: 100.0,
        child: ScaleAnimation(
          duration: durationToUse,
          curve: Curves.fastLinearToSlowEaseIn,
          scale: .2,
          child: FadeInAnimation(
            duration: durationToUse,
            child: child,
          ),
        ),
      ),
    );
  }
}

class AnimationGridUpToDownParent extends StatelessWidget {
  const AnimationGridUpToDownParent({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(child: child);
  }
}
