import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/core.dart';

import '../../../features.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({
    super.key,
    required this.hadiths,
    required this.hadithBookEntities,
    required this.scrollController,
  });
  final List<HadithEntity> hadiths;
  final List<HadithBookEntity> hadithBookEntities;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      useAppbar: true,
      useSliver: false,
      actions: [
        const HadithViewPopupButton(showFontSizeOption: true, shoHadithViewTypeOption: false),
        SearchTextField(),
      ],
      body: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        controller: scrollController,
        itemCount: hadiths.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.all(AppSizes.screenPadding),
              child: SearchResultCountWidget(resultCount: hadiths.length),
            );
          } else if (index > hadiths.length) {
            return LoadedAllResultWidget(isHaveResult: index != 0);
          }
          var hadith = hadiths[index - 1];
          return HadithCardItem(
            index: index,
            hadith: hadith,
            hadithBookEntity: hadithBookEntities.firstWhere((x) => x.id == hadith.bookId),
            showBookTitle: true,
            searchText: context.read<SearchCubit>().searchController.text,
            isPageView: false,
          );
        },
      ),
    );
  }
}
