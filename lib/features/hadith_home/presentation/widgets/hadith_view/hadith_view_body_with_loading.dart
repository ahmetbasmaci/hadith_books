import 'package:flutter/material.dart';

import '../../../../../core/core.dart';
import '../../../../features.dart';

class HadithViewBodyWithLoading extends StatelessWidget {
  HadithViewBodyWithLoading.loading({super.key})
      : isLoading = true,
        hadithBooksEnum = HadithBooksEnum.ahmed,
        hadithBookEntity = HadithBookEntity.tempData(),
        chapterId = 1;

  const HadithViewBodyWithLoading.withData({
    super.key,
    required this.hadithBooksEnum,
    required this.hadithBookEntity,
    required this.chapterId,
  }) : isLoading = false;
  final HadithBooksEnum hadithBooksEnum;
  final HadithBookEntity hadithBookEntity;
  final int chapterId;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HadithViewLoadingWidget(
        isLoading: isLoading,
        child: HadithViewBody(
          hadithBooksEnum: hadithBooksEnum,
          hadithBookEntity: hadithBookEntity,
          chapterId: chapterId,
          isTempData: isLoading,
        ),
      ),
    );
  }
}
