import 'package:flutter/material.dart';

import 'package:hadith_books/core/core.dart';

import '../../../features.dart';

class OnBoardBodyWidget extends StatelessWidget {
  final Widget hero;
  final String title;
  final String subtitle;
  final VoidCallback onNext;
  final VoidCallback onSkip;

  const OnBoardBodyWidget({
    super.key,
    required this.hero,
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
        Expanded(child: hero),
        _content(context),
        VerticalSpace.small(),
        _btnSkip(context),
        VerticalSpace.small(),
      ],
    );
  }

  Column _content(BuildContext context) {
    return Column(
      children: [
        Text(title, style: AppStyles.titleXBigBold, textAlign: TextAlign.center),
        VerticalSpace.small(),
        Text(
          subtitle,
          style: AppStyles.titleBig.copyWith(color: context.themeColors.natural),
          textAlign: TextAlign.center,
        ),
        VerticalSpace.xxLarge(),
        ProgressButton(onNext: onNext),
      ],
    );
  }

  GestureDetector _btnSkip(BuildContext context) {
    return GestureDetector(
      onTap: onSkip,
      child: Text(
        "Skip",
        style: AppStyles.titleBig.copyWith(color: context.themeColors.natural),
      ),
    );
  }
}
