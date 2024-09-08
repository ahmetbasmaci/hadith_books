import 'package:flutter/material.dart';
import '../../../../../../core/widgets/components/app_scrollbar.dart';
import '../../../../../features.dart';

class HadithViewBodyPartSearchInChapter extends StatelessWidget {
  const HadithViewBodyPartSearchInChapter({
    super.key,
    required this.hadithBookEntity,
    required this.searchText,
    required this.chapterId,
  });

  final HadithBookEntity hadithBookEntity;
  final String searchText;
  final int chapterId;

  @override
  Widget build(BuildContext context) {
    var hadiths = hadithBookEntity.hadiths.where((element) => element.chapterId == chapterId).toList();
    // var scrollController = context.read<HadithViewCubit>().hadithItemScrollController;
    var scrollController = ScrollController();
    return AppScrollbar(
      controller: scrollController,
      child: searchText.isEmpty
          ? HadithViweBodyChapterItems(
              hadithBookEntity: hadithBookEntity,
              chapterId: chapterId,
              showBookTitle: true,
            )
          : HadithViewBodySearchedItems(
              hadithBookEntities: [hadithBookEntity],
              searchText: searchText,
              scrollController: scrollController,
              hadiths: hadiths,
            ),
    );
  }
}
