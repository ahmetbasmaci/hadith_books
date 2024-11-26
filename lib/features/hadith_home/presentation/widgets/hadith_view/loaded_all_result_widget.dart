import 'package:flutter/material.dart';

import '../../../../../config/local/l10n.dart';
import '../../../../../core/core.dart';

class LoadedAllResultWidget extends StatelessWidget {
  const LoadedAllResultWidget({super.key, required this.isHaveResult});

  final bool isHaveResult;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppSizes.smallSpace),
      child: Column(
        children: [
          Text(isHaveResult ? AppStrings.of(context).resultEnded : AppStrings.of(context).noResultsFounded,
              style: AppStyles.normal.bold.copyWith(color: context.themeColors.secondary)),
          const Divider(endIndent: 25, indent: 25),
        ],
      ),
    );
  }
}
