import 'package:flutter/material.dart';

class AppScrollbar extends StatelessWidget {
  const AppScrollbar({super.key, required this.child, required this.controller});
  final Widget child;
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: controller,

      thickness: 6,
      // thumbVisibility: true,
      trackVisibility: true,
      interactive: false,

      radius: const Radius.circular(100),
      child: child,
    );
  }
}
