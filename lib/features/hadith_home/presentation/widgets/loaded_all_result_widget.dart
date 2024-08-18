import 'package:flutter/material.dart';

import '../../../../config/local/l10n.dart';
import '../../../../core/utils/resources/resources.dart';

class LoadedAllResultWidget extends StatelessWidget {
  const LoadedAllResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(top: AppSizes.smallSpace),
      child: Column(
        children: [
          Text(AppStrings.of(context).resultEnded,
              style: AppStyles.normalBold.copyWith(color: context.themeColors.secondary)),
          const Divider(endIndent: 25, indent: 25),
        ],
      ),
    );
  }
}
