import 'package:flutter/material.dart';
import 'package:hadith_books/core/core.dart';

class AppLinearProgressindicator extends StatelessWidget {
  const AppLinearProgressindicator({super.key});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      backgroundColor: context.themeColors.natural,
    );
  }
}
