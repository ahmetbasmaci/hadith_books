import 'package:flutter/material.dart';

class DrawerItemAnimation extends StatefulWidget {
  const DrawerItemAnimation({super.key, required this.child, this.duration});
  final Widget child;
  final Duration? duration;
  @override
  State<DrawerItemAnimation> createState() => _DrawerItemAnimationState();
}

class _DrawerItemAnimationState extends State<DrawerItemAnimation> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: widget.duration ?? const Duration(milliseconds: 1000),
      vsync: this,
    )..forward();

    super.initState();
  }
@override

  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: widget.child,
      builder: (context, child) {
        return FadeTransition(
          opacity: Tween<double>(begin: 0, end: 1).animate(_animationController),
          child: SizeTransition(
            axis: Axis.horizontal,
            sizeFactor: Tween<double>(begin: 0, end: 1).animate(_animationController),
            // scale: Tween<double>(begin: 0.5, end: 1).animate(_controller),
            child: child,
          ),
        );
      },
    );
  }
}
