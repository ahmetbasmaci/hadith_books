import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/components/list_view/scrollable_positioned_list_view.dart';
import '../../../../features.dart';

class HadithViweBodyChapterItems extends StatelessWidget {
  const HadithViweBodyChapterItems(
      {super.key, required this.hadithBookEntity, required this.chapterId, this.showBookTitle});
  final HadithBookEntity hadithBookEntity;
  final int chapterId;
  final bool? showBookTitle;
  @override
  Widget build(BuildContext context) {
    var hadiths = hadithBookEntity.hadiths.where((element) => element.chapterId == chapterId).toList();
    return ScrollablePositionedListView(
      itemScrollController: context.read<HadithViewCubit>().hadithItemScrollController,
      itemPositionsListener: context.read<HadithViewCubit>().chapterItemPositionsListener,
      itemCount: hadiths.length,
      itemBuilder: (context, index) {
  
        var hadith = hadiths[index];
        return HadithCardItem(
            index: index, hadith: hadith, hadithBookEntity: hadithBookEntity, showBookTitle: showBookTitle);
      },
    );
  }
}
