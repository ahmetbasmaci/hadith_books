import 'package:flutter/material.dart';
import 'package:hadith_books/features/features.dart';
import 'package:hadith_books/src/app_router.dart';

import '../../../../../core/core.dart';

class DrawerHeaderPart extends StatelessWidget {
  const DrawerHeaderPart({super.key, required this.hadithBookEntity});
  final HadithBookEntity hadithBookEntity;
  @override
  Widget build(BuildContext context) {
    var title = HadithLocalizationHelper.getBookTitle(hadithBookEntity);
    return ListTile(
      textColor: context.themeColors.onBackground,
      title: Hero(
        tag: title,
        child: Text(title),
      ),
      subtitle: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(HadithLocalizationHelper.getBookAuther(hadithBookEntity)),
      ),
      leading: Hero(tag: hadithBookEntity.id, child: _leading(context)),
    );
  }

  Widget _leading(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          NavigatorHelper.pushNamed(AppRoutes.imamTarjama, extra: hadithBookEntity.id);
        },
        child: Image.asset(
          HadithBooksEnum.values.firstWhere((element) => element.bookId == hadithBookEntity.id).bookImage,
        ),
      ),
    );
  }
}
