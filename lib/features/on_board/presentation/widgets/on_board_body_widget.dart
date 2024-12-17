import 'package:flutter/material.dart';
import 'package:hadith_books/config/local/l10n.dart';

import 'package:hadith_books/core/core.dart';
import 'package:lottie/lottie.dart';

import '../../../features.dart';

class OnBoardBodyWidget extends StatelessWidget {
  final String animationPath;
  final String title;
  final String subtitle;
  final VoidCallback onNext;
  final VoidCallback onSkip;

  const OnBoardBodyWidget({
    super.key,
    required this.animationPath,
    required this.title,
    required this.subtitle,
    required this.onNext,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Lottie.asset(animationPath, repeat: true),
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: <Widget>[
              Spacer(),
              _content(context),
              VerticalSpace.small(),
              _dotIndecator(context),
              VerticalSpace.small(),
              _btnSkip(context),
              VerticalSpace.xxLarge(),
            ],
          ),
        )
      ],
    );
  }

  Widget _dotIndecator(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.screenPadding),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OnBoardDotIndecator(index: 0),
          OnBoardDotIndecator(index: 1),
          OnBoardDotIndecator(index: 2),
          OnBoardDotIndecator(index: 3),
          OnBoardDotIndecator(index: 4),
        ],
      ),
    );
  }

  Widget _content(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.screenPadding),
      child: Column(
        children: [
          Text(title, style: AppStyles.titleBig.bold, textAlign: TextAlign.center),
          VerticalSpace.small(),
          Text(
            subtitle,
            style: AppStyles.titleSmall.copyWith(color: context.themeColors.natural),
            textAlign: TextAlign.center,
          ),
          VerticalSpace.xxLarge(),
          ProgressButton(onNext: onNext),
        ],
      ),
    );
  }

  GestureDetector _btnSkip(BuildContext context) {
    return GestureDetector(
      onTap: onSkip,
      child: Text(
        AppStrings.of(context).skip,
        style: AppStyles.normal.copyWith(color: context.themeColors.natural),
      ),
    );
  }
}
