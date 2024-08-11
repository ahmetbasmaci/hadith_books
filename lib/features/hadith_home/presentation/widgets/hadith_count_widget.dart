import 'package:flutter/material.dart';

import '../../../../core/utils/resources/resources.dart';

class HadithCountWidget extends StatelessWidget {
  const HadithCountWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.xsmallSpace),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surface,
        border: Border.all(color: context.theme.colorScheme.secondary),
        borderRadius: BorderRadius.circular(AppSizes.smallBorderRadius),
      ),
      child: FittedBox(
        fit: BoxFit.cover,
        child: Text(text, style: AppStyles.normalBold),
      ),
    );
  }
}
