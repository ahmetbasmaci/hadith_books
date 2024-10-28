import 'package:flutter/material.dart';
import 'package:hadith_books/config/local/l10n.dart';
import 'package:hadith_books/core/core.dart';

class SearchResultCountWidget extends StatelessWidget {
  const SearchResultCountWidget({super.key, required this.resultCount});
  final int resultCount;
  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.of(context).searchResultCount(resultCount),
      style: AppStyles.normalBold.copyWith(color: context.themeColors.secondary),
    );
  }
}
