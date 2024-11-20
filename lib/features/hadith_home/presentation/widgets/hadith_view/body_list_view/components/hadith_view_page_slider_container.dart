import 'package:flutter/material.dart';
import 'package:hadith_books/core/core.dart';
import 'package:hadith_books/features/hadith_home/presentation/widgets/hadith_view/body_list_view/components/hadith_view_page_slider.dart';

class HadithViewPageSliderContainer extends StatelessWidget {
  const HadithViewPageSliderContainer({super.key, required this.startIndex, required this.endIndex});

  final double startIndex;
  final double endIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(bottom: AppSizes.screenPadding),
      width: context.width,
      height: context.width * 0.1,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surface,
        //borderRadius: BorderRadius.circular(AppSizes.smallBorderRadius),
        boxShadow: [
          // BoxShadow(
          //   color: context.themeColors.onBackground.withOpacity(0.2),
          //   spreadRadius: 1,
          //   blurRadius: 5,
          //   offset: Offset(0, 3), // changes position of shadow
          // ),
        ],
      ),
      child: HadithViewPageSlider(startIndex: startIndex, length: endIndex),
    );
  }
}
