import 'package:flutter/material.dart';
import 'package:hadith_books/features/hadith_home/presentation/widgets/hadith_view/body_list_view/hadith_view_temp_data_list_page_view.dart';

import '../../../../../features.dart';
import 'hadith_viwe_body_chapter_items_page_view.dart';

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
