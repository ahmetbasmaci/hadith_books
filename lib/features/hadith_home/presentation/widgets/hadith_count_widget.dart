import 'package:flutter/material.dart';

import '../../../../core/utils/resources/resources.dart';

class HadithCountWidget extends StatelessWidget {
  const HadithCountWidget({super.key, required this.hadithId, required this.searchText});
  final int hadithId;
  final String searchText;
  @override
  Widget build(BuildContext context) {
    bool isSearch = searchText.isNotEmpty && int.tryParse(searchText) == hadithId;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.xsmallSpace),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surface,
        border: Border.all(color: context.theme.colorScheme.secondary),
        borderRadius: BorderRadius.circular(AppSizes.smallBorderRadius),
      ),
      child: FittedBox(
        fit: BoxFit.cover,
        child: Text(
          '$hadithId',
          style: AppStyles.normalBold.copyWith(
            backgroundColor: Colors.yellow.withOpacity(isSearch ? 0.5 : 0),
          ),
        ),
      ),
    );
  }
}
