import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
      title: Text(HadithLocalizationHelper.getBookTitle(hadithBookEntity)),
      actions: [
        Skeleton.shade(
          child: IconButton(
            onPressed: () => AppSearch.showSearchInBook(hadithBookEntity: hadithBookEntity),
            icon: AppIcons.search,
          ),
        ),
        const Skeleton.keep(child: HadithViewPopupButton()),
        const Skeleton.keep(child: AppBackBtn()),
      ],
      drawer: Skeleton.shade(child: HadithViewDrawer(hadithBooksEnum: hadithBooksEnum)),
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
