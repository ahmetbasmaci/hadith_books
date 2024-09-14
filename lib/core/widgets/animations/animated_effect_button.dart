import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../../core.dart';

class AnimatedEffectButton extends StatelessWidget {
  const AnimatedEffectButton({super.key, required this.child, required this.onPressed});
  final Widget child;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return LikeButton(
      size: AppSizes.smallIcon,
      circleColor: CircleColor(
        start: context.themeColors.primary.withOpacity(.1),
        end: context.themeColors.primary,
      ),
      bubblesColor: BubblesColor(
        dotPrimaryColor: context.themeColors.primary,
        dotSecondaryColor: context.themeColors.secondary,
        dotThirdColor: context.themeColors.third,
      ),
      isLiked: false,
      onTap: (isLiked) async {
        onPressed();
        return true;
      },
      likeBuilder: (bool isLiked) => child,
    );
  }
}
