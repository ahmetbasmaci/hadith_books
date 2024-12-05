import 'package:flutter/material.dart';
import 'package:hadith_books/features/features.dart';
import 'package:hadith_books/src/app_router.dart';

import '../../../../../core/core.dart';
import '../../../data/models/hadith_book_full_model.dart';

class DrawerHadithHeaderPart extends StatelessWidget {
  const DrawerHadithHeaderPart({super.key, required this.hadithBookFullModel});
  final HadithBookFullModel hadithBookFullModel;
  @override
  Widget build(BuildContext context) {
    var title = HadithLocalizationHelper.getBookName(hadithBookFullModel.hadithBook);
    String autherName = HadithLocalizationHelper.getBookAuther(hadithBookFullModel.auther);
    if (autherName.isEmpty) {
      autherName = ' ';
    }
    return ListTile(
      textColor: context.themeColors.onBackground,
      tileColor: context.themeColors.background,
      title: Hero(
        tag: title,
        child: Text(title),
      ),
      subtitle: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: context.isArabicLang ? Alignment.centerRight : Alignment.centerLeft,
        child: Text(autherName),
      ),
      leading: Hero(tag: hadithBookFullModel.hadithBook.id, child: _leading(context)),
      onTap: () {
        NavigatorHelper.pushNamed(
          AppRoutes.autherPage,
          extra: HadithBooksEnumCodec().encoder.convert(
                HadithBooksEnum.values.firstWhere((element) => element.bookId == hadithBookFullModel.hadithBook.id),
              ),
        );
      },
    );
  }

  Widget _leading(BuildContext context) {
    return Material(
      child: Image.asset(
        HadithBooksEnum.values.firstWhere((element) => element.bookId == hadithBookFullModel.hadithBook.id).bookImage,
      ),
    );
  }
}
