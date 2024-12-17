import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/core.dart';
import 'package:hadith_books/src/app_router.dart';

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
    this.isSearchedItemView = false,
  })  : showBookTitle = showBookTitle ?? false,
        isTempData = false;

  HadithCardItem.tempData({super.key, required this.isPageView})
      : index = 0,
        hadith = HadithEntity.tempData(longText: isPageView),
        hadithBookEntity = HadithBookEntity.tempData(),
        showBookTitle = false,
        searchText = '',
        afterFavoritePressed = null,
        isSearchedItemView = false,
        isTempData = true;

  final int index;
  final HadithEntity hadith;
  final HadithBookEntity hadithBookEntity;
  final bool showBookTitle;
  final String searchText;
  final Function(bool isFavorite)? afterFavoritePressed;
  final bool isTempData;
  final bool isPageView;
  final bool isSearchedItemView;

  @override
  Widget build(BuildContext context) {
    var scrollController = ScrollController();
    return AppScrollbar(
      controller: scrollController,
      child: _buildContainer(
        context,
        child: _buildBody(context, scrollController: scrollController),
      ),
    );
  }

  ScrollPhysics _getScrollPhysics() {
    return (isTempData || !isPageView) ? const NeverScrollableScrollPhysics() : const BouncingScrollPhysics();
  }

  Widget _buildContainer(BuildContext context, {required Widget child}) {
    return InkWell(
      onTap: isPageView || searchText.isEmpty
          ? null
          : () => {
                NavigatorHelper.pushNamed(AppRoutes.searchedHadithViewPage,
                    extra: {'hadith': hadith.toJson(), 'searchText': searchText}),
              },
      child: Container(
        margin: _getContainerMargin(),
        padding: _getContainerPadding(),
        decoration: _getContainerDecoration(context),
        height: isPageView && !isTempData ? context.height : null,
        child: child,
      ),
    );
  }

  EdgeInsets? _getContainerMargin() {
    return isPageView
        ? null
        : EdgeInsets.only(
            left: AppSizes.smallScreenPadding * 2,
            right: AppSizes.smallScreenPadding * 2,
            bottom: isPageView ? 0 : AppSizes.screenPadding,
            top: isPageView
                ? 0
                : index == 0
                    ? AppSizes.screenPadding
                    : 0,
          );
  }

  EdgeInsets _getContainerPadding() {
    return EdgeInsets.only(
      left: AppSizes.screenPadding,
      right: AppSizes.screenPadding,
      top: AppSizes.screenPadding,
    );
  }

  BoxDecoration _getContainerDecoration(BuildContext context) {
    return BoxDecoration(
      // color: isPageView ? context.theme.colorScheme.surface : context.themeColors.natural.withOpacity(.05),
      color: context.themeColors.surface,
      borderRadius: isPageView ? null : BorderRadius.circular(AppSizes.smallBorderRadius),
      boxShadow: isPageView ? null : [AppShadows.hadithCard],
      border: Border(
        top: BorderSide(color: context.themeColors.natural.withOpacity(.6)),
        left: isPageView ? BorderSide.none : BorderSide(color: context.themeColors.natural.withOpacity(.6)),
        right: isPageView ? BorderSide.none : BorderSide(color: context.themeColors.natural.withOpacity(.6)),
        bottom: isPageView ? BorderSide.none : BorderSide(color: context.themeColors.natural.withOpacity(.6)),
      ),
    );
  }

  Widget _buildBody(BuildContext context, {required ScrollController scrollController}) {
    return SingleChildScrollView(
      controller: scrollController,
      physics: _getScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCardHeaderPart(context),
          if (isPageView || searchText.isEmpty) _buildBookAndChapterNames(context, false),
          const Divider(endIndent: 25, indent: 25),
          _buildAuthor(context),
          _buildHadithContent(),
        ],
      ),
    );
  }

  Widget _buildCardHeaderPart(BuildContext context) {
    return searchText.isNotEmpty && !isSearchedItemView
        ? _buildBookAndChapterNames(context, true)
        : Row(
            children: [
              if (!isTempData) HadithCountWidget(index: index, hadithId: hadith.id, searchText: searchText),
              const Spacer(),
              FavoriteButton(hadith: hadith, afterPressed: afterFavoritePressed),
              CopyButton(content: HadithLocalizationHelper.getHadithCopyText(hadithBookEntity, hadith)),
              ShareButton(content: HadithLocalizationHelper.getHadithCopyText(hadithBookEntity, hadith)),
            ],
          );
  }

  Widget _buildAuthor(BuildContext context) {
    return context.isArabicLang ? const SizedBox() : Text(hadith.english.narrator, style: AppStyles.normal.bold);
  }

  Padding _buildHadithContent() {
    return Padding(
      padding: EdgeInsets.only(top: AppSizes.mediumSpace),
      child: BlocBuilder<ChangeHadithFontStyleCubit, ChangeHadithFontStyleState>(builder: (context, fontState) {
        return BlocBuilder<ChangeFontSizeSliderCubit, ChangeFontSizeSliderState>(
          builder: (context, sizeState) {
            return isTempData
                ? Text(HadithLocalizationHelper.getHadithText(hadith))
                : HadithContent(
                    content: HadithLocalizationHelper.getHadithText(hadith),
                    searchText: searchText,
                    useReadMoreProp: !isPageView && searchText.isEmpty,
                    useSelectible: isPageView || searchText.isEmpty,
                    isPageView: isPageView,
                  );
          },
        );
      }),
    );
  }

  Widget _buildBookAndChapterNames(BuildContext context, bool includeHadithCount) {
    return Row(
      children: <Widget>[
        if (!isTempData && includeHadithCount)
          HadithCountWidget(index: index, hadithId: hadith.id, searchText: searchText),
        Text(
          '${HadithLocalizationHelper.getBookName(hadithBookEntity)} - ',
          style: AppStyles.normal.bold,
        ),
        Expanded(
          flex: 3,
          child: FittedBox(
            alignment: context.isArabicLang ? Alignment.centerRight : Alignment.centerLeft,
            fit: BoxFit.scaleDown,
            child: Text(
              HadithLocalizationHelper.getChapterTitle(hadithBookEntity.chapters
                  .firstWhere((element) => element.id == hadith.chapterId, orElse: () => ChapterEntity.tempData())),
              style: AppStyles.normal.bold.natural,
            ),
          ),
        ),
      ],
    );
  }
}
