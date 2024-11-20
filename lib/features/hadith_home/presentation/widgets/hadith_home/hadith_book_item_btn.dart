import 'package:flutter/material.dart';

import '../../../../../core/core.dart';
import '../../../../../src/app_router.dart';
import '../../../../features.dart';

class HadithBookItemBtn extends StatelessWidget {
  const HadithBookItemBtn({
    super.key,
    required this.hadithBooksEnum,
  });
  final HadithBooksEnum hadithBooksEnum;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, setState) {
        return InkWell(
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          onTap: () async {
            await NavigatorHelper.pushNamed(
              AppRoutes.hadithsViewPage,
              extra: HadithBooksEnumCodec().encoder.convert(hadithBooksEnum),
            );
            if (context.mounted) {
              setState(() {}); //in order to update raeded percent after returning from hadithsViewPage
            }
          },
          child: HadithBookItem(hadithBooksEnum: hadithBooksEnum),
        );
      },
    );
  }
}
