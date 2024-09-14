import 'package:flutter/material.dart';
import 'package:hadith_books/features/hadith_home/presentation/widgets/hadith_view/hadith_view_temp_data_list.dart';

import '../../../../../core/core.dart';
import '../../../../features.dart';

class HadithViewBody extends StatelessWidget {
  const HadithViewBody({
    super.key,
    required this.hadithBooksEnum,
    required this.hadithBookEntity,
    required this.chapterId,
    required this.isTempData,
  });
  final HadithBooksEnum hadithBooksEnum;
  final HadithBookEntity hadithBookEntity;
  final int chapterId;
  final bool isTempData;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      // useAppbar: !isTempData,
      title: HadithLocalizationHelper.getBookTitle(hadithBookEntity),
      actions: [
        IconButton(
          onPressed: () => AppSearch.showSearchInBook(hadithBookEntity: hadithBookEntity),
          icon: AppIcons.search,
        ),
        const HadithViewPopupButton(),
        const AppBackBtn(),
      ],
      drawer: HadithViewDrawer(hadithBooksEnum: hadithBooksEnum),
      body: isTempData
          ? const HadithViewTempDataList()
          : HadithViweBodyChapterItems(
              hadithBookEntity: hadithBookEntity,
              chapterId: chapterId,
            ),
      useSliver: false,
    );
  }
}
