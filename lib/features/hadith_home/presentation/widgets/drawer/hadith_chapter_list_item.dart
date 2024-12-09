import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/core.dart';

import '../../../../features.dart';

class HadithChapterListItem extends StatelessWidget {
  const HadithChapterListItem({
    super.key,
    required this.hadithBooksEnum,
    required this.hadithBookFullModel,
    required this.selectedChapterId,
    required this.index,
  });
  final HadithBooksEnum hadithBooksEnum;
  final HadithBookFullModel hadithBookFullModel;
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
    int currentIndexCapterId = hadithBookFullModel.hadithBook.chapters[index].id;

    String leading = context.isArabicLang ? (currentIndexCapterId).toArabicNumber : '$currentIndexCapterId';
    String title = HadithLocalizationHelper.getChapterTitle(hadithBookFullModel.hadithBook.chapters[index]);
    String subtitle = HadithLocalizationHelper.getChapterHadithsCount(
      hadithBookFullModel.hadithBook,
      currentIndexCapterId,
    );

    bool chapterReaded = selectedChapterId > currentIndexCapterId;

    bool chapterInReading = selectedChapterId == currentIndexCapterId;
    bool isItemSelected = selectedChapterId == currentIndexCapterId;

    var chapterHadiths =
        hadithBookFullModel.hadithBook.hadiths.where((x) => x.chapterId == currentIndexCapterId).toList();
    if (chapterHadiths.isEmpty) return Container();
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
        ],
      ),
      trailing: IconButton(
        onPressed: () => context.read<SearchCubit>().showSearchPageChapter(hadithBookFullModel.hadithBook, index + 1),
        color: context.themeColors.secondary,
        icon: AppIcons.search,
      ),
      onTap: () => context
          .read<HadithViewCubit>()
          .updateSelectedChapter(hadithBookFullModel.hadithBook.chapters[index].id, true),
    );
  }
}
