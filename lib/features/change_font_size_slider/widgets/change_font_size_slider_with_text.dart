import 'package:flutter/material.dart';
import 'package:hadith_books/config/local/l10n.dart';

import '../../../core/core.dart';
import '../../features.dart';

class ChangeFontSizeSliderWithText extends StatelessWidget {
  const ChangeFontSizeSliderWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Image.asset(
        //   AppImages.letterA1,
        //   width: AppSizes.icon,
        //   height: AppSizes.icon,
        // ),
        Text(AppStrings.of(context).fontSize, style: AppStyles.normal),
        const ChangeFontSizeSlider()
      ],
    );
  }
}
