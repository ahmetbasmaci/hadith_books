import 'package:flutter/material.dart';
import '../../../../../features.dart';

class HadithViewBodyCards extends StatelessWidget {
  const HadithViewBodyCards({
    super.key,
    required this.isTempData,
    required this.hadithBookEntity,
    required this.chapterId,
  });

  final bool isTempData;
  final HadithBookEntity hadithBookEntity;
  final int chapterId;
  @override
  Widget build(BuildContext context) {
    if (isTempData) return const HadithViewTempDataListCards();

    return HadithViweBodyChapterItemsCards(
      hadithBookEntity: hadithBookEntity,
      chapterId: chapterId,
    );
  }
}
