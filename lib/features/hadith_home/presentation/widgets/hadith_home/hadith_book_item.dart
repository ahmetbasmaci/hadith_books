import 'package:flutter/material.dart';
import 'package:hadith_books/core/enums/hadith_books_enum.dart';

import '../../../../../core/utils/resources/resources.dart';
import '../../../../features.dart';

class HadithBookItem extends StatelessWidget {
  const HadithBookItem({
    super.key,
    required this.hadithBooksEnum,
  });
  final HadithBooksEnum hadithBooksEnum;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(hadithBooksEnum.bookImage),
        ),
        borderRadius: BorderRadius.circular(AppSizes.borderRadius),
        color: context.theme.colorScheme.surface,
        //color: const Color(0xff1d1d1d),

        boxShadow: [
          BoxShadow(
            // color: AppConstants.context.theme.colorScheme.primary.withOpacity(.5),
            color: context.isDark ? Colors.grey.withOpacity(.2) : Colors.black.withOpacity(.4),
            blurRadius: 12,
            offset: const Offset(0, 0),
            spreadRadius: .5,
          )
        ],
      ),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(context.width * .115),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.borderRadius),
              color: context.themeColors.background,
              boxShadow: [
                const BoxShadow(
                  color: Colors.black,
                  blurRadius: 2,
                  offset: Offset(0, 0),
                ),
                BoxShadow(
                  color: context.themeColors.primary.withOpacity(.5),
                  blurRadius: 2,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Text(
              hadithBooksEnum.bookName,
              style: AppStyles.normalBold,
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            right: -5,
            top: -5,
            child: CountCirculeAvatar(text: hadithBooksEnum.bookId.toString()),
          ),
          Positioned(
            left: -5,
            bottom: -5,
            child: InfoCirculeAvatar(hadithBooksEnum: hadithBooksEnum),
          ),
        ],
      ),
    );
  }
}
