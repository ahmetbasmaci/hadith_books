import 'package:flutter/material.dart';
import '../../../../core/utils/resources/resources.dart';
import '../../../../core/widgets/components/bottom_sheets/filter_search_in_all_books_model_bottom_sheet.dart';

class FilterHadithBookInSearch extends StatelessWidget {
  const FilterHadithBookInSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: AppIcons.filter,
      onPressed: () => FilterSearchInAllBooksModelBottomSheet.show(context),
    );
  }
}
