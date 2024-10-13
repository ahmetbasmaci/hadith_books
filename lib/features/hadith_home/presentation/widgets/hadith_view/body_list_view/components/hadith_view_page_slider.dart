import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/core.dart';

import '../../../../../../../config/local/l10n.dart';
import '../../../../../../features.dart';

class HadithViewPageSlider extends StatelessWidget {
  const HadithViewPageSlider({
    super.key,
    this.min = 0,
    required this.max,
  });
  final double min;
  final double max;
  @override
  Widget build(BuildContext context) {
    // double value = context.read<HadithViewCubit>().hadithPageViewController.hasClients
    //     ? context.read<HadithViewCubit>().hadithPageViewController.page ?? 0
    //     : 0;
    double value = 0;
    return BlocBuilder<HadithViewCubit, HadithViewState>(
      builder: (context, state) {
        if (state is HadithViewLoaded) {
          value = state.pageIndex.toDouble();
        }
        return Align(
          alignment: Alignment.topCenter,
          child: Slider.adaptive(
            inactiveColor: context.themeColors.natural,
            thumbColor: context.themeColors.primary,
            value: value,
            min: min,
            max: max,
            divisions: max.toInt(),
            label: '${AppStrings.of(context).hadithNumber} ${value.toInt()}',
            onChanged: (double newVal) {
              int page = newVal.toInt();
              context.read<HadithViewCubit>().updateHadithPage(page);
            },
          ),
        );
      },
    );
  }
}
