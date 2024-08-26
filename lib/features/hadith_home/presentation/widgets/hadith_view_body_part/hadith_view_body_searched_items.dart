import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';

import '../../../../../core/widgets/components/app_circular_progress_indicator.dart';
import '../../../../features.dart';

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
  static const int _itemsPerPage = 30;
  final List<HadithEntity> _displayedHadiths = [];
  bool _isLoading = false;
  bool _isAllItemsLoaded = false;
  int _currentPage = 0;

  @override
  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_handleScroll);
    _loadMoreItems();
  }

  void _handleScroll() {
    const scrollThreshold = 0.9;
    if (!_isLoading &&
        widget.scrollController.position.pixels >= widget.scrollController.position.maxScrollExtent * scrollThreshold) {
      _loadMoreItems();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _loadMoreItems() async {
    if (_isLoading) return;
    if (_isAllItemsLoaded) return;
    setState(() {
      _isLoading = true;
    });

    // Simulating an asynchronous operation
    await Future.delayed(const Duration(milliseconds: 300));

    if (_currentPage * _itemsPerPage >= widget.hadiths.length) {
      setState(() {
        _isAllItemsLoaded = true;
      });
      return;
    }
    final startIndex = _currentPage * _itemsPerPage;
    final endIndex = startIndex + _itemsPerPage;

    final newItems = widget.hadiths
        .sublist(startIndex, endIndex.clamp(0, widget.hadiths.length))
        .where((hadith) => checkIfSearchValid(hadith))
        .toList();

    if (mounted) {
      setState(
        () {
          _displayedHadiths.addAll(newItems);
          _currentPage++;
          _isLoading = false;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading && _displayedHadiths.isEmpty) {
      if (widget.showLoadingIndicator) {
        return const AppCircularProgressIndicator();
      } else {
        return const SizedBox();
      }
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      controller: widget.scrollController,
      itemCount: _displayedHadiths.length + 1,
      itemBuilder: (context, index) {
        if (index == _displayedHadiths.length) {
          if (_isAllItemsLoaded) {
            return const LoadedAllResultWidget();
          } else {
            return _buildLoaderIndicator();
          }
        }
        var hadith = _displayedHadiths[index];
        return HadithCardItem(
            index: index,
            hadith: hadith,
            hadithBookEntity: widget.hadithBookEntities.firstWhere((x) => x.id == hadith.bookId));
      },
    );
  }

  Widget _buildLoaderIndicator() {
    if (_isLoading && widget.showLoadingIndicator) {
      return const AppCircularProgressIndicator();
    } else {
      return const SizedBox();
    }
  }

  bool checkIfSearchValid(HadithEntity hadith) {
    bool isSearchValid = true;
    if (widget.searchText.isNotEmpty) {
      if (AppConstants.context.isArabicLang) {
        isSearchValid = hadith.arabic.removeTashkil.contains(widget.searchText.removeTashkil);
      } else {
        isSearchValid =
            hadith.english.text.contains(widget.searchText) || hadith.english.narrator.contains(widget.searchText);
      }
    }
    return isSearchValid;
  }
}
