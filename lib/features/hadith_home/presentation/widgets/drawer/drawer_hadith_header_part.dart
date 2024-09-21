import 'package:flutter/material.dart';
import 'package:hadith_books/features/features.dart';
import 'package:hadith_books/src/app_router.dart';

import '../../../../../core/core.dart';

class DrawerHadithHeaderPart extends StatelessWidget {
  const DrawerHadithHeaderPart({super.key, required this.hadithBookEntity});
  final HadithBookEntity hadithBookEntity;
  @override
  Widget build(BuildContext context) {
    var title = HadithLocalizationHelper.getBookTitle(hadithBookEntity);
    String auther = HadithLocalizationHelper.getBookAuther(hadithBookEntity);
    if (auther.isEmpty) {
      auther = ' ';
    }
    return ListTile(
      textColor: context.themeColors.onBackground,
      title: Hero(
        tag: title,
        child: Text(title),
      ),
      subtitle: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(auther),
      ),
      leading: Hero(tag: hadithBookEntity.id, child: _leading(context)),
      onTap: () {
        NavigatorHelper.pushNamed(AppRoutes.imamTarjama, extra: hadithBookEntity.id);
      },
    );
  }

  Widget _leading(BuildContext context) {
    return Material(
      child: Image.asset(
        HadithBooksEnum.values.firstWhere((element) => element.bookId == hadithBookEntity.id).bookImage,
      ),
    );
  }
}
