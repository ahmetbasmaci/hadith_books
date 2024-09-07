import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/widgets/animations/animated_list_item_up_to_down.dart';

import '../../../../core/helpers/hadith_localization_helper.dart';
import '../../../../core/utils/resources/resources.dart';
import '../../../../core/widgets/components/buttons/copy_button.dart';
import '../../../../core/widgets/components/buttons/share_button.dart';
import '../../../features.dart';

class HadithCardItem extends StatelessWidget {
  const HadithCardItem({
    super.key,
    required this.index,
    required this.hadith,
    required this.hadithBookEntity,
    bool? showBookTitle,
    this.searchText = '',
    this.afterFavoritePressed,
  }) : showBookTitle = showBookTitle ?? false;
  final int index;
  final HadithEntity hadith;
  final HadithBookEntity hadithBookEntity;
  final bool showBookTitle;
  final String searchText;
  final Function(bool isFavorite)? afterFavoritePressed;
  @override
  Widget build(BuildContext context) {
    return AnimatedListItemUpToDown(
      slideDuration: const Duration(milliseconds: 500),
      staggerDuration: const Duration(milliseconds: 0),
      index: index,
      child: Container(
        margin: EdgeInsets.only(
          left: AppSizes.smallScreenPadding,
          right: AppSizes.smallScreenPadding,
          top: index == 0 ? AppSizes.screenPadding : 0,
          bottom: AppSizes.screenPadding,
        ),
        padding: EdgeInsets.only(
          left: AppSizes.screenPadding,
          right: AppSizes.screenPadding,
          top: AppSizes.screenPadding,
        ),
        decoration: BoxDecoration(
          color: context.theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(AppSizes.borderRadius),
          boxShadow: [AppShadows.hadithCard],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _cardHeaderPart(),
            _bookAndChapterNames(),
            const Divider(endIndent: 25, indent: 25),
            _auther(context),
            _hadithContent(),
          ],
        ),
      ),
    );
  }

  Row _cardHeaderPart() {
    return Row(
      children: <Widget>[
        HadithCountWidget(hadithId: hadith.id, searchText: searchText),
        const Spacer(),
        FavoriteButton(hadith: hadith,afterPressed: afterFavoritePressed),
        ShareButton(content: HadithLocalizationHelper.getHadithText(hadith)),
        CopyButton(content: HadithLocalizationHelper.getHadithText(hadith)),
      ],
    );
  }

  Widget _auther(BuildContext context) =>
      context.isArabicLang ? const SizedBox() : Text(hadith.english.narrator, style: AppStyles.normalBold);

  Padding _hadithContent() {
    return Padding(
      padding: EdgeInsets.all(AppSizes.mediumSpace),
      child: BlocBuilder<ChangeFontSizeSliderCubit, ChangeFontSizeSliderState>(
        builder: (context, state) {
          return HadithContent(content: HadithLocalizationHelper.getHadithText(hadith), searchText: searchText);
        },
      ),
    );
  }

  Text _bookAndChapterNames() {
    return Text.rich(
      TextSpan(
        text: showBookTitle ? HadithLocalizationHelper.getBookTitle(hadithBookEntity) : '',
        style: AppStyles.titleMeduimBold,
        children: [
          TextSpan(
            text: showBookTitle ? ' - ' : '',
            style: AppStyles.titleMeduim,
          ),
          TextSpan(
            text: HadithLocalizationHelper.getChapterTitle(
                hadithBookEntity.chapters.firstWhere((element) => element.id == hadith.chapterId)),
            style: AppStyles.titleMeduim.natural,
          ),
        ],
      ),
    );
  }
}
