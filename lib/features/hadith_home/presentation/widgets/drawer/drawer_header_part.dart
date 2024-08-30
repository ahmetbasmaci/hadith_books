import 'package:flutter/material.dart';
import 'package:hadith_books/core/utils/resources/app_extentions.dart';
import 'package:hadith_books/features/features.dart';

import '../../../../../core/enums/hadith_books_enum.dart';
import '../../../../../core/helpers/hadith_localization_helper.dart';

class DrawerHeaderPart extends StatelessWidget {
  const DrawerHeaderPart({super.key, required this.hadithBookEntity});
  final HadithBookEntity hadithBookEntity;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      textColor: context.themeColors.onBackground,
      title: Text(HadithLocalizationHelper.getBookTitle(hadithBookEntity)),
      subtitle: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(HadithLocalizationHelper.getBookAuther(hadithBookEntity)),
      ),
      leading:
          Image.asset(HadithBooksEnum.values.firstWhere((element) => element.bookId == hadithBookEntity.id).bookImage),
    );
  }
}
