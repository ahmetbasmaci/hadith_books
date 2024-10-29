import 'package:flutter/material.dart';

import '../../../../../core/core.dart';
import '../../../../features.dart';

class InfoCirculeAvatar extends StatelessWidget {
  const InfoCirculeAvatar({super.key, required this.hadithBooksEnum});
  final HadithBooksEnum hadithBooksEnum;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(AppSizes.borderRadius),
            bottomLeft: Radius.circular(AppSizes.borderRadius),
          ),
        ),
        child: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AutherPage(hadithBooksEnum: hadithBooksEnum);
              },
            );
          },
          child: AppIcons.info,
        ),
      ),
    );
  }
}