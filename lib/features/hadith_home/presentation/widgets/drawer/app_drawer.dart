import 'package:flutter/material.dart';
import 'package:hadith_books/core/core.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key, this.topPart, this.centerPart, this.bottomPart});
  final Widget? topPart;
  final Widget? centerPart;
  final Widget? bottomPart;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.themeColors.background,
      child: SafeArea(
        child: Column(
          children: [
            if (topPart != null) ...[
              Expanded(flex: 2, child: topPart!),
              const Divider(),
            ],
            if (centerPart != null) ...[
              Expanded(flex: 12, child: centerPart!),
            ],
            if (bottomPart != null) ...[
              const Divider(),
              Expanded(flex: 1, child: bottomPart!),
            ],
          ],
        ),
      ),
    );
  }
}
