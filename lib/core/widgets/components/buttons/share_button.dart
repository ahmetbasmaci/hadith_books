import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import '../../../utils/resources/resources.dart';
import '../icon_parent.dart';

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
    return IconButton(          padding: EdgeInsets.zero,
      onPressed: () async {
        await FlutterShare.share(title: content, text: content);

        onDone?.call();
      },
      icon: IconParent(child: AnimatedSwitcher(duration: const Duration(milliseconds: 300), child: AppIcons.share)),
    );
  }
}
