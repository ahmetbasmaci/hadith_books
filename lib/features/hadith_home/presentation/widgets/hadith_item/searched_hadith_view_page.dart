import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/core.dart';

import '../../../../features.dart';
import '../home_page_search_appbar_widget.dart';

class SearchedHadithViewPage extends StatelessWidget {
  const SearchedHadithViewPage({super.key, required this.hadith});
  final HadithEntity hadith;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
           HomePageSearchAppbarWidget(showBackIcon: true,showSearchIcon: false),
            Expanded(
              child: FutureBuilder(
                future: context
                    .read<HadithHomeCubit>()
                    .getHadithBook(HadithBooksEnum.values.firstWhere((e) => e.bookId == hadith.bookId)),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return HadithCardItem.tempData(isPageView: true);
                  }
                  HadithBookEntity hadithBookEntity = snapshot.data;
                  return HadithCardItem(
                    index: 0,
                    hadith: hadith,
                    hadithBookEntity: hadithBookEntity,
                    showBookTitle: true,
                    isPageView: true,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
