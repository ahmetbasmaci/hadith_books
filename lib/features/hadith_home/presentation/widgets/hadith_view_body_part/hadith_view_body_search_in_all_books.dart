import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/components/app_scrollbar.dart';
import '../../../../features.dart';

class HadithViewBodyPartSearchInAllBooks extends StatelessWidget {
  const HadithViewBodyPartSearchInAllBooks({super.key, required this.allHadithBookEntitys, required this.searchText});

  final String searchText;
  final List<HadithBookEntity> allHadithBookEntitys;

  @override
  Widget build(BuildContext context) {
    var scrollController = context.read<HadithViewCubit>().scrollController;
    return AppScrollbar(
      controller: scrollController,
      child: searchText.isEmpty ? _allBooksItems() : _searchedBooksItems(scrollController),
    );
  }

  Widget _allBooksItems() {
    // List<Widget> allBooksItems = [];
    // allBooksItems.add(HadithViweBodyAllItems(hadithBookEntity: allHadithBookEntitys[0]));
    // for (var i = 0; i < allHadithBookEntitys.length; i++) {
    //   allBooksItems.add(HadithViweBodyAllItems(hadithBookEntity: allHadithBookEntitys[i]));
    // }
    if (allHadithBookEntitys.isEmpty) return const SizedBox();
    return HadithViweBodyAllItems(hadithBookEntity: allHadithBookEntitys[0]);
  }

  Widget _searchedBooksItems(ScrollController scrollController) {
    List<Widget> searchedBooksItems = [];
    List<HadithEntity> allHadiths = [];
    for (var i = 0; i < allHadithBookEntitys.length; i++) {
      allHadiths.addAll(allHadithBookEntitys[i].hadiths);
    }

    // for (var i = 0; i < allHadithBookEntitys.length; i++) {
    //   searchedBooksItems.add(
    //     HadithViewBodySearchedItems(
    //       hadithBookEntity: allHadithBookEntitys[i],
    //       searchText: searchText,
    //       hadiths: allHadiths,
    //       scrollController: scrollController,
    //       showLoadingIndicator: i == 0,
    //     ),
    //   );
    // }
    // return ListView(
    //   shrinkWrap: true,
    //   physics: const BouncingScrollPhysics(),
    //   children: searchedBooksItems,
    // );
    return HadithViewBodySearchedItems(
      hadithBookEntities: allHadithBookEntitys,
      searchText: searchText,
      hadiths: allHadiths,
      scrollController: scrollController,
      showLoadingIndicator: true,
    );
  }
}
