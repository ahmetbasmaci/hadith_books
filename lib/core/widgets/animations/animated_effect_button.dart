import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../../core.dart';

class AnimatedEffectButton extends StatelessWidget {
  const AnimatedEffectButton({super.key, required this.child, required this.onPressed, this.color});
  final Widget child;
  final VoidCallback onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    Color color = this.color ?? context.themeColors.primary;
    return StatefulBuilder(
      builder: (BuildContext context, setState) {
        return LikeButton(
          size: AppSizes.smallIcon,
          circleColor: CircleColor(
            start: context.themeColors.primary.withOpacity(.1),
            end: context.themeColors.primary,
          ),
          bubblesColor: BubblesColor(
            dotPrimaryColor: color,
            dotSecondaryColor: color,
            dotThirdColor: color,
            dotLastColor: color,
          ),
          isLiked: false,
          onTap: (isLiked) async {
            onPressed();
            setState(() {});
            return true;
          },
          likeBuilder: (bool isLiked) => child,
        );
      },
    );
  }
}
