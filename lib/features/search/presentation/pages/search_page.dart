import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/core.dart';

import '../../../features.dart';
import '../cubit/search_cubit.dart';
import '../widgets/search_result_count_widget.dart';
import '../widgets/search_text_field.dart';

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
        const HadithViewPopupButton(),
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
            // if (_isAllItemsLoaded) {
            //   return LoadedAllResultWidget(isHaveResult: index != 0);
            // } else {
            //   return _buildLoaderIndicator();
            // }
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
