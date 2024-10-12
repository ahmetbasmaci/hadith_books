import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../features.dart';

class HadithViweBodyChapterItemsPageView extends StatelessWidget {
  const HadithViweBodyChapterItemsPageView({
    super.key,
    required this.hadithBookEntity,
    required this.chapterId,
    this.showBookTitle,
  });
  final HadithBookEntity hadithBookEntity;
  final int chapterId;
  final bool? showBookTitle;
  @override
  Widget build(BuildContext context) {
    var hadiths = hadithBookEntity.hadiths.where((element) => element.chapterId == chapterId).toList();
    return PageView(
      controller: context.read<HadithViewCubit>().hadithPageViewController,
      children: hadiths
          .map(
            (hadith) => HadithCardItem(
              index: 1,
              hadith: hadith,
              hadithBookEntity: hadithBookEntity,
              showBookTitle: showBookTitle,
              isPageView: true,
            ),
          )
          .toList(),
    );
  }
}