import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key, this.topPart, this.centerPart, this.bottomPart});
  final Widget? topPart;
  final Widget? centerPart;
  final Widget? bottomPart;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            topPart != null ? Expanded(flex: 1, child: topPart ?? const SizedBox()) : const SizedBox(),
            topPart != null ? const Divider() : const SizedBox(),
            centerPart != null ? Expanded(flex: 7, child: centerPart ?? const SizedBox()) : const SizedBox(),
            centerPart != null ? const Divider() : const SizedBox(),
            bottomPart != null ? Expanded(flex: 1, child: bottomPart ?? const SizedBox()) : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
