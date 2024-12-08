import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/core.dart';
import '../../../../../features.dart';

class HadithViewBodySearchedItems extends StatefulWidget {
  const HadithViewBodySearchedItems({
    super.key,
    required this.searchText,
    required this.hadithBookEntities,
    required this.hadiths,
    required this.scrollController,
    this.showLoadingIndicator = true,
  });

  final String searchText;
  final List<HadithBookEntity> hadithBookEntities;
  final List<HadithEntity> hadiths;
  final bool showLoadingIndicator;
  final ScrollController scrollController;
  @override
  State<HadithViewBodySearchedItems> createState() => _HadithViewBodySearchedItemsState();
}

class _HadithViewBodySearchedItemsState extends State<HadithViewBodySearchedItems> {
  // static const int _itemsPerPage = 4000;
  // final List<HadithEntity> _displayedHadiths = [];
  // final bool _isAllItemsLoaded = false;
  // final int _lastSearchedIndex = 0;
  // var _allHadithsLength = 0;
  final bool _isLoading = false;
  final StreamController<double> _progressController = StreamController<double>();
  Map<String, HadithEntity> hadithMap = {};

  @override
  void dispose() {
    _progressController.close();
    widget.scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    //_allHadithsLength = widget.hadiths.length;

    widget.scrollController.addListener(_handleScroll);

    _createMap();
    // _loadMoreItems();
  }

  void _createMap() {
    // Step 1: Create a map for fast lookups
    hadithMap = {
      for (var hadith in widget.hadiths) _getHadithChachId(hadith.bookId, hadith.chapterId, hadith.id): hadith
    };
  }

  String _getHadithChachId(int bookId, int chaperId, int hadithId) {
    return '${bookId}_${chaperId}_$hadithId';
  }

  void _handleScroll() {
    const scrollThreshold = 0.9;
    if (!_isLoading &&
        widget.scrollController.position.pixels >= widget.scrollController.position.maxScrollExtent * scrollThreshold) {
      //_loadMoreItems();
    }
  }

  Future<List<HadithEntity>> _loadMoreItems() async {
    // if (_isLoading) return;
    // if (_isAllItemsLoaded) return;
    // setState(() {
    //   _isLoading = true;
    // });

    // Simulating an asynchronous operation
    // await Future.delayed(const Duration(milliseconds: 700));

    List<HadithEntity> newItems = await getFilteredItems();
    return newItems;
    // if (mounted) {
    //   setState(
    //     () {
    //       _displayedHadiths.addAll(newItems);

    //       _isLoading = false;
    //       _isAllItemsLoaded = _lastSearchedIndex == _allHadithsLength - 1;
    //     },
    //   );
    // }
  }

  Future<List<HadithEntity>> getFilteredItems() async {
    List<HadithBooksEnum> selectedHadithBooksEnums = widget.hadithBookEntities
        .map((e) => HadithBooksEnum.values.firstWhere((element) => element.bookId == e.id))
        .toList();
    var searchHadithResultInfoModels2 =
        await context.read<SearchCubit>().searchInTrie(selectedHadithBooksEnums, widget.searchText.removeTashkil);

    final Set<HadithEntity> uniqueItems = {};

    for (var element in searchHadithResultInfoModels2) {
      final key = _getHadithChachId(element.bookId, element.chapterId, element.hadithId);
      final matchedHadith = hadithMap[key];

      if (matchedHadith != null) {
        bool isMathcedHoleSentence = widget.searchText.trim().split(' ').length == 1
            ? true
            : _checkIfHadithContainsHoleSearchSentence(matchedHadith);

        if (isMathcedHoleSentence) {
          uniqueItems.add(matchedHadith); // Adds only if not already in the set
        }
      }
    }

    //sort by id
    List<HadithEntity> sortedItems = uniqueItems.toList();
    //order by book id then by id
    sortedItems.sort((a, b) {
      if (a.bookId == b.bookId) {
        return a.id.compareTo(b.id);
      }
      return a.bookId.compareTo(b.bookId);
    });
    return sortedItems;
  }

  bool _checkIfHadithContainsHoleSearchSentence(HadithEntity matchedHadith) {
    bool isMathcedHoleSentence = context.isArabicLang
        ? matchedHadith.arabic.removeTashkil.contains(widget.searchText.removeTashkil)
        : matchedHadith.english.text.contains(widget.searchText);
    return isMathcedHoleSentence;
  }

  @override
  Widget build(BuildContext context) {
    // if (_displayedHadiths.isEmpty) {
    //   return const SizedBox();
    // }
    // if (_isLoading && _displayedHadiths.isEmpty) {
    //   if (widget.showLoadingIndicator) {
    //     return AppWaitDialog(
    //       progressStream: _progressController.stream,
    //     );
    //   } else {
    //     return const SizedBox();
    //   }
    // }

    return FutureBuilder(
      future: _loadMoreItems(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error'));
        } else {
          var hadiths = snapshot.data as List<HadithEntity>;
          return _body(hadiths);
        }
      },
    );
  }

  ListView _body(List<HadithEntity> hadiths) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      controller: widget.scrollController,
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
          hadithBookEntity: widget.hadithBookEntities.firstWhere((x) => x.id == hadith.bookId),
          showBookTitle: true,
          searchText: widget.searchText,
          isPageView: false,
        );
      },
    );
  }

  Widget buildLoaderIndicator() {
    return const SizedBox();
    // if (_isLoading && widget.showLoadingIndicator) {
    //   return AppWaitDialog(
    //     progressStream: _progressController.stream,
    //   );
    // } else {
    //   return const SizedBox();
    // }
  }

  bool checkIfSearchValid(HadithEntity hadith) {
    return false;
    // if (widget.searchText.isEmpty) return true;
    // var searchHadithResultInfoModel = context.read<HadithViewCubit>().searchInTrie(widget.searchText);
    // if (searchHadithResultInfoModel == null) return false;
    // return searchHadithResultInfoModel.hadithIds.contains(hadith.id);

    // bool isSearchValid = true;
    // int? searchedNumber = int.tryParse(widget.searchText);
    // if (searchedNumber != null) {
    //   if (AppConstants.context.isArabicLang) {
    //     isSearchValid = hadith.arabic.contains(widget.searchText) || searchedNumber == hadith.id;
    //   } else {
    //     isSearchValid = hadith.english.text.contains(widget.searchText) ||
    //         hadith.english.narrator.contains(widget.searchText) ||
    //         searchedNumber == hadith.id;
    //   }
    // } else {
    //   if (AppConstants.context.isArabicLang) {
    //     isSearchValid = hadith.arabic.removeTashkil.contains(widget.searchText.removeTashkil);
    //   } else {
    //     isSearchValid =
    //         hadith.english.text.contains(widget.searchText) || hadith.english.narrator.contains(widget.searchText);
    //   }
    // }
    // return isSearchValid;
  }
}
