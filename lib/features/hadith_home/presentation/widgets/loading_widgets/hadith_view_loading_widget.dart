import 'package:flutter/material.dart';
import 'package:hadith_books/core/core.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HadithViewLoadingWidget extends StatelessWidget {
  const HadithViewLoadingWidget({super.key, required this.isLoading, required this.child});

  final bool isLoading;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      justifyMultiLineText: false,
      enableSwitchAnimation: true,
      textBoneBorderRadius: const TextBoneBorderRadius.fromHeightFactor(.2),
      effect: ShimmerEffect(
        baseColor: context.themeColors.onBackground.withOpacity(.1),
        highlightColor: context.themeColors.primary.withOpacity(.5),
        duration: const Duration(milliseconds: 500),
      ),
      switchAnimationConfig: SwitchAnimationConfig(
        duration: const Duration(milliseconds: 1000),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation.drive(CurveTween(curve: Curves.easeInOut)),
            child: child,
          );
        },
      ),
      child: child,
    );
  }
}
