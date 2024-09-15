import 'package:flutter/material.dart';

class RotateAnimatedForEverWidget extends StatefulWidget {
  const RotateAnimatedForEverWidget({super.key, required this.child, this.duration});
  final Widget child;
  final Duration? duration;
  @override
  State<RotateAnimatedForEverWidget> createState() => _RotateAnimatedForEverWidgetState();
}

class _RotateAnimatedForEverWidgetState extends State<RotateAnimatedForEverWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration ?? const Duration(milliseconds: 2500),
    )..forward();
    _animationController.addListener(
      () {
        if (_animationController.value == 0) {
          _animationController.forward();
        } else if (_animationController.value == 1) {
          _animationController.reverse();
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween<double>(begin: 0.99, end: 1.01).animate(_animationController),
      child: widget.child,
    );
  }
}
