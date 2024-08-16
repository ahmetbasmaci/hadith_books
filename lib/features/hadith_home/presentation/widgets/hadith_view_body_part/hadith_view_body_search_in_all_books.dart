import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/components/app_scrollbar.dart';
import '../../../../features.dart';
import 'hadith_view_body_searched_items.dart';
import 'hadith_viwe_body_all_items.dart';

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
    List<Widget> allBooksItems = [];
    for (var i = 0; i < allHadithBookEntitys.length; i++) {
      //TODO add check to control if user selected this book or not to display results

      allBooksItems.add(HadithViweBodyAllItems(hadithBookEntity: allHadithBookEntitys[i]));
    }
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: allBooksItems,
    );
  }

  Widget _searchedBooksItems() {
    List<Widget> searchedBooksItems = [];
    for (var i = 0; i < allHadithBookEntitys.length; i++) {
      //TODO add check to control if user selected this book or not to display results

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
