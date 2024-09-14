import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import '../../../core.dart';

class ShareButton extends StatelessWidget {
  final String content;
  final VoidCallback? onDone;
  const ShareButton({
    super.key,
    required this.content,
    this.onDone,
  });
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, state) {
        return AnimatedIconParent(
          child: AppIcons.share,
          onPressed: () async {
            await FlutterShare.share(title: content, text: content);

            onDone?.call();

            state(() {}); //setState to refresh animation
          },
        );
      },
    );
  }
}
