import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/core.dart';

import '../../features.dart';

class ChangeFontSizeSlider extends StatelessWidget {
  const ChangeFontSizeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: context.width * .30,
          child: BlocBuilder<ChangeFontSizeSliderCubit, ChangeFontSizeSliderState>(
            builder: (context, state) {
              return Slider(
                max: (AppSizes.maxFontSize),
                min: (AppSizes.minFontSize),
                activeColor: context.themeColors.primary.withOpacity(.5),
                thumbColor: context.themeColors.primary,
                divisions: AppSizes.fontSizeDivisions,
                value: _getValue(context),
                onChanged: (val) => context.read<ChangeFontSizeSliderCubit>().updateFontSize(val),
              );
            },
          ),
        )
      ],
    );
  }

  double _getValue(BuildContext context) {
    double currentValue = context.read<ChangeFontSizeSliderCubit>().state.fontSize;
    if (currentValue < AppSizes.minFontSize) {
      currentValue = AppSizes.minFontSize;
    }
    if (currentValue > AppSizes.maxFontSize) {
      currentValue = AppSizes.maxFontSize;
    }
    return currentValue;
  }
}
