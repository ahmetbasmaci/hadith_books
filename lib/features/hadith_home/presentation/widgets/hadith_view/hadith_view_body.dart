import 'package:flutter/material.dart';

import '../../../../../core/core.dart';
import '../../../../features.dart';

class HadithViewBody extends StatelessWidget {
  const HadithViewBody({
    super.key,
    required this.hadithBooksEnum,
    required this.hadithBookEntity,
    required this.chapterId,
  });
  final HadithBooksEnum hadithBooksEnum;
  final HadithBookEntity hadithBookEntity;
  final int chapterId;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
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
      body: HadithViweBodyChapterItems(hadithBookEntity: hadithBookEntity, chapterId: chapterId),
      useSliver: false,
    );
  }
}
