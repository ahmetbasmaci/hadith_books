import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/core.dart';
import '../../../../../features.dart';
import 'components/hadith_view_page_slider_container.dart';

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
    return Column(
      children: [
        BlocBuilder<HadithViewCubit, HadithViewState>(
          builder: (context, state) {
            return Align(
              alignment: Alignment.topCenter,
              child: HadithViewPageSliderContainer(itemsLength: hadiths.length - 1),
            );
          },
        ),
        SizedBox(
          height: context.height * 0.5,
          child: PageView(
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
          ),
        ),
      ],
    );
  }
}
