import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/core.dart';

import '../../../../features.dart';

class HadithChapterListItem extends StatelessWidget {
  const HadithChapterListItem({
    super.key,
    required this.hadithBooksEnum,
    required this.hadithBookEntity,
    required this.auther,
    required this.selectedChapterId,
    required this.index,
  });
  final HadithBooksEnum hadithBooksEnum;
  final HadithBookEntity hadithBookEntity;
  final Auther auther;
  final int selectedChapterId;
  final int index;
  @override
  Widget build(BuildContext context) {
    bool isItemSelected = selectedChapterId == hadithBookEntity.chapters[index].id;

    String leading = context.isArabicLang ? (index + 1).toArabicNumber : '${index + 1}';
    String title = HadithLocalizationHelper.getChapterTitle(hadithBookEntity.chapters[index]);
    String subtitle = HadithLocalizationHelper.getChapterHadithsCount(
      hadithBookEntity,
      hadithBookEntity.chapters[index].id,
    );

    return ListTile(
      selected: isItemSelected,
      textColor: context.themeColors.onBackground,
      leading: Text(leading, style: AppStyles.titleMeduimBold),
      title: Text(
        title,
        style: isItemSelected ? AppStyles.titleSmallBold : AppStyles.titleSmall,
      ),
      subtitle: Text(subtitle),
      trailing: IconButton(
        onPressed: () => AppSearch.showSearchInChapter(
          hadithBookEntity: hadithBookEntity,
          chapterId: hadithBookEntity.chapters[index].id,
        ),
        color: context.themeColors.secondary,
        icon: AppIcons.search,
      ),
      onTap: () => context
          .read<HadithViewCubit>()
          .changeSelectedChapter(hadithBooksEnum, auther, hadithBookEntity.chapters[index]),
    );
  }
}
