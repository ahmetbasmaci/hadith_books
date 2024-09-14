import 'package:flutter/material.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';

import '../../../../features/features.dart';

class AppSearch {
  AppSearch._();

  static void showSearchAllBooks({required List<HadithBookEntity> selectedHadithBooksEnums}) async {
    await showSearch(
      context: AppConstants.context,
      delegate: AppSearchDelegate(
        child: (query) =>
            HadithViewBodyPartSearchInAllBooks(allHadithBookEntitys: selectedHadithBooksEnums, searchText: query),
      ),
    );
  }

  static void showSearchInBook({required HadithBookEntity hadithBookEntity}) async {
    await showSearch(
      context: AppConstants.context,
      delegate: AppSearchDelegate(
        child: (query) => HadithViewBodyPartSearchInBook(hadithBookEntity: hadithBookEntity, searchText: query),
      ),
    );
  }

  static void showSearchInChapter({required HadithBookEntity hadithBookEntity, required int chapterId}) async {
    await showSearch(
      context: AppConstants.context,
      delegate: AppSearchDelegate(
        child: (query) => HadithViewBodyPartSearchInChapter(
          hadithBookEntity: hadithBookEntity,
          searchText: query,
          chapterId: chapterId,
        ),
      ),
    );
  }

  static void showSearchInFavorite() async {
    await showSearch(
      context: AppConstants.context,
      delegate: AppSearchDelegate(
        child: (query) => FavoriteBodyWithLoading.withSearchText(searchText: query),
        // fromFavoritePage: true,
      ),
    );
  }
}
