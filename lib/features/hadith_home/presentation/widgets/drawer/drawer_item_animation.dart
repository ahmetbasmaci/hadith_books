import 'package:flutter/material.dart';

class DrawerItemAnimation extends StatefulWidget {
  const DrawerItemAnimation({super.key, required this.child, this.duration});
  final Widget child;
  final Duration? duration;
  @override
  State<DrawerItemAnimation> createState() => _DrawerItemAnimationState();
}

class _DrawerItemAnimationState extends State<DrawerItemAnimation> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: widget.duration ?? const Duration(milliseconds: 1000),
      vsync: this,
    )..forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (context, child) {
        return FadeTransition(
          opacity: Tween<double>(begin: 0, end: 1).animate(_controller),
          child: SizeTransition(
            axis: Axis.horizontal,
            sizeFactor: Tween<double>(begin: 0, end: 1).animate(_controller),
            // scale: Tween<double>(begin: 0.5, end: 1).animate(_controller),
            child: child,
          ),
        );
      },
    );
  }
}
