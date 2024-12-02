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
    return Padding(
      padding: EdgeInsets.only(bottom: AppSizes.smallSpace),
      child: _buildChapterItem(context),
    );
  }

  Widget _buildChapterItem(BuildContext context) {
    bool isItemSelected = selectedChapterId == hadithBookEntity.chapters[index].id;

    String leading = context.isArabicLang ? (index + 1).toArabicNumber : '${index + 1}';
    String title = HadithLocalizationHelper.getChapterTitle(hadithBookEntity.chapters[index]);
    String subtitle = HadithLocalizationHelper.getChapterHadithsCount(
      hadithBookEntity,
      hadithBookEntity.chapters[index].id,
    );

    bool chapterReaded = selectedChapterId > hadithBookEntity.chapters[index].id;
    bool chapterInReading = selectedChapterId == hadithBookEntity.chapters[index].id;

    var chapterHadiths =
        hadithBookEntity.hadiths.where((x) => x.chapterId == hadithBookEntity.chapters[index].id).toList();

    double chapterTotalHadithCount = chapterHadiths.length.toDouble();

    double hadithIndex = (context.read<HadithViewCubit>().state as HadithViewLoaded).pageIndex.toDouble() +
        2 -
        chapterHadiths[0].id.toDouble();

    double readedValue = hadithIndex / chapterTotalHadithCount;

    return ListTile(
      selected: isItemSelected,
      selectedColor: context.themeColors.onBackground,
      textColor: chapterReaded ? context.themeColors.success.withOpacity(1) : context.themeColors.onBackground,
      leading: Text(leading, style: AppStyles.normal.bold),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: isItemSelected ? AppStyles.normal.bold : AppStyles.normal),
          Text(subtitle, style: isItemSelected ? AppStyles.small.bold : AppStyles.small),
          VerticalSpace.small(),
          Row(
            // key: hadithBooksEnum == HadithBooksEnum.bukhari ? AppKeys.homeScreenBookSliderKey : null,
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  value: chapterReaded
                      ? 1
                      : chapterInReading
                          ? readedValue
                          : 0,
                  backgroundColor: context.themeColors.natural,
                  valueColor: AlwaysStoppedAnimation<Color>(context.themeColors.progress(readedValue)),
                ),
              ),
              HorizontalSpace.medium(),
              Text(
                '${readedValue.percentPer100}%',
                style: AppStyles.small.bold.copyWith(color: context.themeColors.progress(readedValue)),
              )
            ],
          ),
          // LinearProgressIndicator(
          //   value: chapterReaded
          //       ? 1
          //       : chapterInReading
          //           ? readedValue
          //           : 0,
          //   backgroundColor: context.themeColors.natural,
          //   valueColor: AlwaysStoppedAnimation<Color>(context.themeColors.progress(readedValue)),
          // ),
        ],
      ),
      trailing: IconButton(
        onPressed: () => AppSearch.showSearchInChapter(
          hadithBookEntity: hadithBookEntity,
          chapterId: hadithBookEntity.chapters[index].id,
        ),
        color: context.themeColors.secondary,
        icon: AppIcons.search,
      ),
      onTap: () => context.read<HadithViewCubit>().updateSelectedChapter(hadithBookEntity.chapters[index].id, true),
    );
  }
}
