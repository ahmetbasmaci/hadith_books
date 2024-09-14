import 'package:flutter/material.dart';
import 'dart:math';

import 'package:hadith_books/core/core.dart';

class ProgressPainter extends CustomPainter {
  final double progress;
  final BuildContext context;
  const ProgressPainter(this.context, this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    // setup
    var linePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..color = context.themeColors.primary;

    var circlePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = context.themeColors.primary;

    final radians = (progress / 100) * 2 * pi;
    _drawArc(canvas, linePaint, circlePaint, -pi / 2, radians, size);
  }

  void _drawArc(
    Canvas canvas,
    Paint linePaint,
    Paint circlePaint,
    double startRadian,
    double sweepRadian,
    Size size,
  ) {
    final centerX = size.width / 2, centerY = size.height / 2;
    final centerOffset = Offset(centerX, centerY);
    final double radius = min(size.width, size.height) / 2;

    canvas.drawArc(Rect.fromCircle(center: centerOffset, radius: radius), startRadian, sweepRadian, false, linePaint);

    final x = radius * (1 + sin(sweepRadian)), y = radius * (1 - cos(sweepRadian));
    final circleOffset = Offset(x, y);
    canvas.drawCircle(circleOffset, 5, circlePaint);
  }

  @override
  // ignore: avoid_renaming_method_parameters
  bool shouldRepaint(CustomPainter old) => true;
}
