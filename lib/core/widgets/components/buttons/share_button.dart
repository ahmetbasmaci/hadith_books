import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../../../core.dart';

class ShareButton extends StatelessWidget {
  final String content;
  final VoidCallback? onDone;
  final Widget? child;
  const ShareButton({
    super.key,
    required this.content,
    this.onDone,
    this.child,
  });
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, state) {
        return AnimatedIconParent(
          color: context.themeColors.shareBtn,
          child: child ?? AppIcons.shareIcon(color: context.themeColors.shareBtn),
          onPressed: () async {
            await Share.share(content);

            onDone?.call();

            state(() {}); //setState to refresh animation
          },
        );
      },
    );
  }
}
