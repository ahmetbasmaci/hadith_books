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
            if (topPart != null) ...[
              Expanded(flex: 1, child: topPart!),
              const Divider(),
            ],
            if (centerPart != null) ...[
              Expanded(flex: 7, child: centerPart!),
              const Divider(),
            ],
            if (bottomPart != null) ...[
              Expanded(flex: 1, child: bottomPart!),
            ],
          ],
        ),
      ),
    );
  }
}
