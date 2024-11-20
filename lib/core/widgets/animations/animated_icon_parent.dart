import 'package:flutter/material.dart';

import '../../core.dart';

class AnimatedIconParent extends StatelessWidget {
  const AnimatedIconParent({super.key, required this.child, required this.onPressed, required this.color});
  final Widget child;
  final VoidCallback onPressed;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.smallBorderRadius),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppSizes.smallSpace),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          child: child,
          transitionBuilder: (child, animation) {
            return RotationTransition(
              turns: Tween<double>(begin: .5, end: 1).animate(animation),
              child: FadeTransition(
                opacity: animation,
                child: AnimatedEffectButton(onPressed: onPressed,color:color, child: child),
              ),
            );
          },
        ),
      ),
    );
  }
}
