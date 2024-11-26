import 'package:flutter/material.dart';
import 'package:hadith_books/config/local/l10n.dart';
import 'package:hadith_books/core/core.dart';

class SearchResultCountWidget extends StatelessWidget {
  const SearchResultCountWidget({super.key, required this.resultCount});
  final int resultCount;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      style: AppStyles.normal.bold.copyWith(color: context.themeColors.secondary),
      TextSpan(
        text: '',
        children: [
          TextSpan(
            text: '${AppStrings.of(context).searchResultCount(resultCount)}.',
            style: AppStyles.normal.copyWith(color: context.themeColors.secondary),
          ),
          if (resultCount == 0)
            TextSpan(
              text: '\n${AppStrings.of(context).searchResultCountZeroHint}.',
              style: AppStyles.normal.bold.copyWith(
                color: context.themeColors.error,
              ),
            ),
        ],
      ),
    );
  }
}
