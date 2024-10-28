import 'package:flutter/material.dart';
import '../../../../../../core/widgets/components/app_scrollbar.dart';
import '../../../../../features.dart';

class HadithViewBodyPartSearchInAllBooks extends StatelessWidget {
  const HadithViewBodyPartSearchInAllBooks({super.key, required this.allHadithBookEntitys, required this.searchText});

  final String searchText;
  final List<HadithBookEntity> allHadithBookEntitys;

  @override
  Widget build(BuildContext context) {
    var scrollController = ScrollController();
    return AppScrollbar(
      controller: scrollController,
      child: searchText.isEmpty ? _allBooksItems() : _searchedBooksItems(scrollController),
    );
  }

  Widget _allBooksItems() {
    if (allHadithBookEntitys.isEmpty) return const SizedBox();
    return HadithViweBodyAllItems(hadithBookEntities: allHadithBookEntitys);
  }

  Widget _searchedBooksItems(ScrollController scrollController) {
    List<HadithEntity> allHadiths = [];
    for (var i = 0; i < allHadithBookEntitys.length; i++) {
      allHadiths.addAll(allHadithBookEntitys[i].hadiths);
    }

    return HadithViewBodySearchedItems(
      hadithBookEntities: allHadithBookEntitys,
      searchText: searchText,
      hadiths: allHadiths,
      scrollController: scrollController,
      showLoadingIndicator: true,
    );
  }
}
