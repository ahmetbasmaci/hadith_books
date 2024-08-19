import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';

import '../../../../../core/widgets/components/app_circular_progress_indicator.dart';
import '../../../../features.dart';

class HadithViewBodySearchedItems extends StatefulWidget {
  const HadithViewBodySearchedItems(
      {super.key, required this.searchText, required this.hadithBookEntity, required this.hadiths});

  final String searchText;
  final HadithBookEntity hadithBookEntity;
  final List<HadithEntity> hadiths;
  @override
  State<HadithViewBodySearchedItems> createState() => _HadithViewBodySearchedItemsState();
}

class _HadithViewBodySearchedItemsState extends State<HadithViewBodySearchedItems> {
  final int _itemsPerPage = 30;
  final List<HadithEntity> _displayedHadiths = [];
  bool _isLoading = false;
  bool _isAllItemsLoaded = false;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _loadMoreItems();
  }

  Future<void> _loadMoreItems() async {
    if (_isLoading) return;
    if (_isAllItemsLoaded) return;
    setState(() {
      _isLoading = true;
    });

    // Simulating an asynchronous operation
    await Future.delayed(const Duration(milliseconds: 500));

    final startIndex = _currentPage * _itemsPerPage;
    if (startIndex > widget.hadiths.length) {
      setState(
        () {
          _isLoading = false;
          _isAllItemsLoaded = true;
        },
      );
      return;
    }
    final endIndex = startIndex + _itemsPerPage;

    final newItems = widget.hadiths
        .sublist(startIndex, endIndex.clamp(0, widget.hadiths.length))
        .where((hadith) => checkIfSearchValid(context, hadith))
        .toList();

    setState(
      () {
        _displayedHadiths.addAll(newItems);
        _currentPage++;
        _isLoading = false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading && _displayedHadiths.isEmpty) {
      return const AppCircularProgressIndicator();
    }
    var hadithHomeCubit = context.read<HadithViewCubit>();
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      controller: hadithHomeCubit.scrollController
        ..addListener(
          () {
            if (hadithHomeCubit.scrollController.position.pixels ==
                hadithHomeCubit.scrollController.position.maxScrollExtent) {
              _loadMoreItems();
            }
          },
        ),
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
        return HadithCardItem(index: index, hadith: hadith, hadithBookEntity: widget.hadithBookEntity);
      },
    );
  }

  Widget _buildLoaderIndicator() {
    return _isLoading ? const AppCircularProgressIndicator() : const SizedBox();
  }

  bool checkIfSearchValid(BuildContext context, HadithEntity hadith) {
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
