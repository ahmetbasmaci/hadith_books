import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/core.dart';
import '../../../../features.dart';

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
      switchAnimationConfig: SwitchAnimationConfig(
        duration: const Duration(milliseconds: 700),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
      textBoneBorderRadius: const TextBoneBorderRadius.fromHeightFactor(.5),
      effect: const ShimmerEffect(),
      child: child,
    );
  }
}
