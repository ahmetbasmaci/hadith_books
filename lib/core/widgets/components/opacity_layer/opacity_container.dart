import 'package:flutter/material.dart';
import 'package:hadith_books/core/core.dart';

class OpacityContainer extends StatelessWidget {
  const OpacityContainer({
    super.key,
    required this.color,
    this.height,
    required this.upToDown,
    double? startOpacity,
  })  : assert(startOpacity == null || (startOpacity >= 0 && startOpacity <= 1)),
        startOpacity = startOpacity ?? 0.6;
  final Color? color;
  final double? height;
  final bool upToDown;
  final double startOpacity;

  @override
  Widget build(BuildContext context) {
    Color color = this.color ?? context.themeColors.background;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: upToDown
              ? [
                  color.withOpacity(startOpacity),
                  color.withOpacity(0),
                ]
              : [
                  color.withOpacity(0),
                  color.withOpacity(startOpacity),
                ],
        ),
      ),
      width: context.width,
      height: height ?? 50,
    );
  }
}
