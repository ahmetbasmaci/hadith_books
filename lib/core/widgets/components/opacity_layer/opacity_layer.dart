import 'package:flutter/material.dart';

import '../../../core.dart';

class OpacityLayer extends StatelessWidget {
  const OpacityLayer({
    super.key,
    required this.useTopOpacityContainer,
    required this.useBottomOpacityContainer,
    required this.child,
    this.color,
    this.height,
    this.startOpacity,
    this.useBottomnavigationBarMargin = true,
  });
  final Widget child;
  final bool useTopOpacityContainer;
  final bool useBottomOpacityContainer;
  final Color? color;
  final double? height;
  final double? startOpacity;
  final bool useBottomnavigationBarMargin;
  @override
  Widget build(BuildContext context) {
    Color color = this.color ?? context.themeColors.background;
    return Stack(
      children: [
        Column(
          children: <Widget>[
            Expanded(
              child: child,
            ),
            if (useBottomnavigationBarMargin) SizedBox(height: kBottomNavigationBarHeight * 3)
          ],
        ),
        if (useTopOpacityContainer)
          Align(
            alignment: Alignment.topCenter,
            child: OpacityContainer(
              color: color,
              upToDown: true,
              height: height,
              startOpacity: startOpacity,
            ),
          ),
        if (useBottomOpacityContainer)
          Positioned(
            bottom: 0,
            child: OpacityContainer(
              color: color,
              upToDown: false,
              height: height,
            ),
          ),
      ],
    );
  }
}
