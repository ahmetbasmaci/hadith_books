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
    return AppScrollbar(
      controller: context.read<HadithViewCubit>().scrollController,
      child: searchText.isEmpty ? _allBooksItems() : _searchedBooksItems(),
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

  Widget _searchedBooksItems() {
    List<Widget> searchedBooksItems = [];
    for (var i = 0; i < allHadithBookEntitys.length; i++) {
      searchedBooksItems.add(
        HadithViewBodySearchedItems(
          hadithBookEntity: allHadithBookEntitys[i],
          searchText: searchText,
          hadiths: allHadithBookEntitys[i].hadiths,
        ),
      );
    }
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: searchedBooksItems,
    );
  }
}
