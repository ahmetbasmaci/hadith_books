import 'package:flutter/material.dart';

import '../../../features.dart';

class AnimatedIndicator extends StatefulWidget {
  final Duration duration;
  final double size;
  final VoidCallback callback;
  const AnimatedIndicator({super.key, required this.duration, required this.size, required this.callback});

  @override
  State<AnimatedIndicator> createState() => _AnimatedIndicatorState();
}

class _AnimatedIndicatorState extends State<AnimatedIndicator> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(duration: widget.duration, vsync: this);
    animation = Tween(begin: 0.0, end: 100.0).animate(controller)
      ..addListener(
        () {
          setState(() {});
        },
      )
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            controller.reset();
            widget.callback();
          }
        },
      );
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return CustomPaint(
          size: Size(widget.size, widget.size),
          painter: ProgressPainter(context, animation.value),
        );
      },
    );
  }
}
