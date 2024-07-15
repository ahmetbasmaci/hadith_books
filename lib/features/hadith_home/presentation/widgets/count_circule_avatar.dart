import 'package:flutter/material.dart';

import '../../../../core/utils/resources/resources.dart';

class CountCirculeAvatar extends StatelessWidget {
  const CountCirculeAvatar({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: CircleAvatar(
        backgroundColor: context.themeColors.secondary.withOpacity(.2),
        foregroundColor: context.theme.colorScheme.onSurface,
        child: FittedBox(
          fit: BoxFit.cover,
          child: Text(text, style: AppStyles.normalBold),
        ),
      ),
    );
  }
}
