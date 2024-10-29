import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/core.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../features.dart';

class HadithCardItem extends StatelessWidget {
  const HadithCardItem({
    super.key,
    required this.index,
    required this.hadith,
    required this.hadithBookEntity,
    required this.isPageView,
    bool? showBookTitle,
    this.searchText = '',
    this.afterFavoritePressed,
  })  : showBookTitle = showBookTitle ?? false,
        isTempData = false;

  HadithCardItem.tempData({super.key, required this.isPageView})
      : index = 0,
        hadith = HadithEntity.tempData(longText: isPageView),
        hadithBookEntity = HadithBookEntity.tempData(),
        showBookTitle = false,
        searchText = '',
        afterFavoritePressed = null,
        isTempData = true;

  final int index;
  final HadithEntity hadith;
  final HadithBookEntity hadithBookEntity;
  final bool showBookTitle;
  final String searchText;
  final Function(bool isFavorite)? afterFavoritePressed;
  final bool isTempData;
  final bool isPageView;
  @override
  Widget build(BuildContext context) {
    var scrollController = ScrollController();
    return AppScrollbar(
      controller: scrollController,
      child: SingleChildScrollView(
        controller: scrollController,
        physics: (isTempData || !isPageView) ? const NeverScrollableScrollPhysics() : const BouncingScrollPhysics(),
        child: _container(
          context: context,
          child: _body(context),
        ),
      ),
    );
  }

  // Widget _animatedItem({required Widget child}) {
  //   return AnimatedListItemUpToDown(
  //     slideDuration: const Duration(milliseconds: 500),
  //     staggerDuration: const Duration(milliseconds: 0),
  //     index: index,
  //     child: child,
  //   );
  // }

  Widget _container({required BuildContext context, required Widget child}) {
    return Container(
      // constraints:
      //     !isPageView ? null : BoxConstraints(minHeight: context.height - kToolbarHeight - AppSizes.screenPadding * 2),
      margin: isPageView
          ? null
          : EdgeInsets.only(
              left: AppSizes.smallScreenPadding,
              right: AppSizes.smallScreenPadding,
              //top: index == 0 ? AppSizes.screenPadding : 0,
              bottom: AppSizes.screenPadding,
            ),
      padding: EdgeInsets.only(
        left: AppSizes.screenPadding,
        right: AppSizes.screenPadding,
        top: AppSizes.screenPadding,
      ),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surface,
        borderRadius: isPageView ? null : BorderRadius.circular(AppSizes.borderRadius),
        boxShadow: isPageView ? null : [AppShadows.hadithCard],
      ),
      child: child,
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Skeleton.shade(child: _cardHeaderPart()),
        _bookAndChapterNames(),
        const Divider(endIndent: 25, indent: 25),
        _auther(context),
        _hadithContent(),
      ],
    );
  }

  Widget _cardHeaderPart() {
    return Row(
      children: <Widget>[
        isTempData ? const SizedBox() : HadithCountWidget(index: index, hadithId: hadith.id, searchText: searchText),
        const Spacer(),
        FavoriteButton(hadith: hadith, afterPressed: afterFavoritePressed),
        CopyButton(content: HadithLocalizationHelper.getHadithCopyText(hadithBookEntity, hadith)),
        ShareButton(content: HadithLocalizationHelper.getHadithCopyText(hadithBookEntity, hadith)),
      ],
    );
  }

  Widget _auther(BuildContext context) =>
      context.isArabicLang ? const SizedBox() : Text(hadith.english.narrator, style: AppStyles.normalBold);

  Padding _hadithContent() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.mediumSpace),
      child: BlocBuilder<ChangeFontSizeSliderCubit, ChangeFontSizeSliderState>(
        builder: (context, state) {
          return isTempData
              ? Text(HadithLocalizationHelper.getHadithText(hadith))
              : HadithContent(
                  content: HadithLocalizationHelper.getHadithText(hadith),
                  searchText: searchText,
                  useReadMoreProp: !isPageView,
                );
        },
      ),
    );
  }

  Text _bookAndChapterNames() {
    return Text.rich(
      TextSpan(
        text: showBookTitle ? HadithLocalizationHelper.getBookName(hadithBookEntity) : '',
        style: AppStyles.titleMeduimBold,
        children: [
          TextSpan(
            text: showBookTitle ? ' - ' : '',
            style: AppStyles.titleMeduim,
          ),
          TextSpan(
            text: HadithLocalizationHelper.getChapterTitle(hadithBookEntity.chapters
                .firstWhere((element) => element.id == hadith.chapterId, orElse: () => ChapterEntity.tempData())),
            style: AppStyles.titleMeduim.natural,
          ),
        ],
      ),
    );
  }
}
