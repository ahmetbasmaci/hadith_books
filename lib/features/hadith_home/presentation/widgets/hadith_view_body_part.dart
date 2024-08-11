import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/resources/resources.dart';
import '../../../../core/widgets/components/app_scrollbar.dart';
import '../../../features.dart';

class HadithViewBodyPart extends StatelessWidget {
  HadithViewBodyPart({super.key, required this.hadithBookEntity, required this.chapterHadiths})
      : searchText = '',
        isSearchInChapter = false,
        isSearchInHoleBook = false,
        allHadithBookEntitys = [],
        isSearchInAllBooks = false;
  HadithViewBodyPart.withSearchTextInChapter(
      {super.key, required this.hadithBookEntity, required this.chapterHadiths, required this.searchText})
      : isSearchInChapter = true,
        isSearchInHoleBook = false,
        allHadithBookEntitys = [],
        isSearchInAllBooks = false;
  HadithViewBodyPart.withSearchTextHoleBook({super.key, required this.hadithBookEntity, required this.searchText})
      : chapterHadiths = [],
        isSearchInChapter = false,
        isSearchInHoleBook = true,
        allHadithBookEntitys = [],
        isSearchInAllBooks = false;
  HadithViewBodyPart.withSearchTextAllBooks({super.key, required this.allHadithBookEntitys, required this.searchText})
      : chapterHadiths = [],
        hadithBookEntity = null,
        isSearchInChapter = false,
        isSearchInHoleBook = true,
        isSearchInAllBooks = true;
  final String searchText;
  final List<HadithEntity> chapterHadiths;
  final HadithBookEntity? hadithBookEntity;
  final List<HadithBookEntity> allHadithBookEntitys;
  final bool isSearchInChapter;
  final bool isSearchInHoleBook;
  final bool isSearchInAllBooks;
  @override
  Widget build(BuildContext context) {
    return AppScrollbar(
      controller: context.read<HadithViewCubit>().scrollController,
      child: isSearchInAllBooks
          ? _searchInAllBooks(context)
          : isSearchInHoleBook
              ? _searchInHoleBook(context)
              : isSearchInChapter
                  ? _searchInChapter(context)
                  : _allItems(context),
    );
  }

  Widget _searchInAllBooks(BuildContext context) {
    List<HadithEntity> allHadiths = [];
    for (var hadithBook in allHadithBookEntitys) {
      allHadiths.addAll(hadithBook.hadiths);
    }
    return ListView.builder(
      controller: context.read<HadithViewCubit>().scrollController,
      itemCount: allHadiths.length,
      itemBuilder: (context, index) {
        var hadith = allHadiths[index];
//TODO add chapter filter
        if (!checkIfSearchValid(context, hadith)) {
          return const SizedBox();
        }
        var hadithBookEntity = allHadithBookEntitys.firstWhere((element) => element.id == hadith.bookId);
        return _resultItem(index, hadith, hadithBookEntity);
      },
    );
  }

  Widget _searchInHoleBook(BuildContext context) {
    return ListView.builder(
      controller: context.read<HadithViewCubit>().scrollController,
      itemCount: hadithBookEntity!.hadiths.length,
      itemBuilder: (context, index) {
        var hadith = hadithBookEntity!.hadiths[index];
        if (!checkIfSearchValid(context, hadith)) {
          return const SizedBox();
        }
        return _resultItem(index, hadith, hadithBookEntity!);
      },
    );
  }

  Widget _searchInChapter(BuildContext context) {
    return ListView.builder(
      controller: context.read<HadithViewCubit>().scrollController,
      itemCount: chapterHadiths.length,
      itemBuilder: (context, index) {
        var hadith = chapterHadiths[index];
        if (!checkIfSearchValid(context, hadith)) {
          return const SizedBox();
        }

        return _resultItem(index, hadith, hadithBookEntity!);
      },
    );
  }

  Widget _allItems(BuildContext context) {
    return ListView.builder(
      controller: context.read<HadithViewCubit>().scrollController,
      itemCount: chapterHadiths.length,
      itemBuilder: (context, index) {
        var hadith = chapterHadiths[index];
        return _resultItem(
          index,
          hadith,
         hadithBookEntity!,
        );
      },
    );
  }

  Padding _resultItem(int index, HadithEntity hadith,HadithBookEntity hadithBookEntity) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppSizes.screenPadding,
        right: AppSizes.screenPadding,
        top: AppSizes.screenPadding,
      ),
      child: HadithCardItem(hadith: hadith, hadithBookEntity: hadithBookEntity),
      // AnimatedListItemUpToDown(
      //   index: index,
      //   slideDuration: const Duration(milliseconds: 0),
      //   staggerDuration: const Duration(milliseconds: 0),
      //   child: HadithCardItem(hadith: hadith),
      // ),
    );
  }

  bool checkIfSearchValid(BuildContext context, HadithEntity hadith) {
    bool isSearchValid = true;
    if (searchText.isNotEmpty) {
      if (context.isArabicLang) {
        isSearchValid = hadith.arabic.removeTashkil.contains(searchText.removeTashkil);
      } else {
        isSearchValid = hadith.english.text.contains(searchText) || hadith.english.narrator.contains(searchText);
      }
    }
    return isSearchValid;
  }
}
