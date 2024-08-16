import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/features/hadith_home/presentation/widgets/hadith_view_body_part/hadith_viwe_body_chapter_items.dart';
import '../../../../../core/widgets/components/app_scrollbar.dart';
import '../../../../features.dart';
import 'hadith_view_body_searched_items.dart';

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
    return AppScrollbar(
      controller: context.read<HadithViewCubit>().scrollController,
      child: searchText.isEmpty
          ? HadithViweBodyChapterItems(hadithBookEntity: hadithBookEntity, chapterId: chapterId)
          : HadithViewBodySearchedItems(
              hadithBookEntity: hadithBookEntity,
              searchText: searchText,
              hadiths: hadiths,
            ),
    );
  }
}
