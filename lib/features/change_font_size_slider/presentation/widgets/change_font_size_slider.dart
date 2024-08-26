import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';

import '../../../features.dart';

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
                activeColor: context.themeColors.primary,
                thumbColor: context.themeColors.background,
                divisions: 5,
                value: context.read<ChangeFontSizeSliderCubit>().state.fontSize,
                onChanged: (val) => context.read<ChangeFontSizeSliderCubit>().updateFontSize(val),
              );
            },
          ),
        )
      ],
    );
  }
}
