import 'package:flutter/material.dart';
import 'package:hadith_books/config/local/l10n.dart';

import '../../../core/core.dart';
import '../../features.dart';

class ChangeFontSizeSliderWithText extends StatelessWidget {
  const ChangeFontSizeSliderWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: context.isArabicLang ? Alignment.centerRight : Alignment.centerLeft,
            child: Text(
              AppStrings.of(context).fontSize,
              style: AppStyles.smallBold,
            ),
          ),
        ),
        HorizontalSpace.xLarge(),
        const ChangeFontSizeSlider()
      ],
    );
  }
}
