import 'package:flutter/material.dart';
import 'package:hadith_books/core/enums/hadith_books_enum.dart';

import '../../../../core/helpers/navigator_helper.dart';
import '../../../../core/utils/resources/resources.dart';
import '../../../../src/app_router.dart';
import '../../../features.dart';
import 'count_circule_avatar.dart';

class HadithBookItemBtn extends StatelessWidget {
  const HadithBookItemBtn({
    super.key,
    required this.hadithBooksEnum,
  });
  final HadithBooksEnum hadithBooksEnum;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      onTap: () async => NavigatorHelper.pushNamed(
        AppRoutes.hadithsViewPage,
        extra: hadithBooksEnum,
      ),
      child: HadithBookItem(hadithBooksEnum: hadithBooksEnum),
    );
  }
}
