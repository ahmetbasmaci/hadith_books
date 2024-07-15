import 'package:flutter/material.dart';
import 'package:hadith_books/core/enums/hadith_books_enum.dart';

import '../../../../core/helpers/navigator_helper.dart';
import '../../../../core/utils/resources/resources.dart';
import '../../../../src/app_router.dart';
import 'count_circule_avatar.dart';

class HadithBookItem extends StatelessWidget {
  const HadithBookItem({
    super.key,
    required this.hadithBooksEnum,
  });
  final HadithBooksEnum hadithBooksEnum;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async => NavigatorHelper.pushNamed(
        AppRoutes.hadithsViewPage,
        extra: hadithBooksEnum,
      ),
      child: Card(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(hadithBooksEnum.bookImage),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    hadithBooksEnum.bookName,
                    style: AppStyles.normalBold,
                  ),
                ),
              ],
            ),
            Positioned(
              right: 0,
              top: 0,
              child: CountCirculeAvatar(text: hadithBooksEnum.bookId.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
