import 'package:flutter/material.dart';
import 'package:hadith_books/core/enums/hadith_books_enum.dart';

import '../../../../core/utils/resources/resources.dart';
import '../../../features.dart';

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
        borderRadius: BorderRadius.circular(AppSizes.smallBorderRadius),
        color: context.theme.colorScheme.surface,
        //color: const Color(0xff1d1d1d),
        boxShadow: const [
          BoxShadow(
            // color: AppConstants.context.theme.colorScheme.primary.withOpacity(.5),
            //color: Colors.white.withOpacity(.5),
            blurRadius: 1,
            // offset: const Offset(-5, 0),
            // spreadRadius: 1,
          )
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            hadithBooksEnum.bookName.split(' ').join('\n'),
            style: AppStyles.normalBold,
            textAlign: TextAlign.center,
          ),
          Positioned(
            right: 0,
            top: 0,
            child: CountCirculeAvatar(text: hadithBooksEnum.bookId.toString()),
          ),
        ],
      ),
    );
  }
}
