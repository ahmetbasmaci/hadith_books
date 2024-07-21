import 'package:flutter/material.dart';

class AppCircularProgressIndicator extends StatelessWidget {
  const AppCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 400),
        opacity: 1,
        child: Icon(Icons.refresh, size: 50),
      ),
    );
  }
}
