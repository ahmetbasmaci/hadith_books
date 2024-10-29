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
  final List<HadithEntity> _displayedHadiths = [];
  bool _isLoading = false;
  bool _isAllItemsLoaded = false;
  final int _lastSearchedIndex = 0;
  var _allHadithsLength = 0;
  final StreamController<double> _progressController = StreamController<double>();
  @override
  void dispose() {
    _progressController.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _allHadithsLength = widget.hadiths.length;

    widget.scrollController.addListener(_handleScroll);
    _loadMoreItems();
  }

  void _handleScroll() {
    const scrollThreshold = 0.9;
    if (!_isLoading &&
        widget.scrollController.position.pixels >= widget.scrollController.position.maxScrollExtent * scrollThreshold) {
      //_loadMoreItems();
    }
  }

  Future<void> _loadMoreItems() async {
    if (_isLoading) return;
    if (_isAllItemsLoaded) return;
    setState(() {
      _isLoading = true;
    });

    // Simulating an asynchronous operation
    // await Future.delayed(const Duration(milliseconds: 700));

    List<HadithEntity> newItems = await getFilteredItems();

    if (mounted) {
      setState(
        () {
          _displayedHadiths.addAll(newItems);

          _isLoading = false;
          _isAllItemsLoaded = _lastSearchedIndex == _allHadithsLength - 1;
        },
      );
    }
  }

  Future<List<HadithEntity>> getFilteredItems() async {
    List<HadithEntity> newItems2 = [];
    var searchHadithResultInfoModels2 = context.read<HadithViewCubit>().searchInTrie(widget.searchText);
    for (var element in searchHadithResultInfoModels2) {
      for (var hadith in widget.hadiths) {
        if (element.hadithId == hadith.id && element.bookId == hadith.bookId && element.chapterId == hadith.chapterId) {
          if (!newItems2.contains(hadith)) {
            newItems2.add(hadith);
          }
        }
      }
    }
    return newItems2;

    // List<HadithEntity> newItems = [];
    // int startIndex = _lastSearchedIndex;
    // double progress1 = 0;
    // double progress2 = 0;

    // var searchHadithResultInfoModels = context.read<HadithViewCubit>().searchInTrie(widget.searchText);
    // for (var i = startIndex; i < _allHadithsLength; i++) {
    //   _lastSearchedIndex = i;

    //   //increase stream here
    //   progress1 = (i + 1) / _itemsPerPage;

    //   if (newItems.length == _itemsPerPage) {
    //     break;
    //   }

    //   var hadith = widget.hadiths[i];
    //   // if (checkIfSearchValid(hadith)) {
    //   if (searchHadithResultInfoModels.any((element) => element.hadithId == hadith.id)) {
    //     newItems.add(hadith);

    //     //increase stream here
    //     progress2 = (newItems.length) / _itemsPerPage;
    //   }
    // }
    // _progressController.add(progress1 > progress2 ? progress1 : progress2);
    // return newItems;
  }

  @override
  Widget build(BuildContext context) {
    if (_displayedHadiths.isEmpty) {
      return const SizedBox();
    }
    if (_isLoading && _displayedHadiths.isEmpty) {
      if (widget.showLoadingIndicator) {
        return AppWaitDialog(
          progressStream: _progressController.stream,
        );
      } else {
        return const SizedBox();
      }
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      controller: widget.scrollController,
      itemCount: _displayedHadiths.length + 2,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: EdgeInsets.all(AppSizes.screenPadding),
            child: SearchResultCountWidget(resultCount: _displayedHadiths.length),
          );
        } else if (index > _displayedHadiths.length) {
          return LoadedAllResultWidget(isHaveResult: index != 0);
          // if (_isAllItemsLoaded) {
          //   return LoadedAllResultWidget(isHaveResult: index != 0);
          // } else {
          //   return _buildLoaderIndicator();
          // }
        }
        var hadith = _displayedHadiths[index - 1];
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
