import 'package:flutter/material.dart';
import '../../../../../../core/widgets/components/app_scrollbar.dart';
import '../../../../../features.dart';

class HadithViewSearchBodyPart extends StatelessWidget {
  const HadithViewSearchBodyPart({super.key, required this.hadithBookEntities, required this.searchText});

  final String searchText;
  final List<HadithBookEntity> hadithBookEntities;

  @override
  Widget build(BuildContext context) {
    var scrollController = ScrollController();
    return AppScrollbar(
      controller: scrollController,
      child: searchText.isEmpty ? _allBooksItems() : _searchedBooksItems(scrollController),
    );
  }

  Widget _allBooksItems() {
    if (hadithBookEntities.isEmpty) return const SizedBox();
    return HadithViweBodyAllItems(hadithBookEntities: hadithBookEntities);
  }

  Widget _searchedBooksItems(ScrollController scrollController) {
    final allHadiths = hadithBookEntities.expand((element) => element.hadiths).toList();

    return HadithViewBodySearchedItems(
      hadithBookEntities: hadithBookEntities,
      searchText: searchText,
      hadiths: allHadiths,
      scrollController: scrollController,
      showLoadingIndicator: true,
    );
  }
}
