import 'package:flutter/material.dart';

class ScaleAnimatedForEverWidget extends StatefulWidget {
  const ScaleAnimatedForEverWidget({super.key, required this.child});
  final Widget child;
  @override
  State<ScaleAnimatedForEverWidget> createState() => _ScaleAnimatedForEverWidgetState();
}

class _ScaleAnimatedForEverWidgetState extends State<ScaleAnimatedForEverWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
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
    return ScaleTransition(
      scale: Tween<double>(begin: 0.9, end: 1.1).animate(_animationController),
      child: widget.child,
    );
  }
}
