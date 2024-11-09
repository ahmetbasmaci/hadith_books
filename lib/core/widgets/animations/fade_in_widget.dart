import 'package:flutter/material.dart';

class FadeInText extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const FadeInText({super.key, required this.child, this.duration = const Duration(milliseconds: 1000)});

  @override
  FadeInTextState createState() => FadeInTextState();
}

class FadeInTextState extends State<FadeInText> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: widget.child,
    );
  }
}
