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
    //var hadiths = hadithBookEntity.hadiths.where((element) => element.chapterId == chapterId).toList();
    var hadiths = hadithBookEntity.hadiths.toList();
    return Column(
      children: [
        BlocBuilder<HadithViewCubit, HadithViewState>(
          builder: (context, state) {
            return Align(
              alignment: Alignment.topCenter,
              child: HadithViewPageSliderContainer(
                startIndex: hadiths[0].id.toDouble(),
                endIndex: hadiths.length.toDouble(),
              ),
            );
          },
        ),
        Flexible(
          child: PageView(
            controller: context.read<HadithViewCubit>().hadithPageViewController,
            onPageChanged: (int index) {
              var hadith = hadiths[index];
              if (hadith.chapterId != chapterId) {
                context.read<HadithViewCubit>().updateSelectedChapter(hadith.chapterId, false);
              }
            },
            children: List.generate(
              hadiths.length,
              (int index) => HadithCardItem(
                index: index,
                hadith: hadiths[index],
                hadithBookEntity: hadithBookEntity,
                showBookTitle: showBookTitle,
                isPageView: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
