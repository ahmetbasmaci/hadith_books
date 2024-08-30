import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/enums/hadith_books_enum.dart';

import '../../../../../core/helpers/hadith_localization_helper.dart';
import '../../../../../core/utils/resources/resources.dart';
import '../../../../../core/widgets/components/buttons/app_search.dart';
import '../../../../features.dart';

class HadithChapterListItem extends StatelessWidget {
  const HadithChapterListItem({
    super.key,
    required this.hadithBooksEnum,
    required this.hadithBookEntity,
    required this.selectedChapterId,
    required this.index,
  });
  final HadithBooksEnum hadithBooksEnum;
  final HadithBookEntity hadithBookEntity;
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
        color: context.themeColors.primary,
        onPressed: () => AppSearch.showSearchInChapter(
          hadithBookEntity: hadithBookEntity,
          chapterId: hadithBookEntity.chapters[index].id,
        ),
        icon: AppIcons.search,
      ),
      onTap: () =>
          context.read<HadithViewCubit>().changeSelectedChapter(hadithBooksEnum, hadithBookEntity.chapters[index]),
    );
  }
}
