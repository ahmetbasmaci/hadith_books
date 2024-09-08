import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/core.dart';
import '../../../../features.dart';

class HadithHomeBody extends StatelessWidget {
  const HadithHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScrollbar(
      controller: context.read<HadithHomeCubit>().scrollController,
      child: GridView.builder(
        controller: context.read<HadithHomeCubit>().scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: AppSizes.xLargeSpace,
          mainAxisSpacing: AppSizes.xLargeSpace,
        ),
        physics: const BouncingScrollPhysics(),
        itemCount: HadithBooksEnum.values.length,
        itemBuilder: (context, index) {
          double paddingTop = (index == 0 || index == 1) ? AppSizes.screenPadding : 0;

          bool isEven = index % 2 == 0;

          double paddingLeft =
              context.isArabicLang ? (isEven ? 0 : AppSizes.screenPadding) : (isEven ? AppSizes.screenPadding : 0);

          double paddingRight =
              context.isArabicLang ? (isEven ? AppSizes.screenPadding : 0) : (isEven ? 0 : AppSizes.screenPadding);

          return Padding(
            padding: EdgeInsets.only(
              left: paddingLeft,
              right: paddingRight,
              top: paddingTop,
              bottom: AppSizes.screenPadding,
            ),
            child: HadithBookItemBtn(hadithBooksEnum: HadithBooksEnum.values[index]),
          );
        },
      ),
    );
  }
}
