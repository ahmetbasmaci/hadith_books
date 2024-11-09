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
        physics: _getScrollPhysics(),
        child: _buildContainer(context, _buildBody(context)),
      ),
    );
  }

  ScrollPhysics _getScrollPhysics() {
    return (isTempData || !isPageView) ? const NeverScrollableScrollPhysics() : const BouncingScrollPhysics();
  }

  Widget _buildContainer(BuildContext context, Widget child) {
    return Container(
      margin: _getContainerMargin(),
      padding: _getContainerPadding(),
      decoration: _getContainerDecoration(context),
      child: child,
    );
  }

  EdgeInsets? _getContainerMargin() {
    return isPageView
        ? null
        : EdgeInsets.only(
            left: AppSizes.smallScreenPadding,
            right: AppSizes.smallScreenPadding,
            bottom: AppSizes.screenPadding,
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
      color: context.theme.colorScheme.surface,
      borderRadius: isPageView ? null : BorderRadius.circular(AppSizes.borderRadius),
      boxShadow: isPageView ? null : [AppShadows.hadithCard],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Skeleton.shade(child: _buildCardHeaderPart()),
        _buildBookAndChapterNames(),
        const Divider(endIndent: 25, indent: 25),
        _buildAuthor(context),
        _buildHadithContent(),
      ],
    );
  }

  Widget _buildCardHeaderPart() {
    return Row(
      children: <Widget>[
        if (!isTempData) HadithCountWidget(index: index, hadithId: hadith.id, searchText: searchText),
        const Spacer(),
        FavoriteButton(hadith: hadith, afterPressed: afterFavoritePressed),
        CopyButton(content: HadithLocalizationHelper.getHadithCopyText(hadithBookEntity, hadith)),
        ShareButton(content: HadithLocalizationHelper.getHadithCopyText(hadithBookEntity, hadith)),
      ],
    );
  }

  Widget _buildAuthor(BuildContext context) {
    return context.isArabicLang ? const SizedBox() : Text(hadith.english.narrator, style: AppStyles.normalBold);
  }

  Padding _buildHadithContent() {
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

  Text _buildBookAndChapterNames() {
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
