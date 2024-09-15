import 'package:flutter/material.dart';

import '../../../core.dart';

class CopyButton extends StatefulWidget {
  const CopyButton({super.key, required this.content, this.onDone});
  final String content;
  final VoidCallback? onDone;
  @override
  State<CopyButton> createState() => _CopyButtonState();
}

class _CopyButtonState extends State<CopyButton> with SingleTickerProviderStateMixin {
  bool isCopyed = false;
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedIconParent(
      child: isCopyed
          ? (AppIcons.copyFillIcon(key: const ValueKey('key1')))
          : (AppIcons.copyIcon(key: const ValueKey('key2'))),
      onPressed: () => copyPressed(),
    );
  }

  Future<void> copyPressed() async {
    if (mounted) {
      _animationController.forward();
    }
    ClipboardHelper.copyText(widget.content);
    setState(() => isCopyed = true);
    widget.onDone?.call();
    await Future.delayed(const Duration(milliseconds: 1500));
    if (mounted && _animationController.isCompleted) {
      _animationController.reverse();
    }

    if (mounted) setState(() => isCopyed = false);
  }
}
