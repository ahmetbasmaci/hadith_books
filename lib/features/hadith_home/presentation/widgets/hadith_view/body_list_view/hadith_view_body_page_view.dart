import 'package:flutter/material.dart';

import '../../../../../features.dart';

class HadithViewBodyPageView extends StatelessWidget {
  const HadithViewBodyPageView({
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
    return isTempData
        ? const HadithViewTempDataListPageView()
        : HadithViweBodyChapterItemsPageView(
            hadithBookEntity: hadithBookEntity,
            chapterId: chapterId,
          );
  }
}
