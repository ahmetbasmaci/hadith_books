import 'package:flutter/material.dart';

import '../../../../../core/core.dart';

class CountCirculeAvatar extends StatelessWidget {
  const CountCirculeAvatar({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(AppSizes.borderRadius),
            bottomLeft: Radius.circular(AppSizes.borderRadius),
          ),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(text, style: AppStyles.normal.bold),
        ),
      ),
    );
  }
}
