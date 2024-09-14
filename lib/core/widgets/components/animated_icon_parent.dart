import 'package:flutter/material.dart';

import '../../utils/resources/resources.dart';

class AnimatedIconParent extends StatelessWidget {
  const AnimatedIconParent({super.key, required this.child, required this.onPressed});
  final Widget child;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      highlightColor: Colors.transparent,
      icon: Card(
        // color: context.theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.smallBorderRadius),
          // side: BorderSide(color: context.theme.colorScheme.secondary),
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
                  child: child,
                ),
              );
            },
          ),
        ),
      ),
      onPressed: () => onPressed(),
    );
  }
}
