import 'package:flutter/material.dart';

import '../../../../../core/core.dart';

class HadithCountWidget extends StatelessWidget {
  const HadithCountWidget({super.key, required this.index, required this.hadithId, required this.searchText});
  final int index;
  final int hadithId;
  final String searchText;
  @override
  Widget build(BuildContext context) {
    bool isMathcedWithSearch = searchText.isNotEmpty && int.tryParse(searchText) == hadithId;
    String count = searchText.isEmpty ? '$hadithId' : '$hadithId';
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.xsmallSpace),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surface,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(AppSizes.smallBorderRadius),
        ),
      ),
      child: FittedBox(
        fit: BoxFit.cover,
        child: Text(
          count,
          style: AppStyles.small.bold.copyWith(
            backgroundColor: isMathcedWithSearch ? context.themeColors.primary.withOpacity(0.2) : Colors.transparent,
          ),
        ),
      ),
    );
  }
}
