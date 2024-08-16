// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../core/utils/resources/resources.dart';
// import '../../../../core/widgets/components/app_scrollbar.dart';
// import '../../../features.dart';

// class HadithViewBodyPart extends StatefulWidget {
//   HadithViewBodyPart({super.key, required this.hadithBookEntity, required this.chapterHadiths})
//       : searchText = '',
//         isSearchInChapter = false,
//         isSearchInHoleBook = false,
//         allHadithBookEntitys = [],
//         isSearchInAllBooks = false;
//   HadithViewBodyPart.withSearchTextInChapter(
//       {super.key, required this.hadithBookEntity, required this.chapterHadiths, required this.searchText})
//       : isSearchInChapter = true,
//         isSearchInHoleBook = false,
//         allHadithBookEntitys = [],
//         isSearchInAllBooks = false;
//   HadithViewBodyPart.withSearchTextHoleBook({super.key, required this.hadithBookEntity, required this.searchText})
//       : chapterHadiths = [],
//         isSearchInChapter = false,
//         isSearchInHoleBook = true,
//         allHadithBookEntitys = [],
//         isSearchInAllBooks = false;

//   final String searchText;
//   final List<HadithEntity> chapterHadiths;
//   final HadithBookEntity? hadithBookEntity;
//   final List<HadithBookEntity> allHadithBookEntitys;
//   final bool isSearchInChapter;
//   final bool isSearchInHoleBook;
//   final bool isSearchInAllBooks;

//   @override
//   State<HadithViewBodyPart> createState() => _HadithViewBodyPartState();
// }

// class _HadithViewBodyPartState extends State<HadithViewBodyPart> {
//   final int _itemsPerPage = 20;
//   final List<HadithEntity> _displayedHadiths = [];
//   bool _isLoading = false;
//   int _currentPage = 0;

//   @override
//   void initState() {
//     super.initState();
//   }

//   Future<void> _loadMoreItems() async {
//     if (_isLoading) return;

//     setState(() {
//       _isLoading = true;
//     });

//     // Simulating an asynchronous operation
//     await Future.delayed(const Duration(milliseconds: 500));

//     final startIndex = _currentPage * _itemsPerPage;
//     final endIndex = startIndex + _itemsPerPage;
//     final newItems = widget.hadithBookEntity!.hadiths
//         .sublist(startIndex, endIndex.clamp(0, widget.hadithBookEntity!.hadiths.length))
//         .where((hadith) => checkIfSearchValid(context, hadith))
//         .toList();

//     setState(() {
//       _displayedHadiths.addAll(newItems);
//       _currentPage++;
//       _isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AppScrollbar(
//       controller: context.read<HadithViewCubit>().scrollController,
//       child: widget.isSearchInAllBooks
//           ? _searchInAllBooks(context)
//           : widget.isSearchInHoleBook
//               ? _searchInHoleBook(context)
//               : widget.isSearchInChapter
//                   ? _searchInChapter(context)
//                   : _allItems(context),
//     );
//   }

//   Widget _searchInAllBooks(BuildContext context) {
//     List<HadithEntity> allHadiths = [];
//     for (var hadithBook in widget.allHadithBookEntitys) {
//       allHadiths.addAll(hadithBook.hadiths);
//     }
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: const BouncingScrollPhysics(),
//       controller: context.read<HadithViewCubit>().scrollController,
//       itemCount: allHadiths.length,
//       itemBuilder: (context, index) {
//         var hadith = allHadiths[index];
// //TODO add chapter filter
//         if (!checkIfSearchValid(context, hadith)) {
//           return const SizedBox();
//         }
//         var hadithBookEntity = widget.allHadithBookEntitys.firstWhere((element) => element.id == hadith.bookId);
//         return _resultItem(index, hadith, hadithBookEntity);
//       },
//     );
//   }

//   Widget _searchInHoleBook(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: const BouncingScrollPhysics(),
//       controller: context.read<HadithViewCubit>().scrollController,
//       itemCount: widget.hadithBookEntity!.hadiths.length,
//       itemBuilder: (context, index) {
//         var hadith = widget.hadithBookEntity!.hadiths[index];
//         if (!checkIfSearchValid(context, hadith)) {
//           return const SizedBox();
//         }
//         return _resultItem(index, hadith, widget.hadithBookEntity!);
//       },
//     );
//   }

//   Widget _searchInChapter(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: const BouncingScrollPhysics(),
//       controller: context.read<HadithViewCubit>().scrollController,
//       itemCount: widget.chapterHadiths.length,
//       itemBuilder: (context, index) {
//         var hadith = widget.chapterHadiths[index];
//         if (!checkIfSearchValid(context, hadith)) {
//           return const SizedBox();
//         }

//         return _resultItem(index, hadith, widget.hadithBookEntity!);
//       },
//     );
//   }

//   Widget _allItems(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: const BouncingScrollPhysics(),
//       controller: context.read<HadithViewCubit>().scrollController,
//       itemCount: widget.chapterHadiths.length,
//       itemBuilder: (context, index) {
//         var hadith = widget.chapterHadiths[index];
//         return _resultItem(
//           index,
//           hadith,
//           widget.hadithBookEntity!,
//         );
//       },
//     );
//   }

//   Padding _resultItem(int index, HadithEntity hadith, HadithBookEntity hadithBookEntity) {
//     return Padding(
//       padding: EdgeInsets.only(
//         left: AppSizes.screenPadding,
//         right: AppSizes.screenPadding,
//         top: AppSizes.screenPadding,
//       ),
//       child: HadithCardItem(hadith: hadith, hadithBookEntity: hadithBookEntity),
//       // AnimatedListItemUpToDown(
//       //   index: index,
//       //   slideDuration: const Duration(milliseconds: 0),
//       //   staggerDuration: const Duration(milliseconds: 0),
//       //   child: HadithCardItem(hadith: hadith),
//       // ),
//     );
//   }

//   bool checkIfSearchValid(BuildContext context, HadithEntity hadith) {
//     bool isSearchValid = true;
//     if (widget.searchText.isNotEmpty) {
//       if (context.isArabicLang) {
//         isSearchValid = hadith.arabic.removeTashkil.contains(widget.searchText.removeTashkil);
//       } else {
//         isSearchValid =
//             hadith.english.text.contains(widget.searchText) || hadith.english.narrator.contains(widget.searchText);
//       }
//     }
//     return isSearchValid;
//   }
// }
