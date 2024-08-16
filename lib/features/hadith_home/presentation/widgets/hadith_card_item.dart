import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/widgets/animations/animated_list_item_up_to_down.dart';

import '../../../../core/helpers/hadith_localization_helper.dart';
import '../../../../core/utils/resources/resources.dart';
import '../../../../core/widgets/components/buttons/copy_button.dart';
import '../../../../core/widgets/components/buttons/share_button.dart';
import '../../../features.dart';
import 'hadith_count_widget.dart';

class HadithCardItem extends StatelessWidget {
  const HadithCardItem({super.key, required this.index, required this.hadith, required this.hadithBookEntity});
  final int index;
  final HadithEntity hadith;
  final HadithBookEntity hadithBookEntity;
  @override
  Widget build(BuildContext context) {
    return AnimatedListItemUpToDown(
      slideDuration: const Duration(milliseconds: 3000),
      staggerDuration: const Duration(milliseconds: 0),
      index: index,
      child: Container(
        margin: EdgeInsets.only(bottom: AppSizes.smallSpace),
        padding: EdgeInsets.only(
          left: AppSizes.screenPadding,
          right: AppSizes.screenPadding,
          top: AppSizes.screenPadding,
        ),
        decoration: BoxDecoration(
          color: context.theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(AppSizes.borderRadius),
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
        HadithCountWidget(text: hadith.id.toString()),
        const Spacer(),
        FavoriteButton(hadith: hadith),
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
          return SelectableText(
            HadithLocalizationHelper.getHadithText(hadith),
            style: AppStyles.normal.copyWith(fontSize: context.read<ChangeFontSizeSliderCubit>().state.fontSize),
            textAlign: TextAlign.justify,
          );
        },
      ),
    );
  }

  Text _bookAndChapterNames() {
    return Text.rich(
      TextSpan(
        text: HadithLocalizationHelper.getBookTitle(hadithBookEntity),
        style: AppStyles.titleMeduimBold,
        children: [
          TextSpan(
            text: ' - ',
            style: AppStyles.titleMeduim,
          ),
          TextSpan(
            text: HadithLocalizationHelper.getChapterTitle(
                hadithBookEntity.chapters.firstWhere((element) => element.id == hadith.chapterId)),
            style: AppStyles.titleSmall,
          ),
        ],
      ),
    );
  }
}
