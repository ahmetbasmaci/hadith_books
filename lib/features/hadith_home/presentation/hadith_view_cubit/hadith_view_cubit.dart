import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hadith_books/core/enums/hadith_books_enum.dart';
import 'package:hadith_books/core/helpers/navigator_helper.dart';
import 'package:hadith_books/core/packages/local_storage/local_storage.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../core/services/search_service/search_tire_node.dart';
import '../../../../core/services/search_service/search_trie_service.dart';
import '../../../../core/usecase/params/hadith_book_params.dart';
import '../../../features.dart';

part 'hadith_view_state.dart';

class HadithViewCubit extends Cubit<HadithViewState> {
  final GetHadithBookUseCase getHadithBookUseCase;
  final ILocalStorage localStorage;
  final ISearchTrieService _searchTrieService;
  HadithViewCubit(this.getHadithBookUseCase, this.localStorage, this._searchTrieService) : super(HadithViewInitial());

  final ItemScrollController hadithItemScrollController = ItemScrollController();
  final ItemScrollController chapterItemScrollController = ItemScrollController();
  final ItemPositionsListener chapterItemPositionsListener = ItemPositionsListener.create();
  final PageController hadithPageViewController = PageController();
  late final HadithBooksEnum hadithBooksEnum;
  Future<void> init(HadithBooksEnum hadithBooksEnum) async {
    this.hadithBooksEnum = hadithBooksEnum;

    emit(HadithViewLoading());
    _setListeners(hadithBooksEnum);

    var hadithBookEntity = await _getHadithBook(hadithBooksEnum);
    if (hadithBookEntity == null) return;

    _saveLastReadedHadithBook(hadithBooksEnum);

    _updateHadithScrollCtrToSavedIndex(hadithBooksEnum);

    updateBookEntityToUi(hadithBookEntity, hadithBooksEnum);
  }

  void _setListeners(HadithBooksEnum hadithBooksEnum) {
    chapterItemPositionsListener.itemPositions.addListener(
      () {
        final visibleItems = chapterItemPositionsListener.itemPositions.value;
        if (visibleItems.isNotEmpty) {
          // Get the first visible item index
          int currentIndex = visibleItems.first.index;
          _saveHadithScrollCurrentIndex(hadithBooksEnum, currentIndex);
        }
      },
    );
    hadithPageViewController.addListener(
      () {
        //check if page is int
        if (hadithPageViewController.page!.round() == hadithPageViewController.page) {
          _saveHadithScrollCurrentIndex(hadithBooksEnum, int.parse(hadithPageViewController.page!.toStringAsFixed(0)));
          if (state is HadithViewLoaded) {
            emit((state as HadithViewLoaded)
                .copyWith(pageIndex: int.parse(hadithPageViewController.page!.toStringAsFixed(0))));
          }
        }
      },
    );
  }

  void updateHadithPage(int page) {
    hadithPageViewController.jumpToPage(page);
  }

  Future<void> _saveHadithScrollCurrentIndex(HadithBooksEnum hadithBooksEnum, int index) async {
    await localStorage.write(AppStorageKeys.lastReadedHadithItemIndex(hadithBooksEnum), index);
  }

  Future<HadithBookEntity?> _getHadithBook(HadithBooksEnum hadithBookEnum) async {
    // await Future.delayed(const Duration(milliseconds: 400));
    final params = GetHadithUseCaseParams(hadithBookEnum);
    final result = await getHadithBookUseCase(params);
    return result.fold(
      (l) {
        emit(HadithViewError(l.message));
        return null;
      },
      (r) {
        return r;
      },
    );
  }

  Future<void> _saveLastReadedHadithBook(HadithBooksEnum hadithBooksEnum) async {
    await localStorage.write(AppStorageKeys.lastReadedHadithBook(hadithBooksEnum), hadithBooksEnum.name);
  }

  void _updateHadithScrollCtrToSavedIndex(HadithBooksEnum hadithBooksEnum) {
    int lastReadedHadithItemIndex =
        localStorage.read<int>(AppStorageKeys.lastReadedHadithItemIndex(hadithBooksEnum)) ?? 0;

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _scrollHadithCtr(lastReadedHadithItemIndex);
      },
    );
  }

  void updateBookEntityToUi(HadithBookEntity hadithBookEntity, HadithBooksEnum hadithBooksEnum) {
    if (isClosed) return;

    int lastReadedChapterId = localStorage.read<int>(AppStorageKeys.lastReadedHadithChapterIndex(hadithBooksEnum)) ??
        hadithBookEntity.chapters.first.id;

    emit(HadithViewLoaded(hadithBookEntity, lastReadedChapterId));
  }

  void scrollChapterControlerToSavedIndex(HadithBookEntity hadithBookEntity, int selectedChapterId) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (chapterItemScrollController.isAttached) {
          int index = hadithBookEntity.chapters
              .indexOf(hadithBookEntity.chapters.firstWhere((chapter) => chapter.id == selectedChapterId));
          _scrollChapterCtr(index);
        }
      },
    );
  }

  Future<void> changeSelectedChapter(HadithBooksEnum hadithBooksEnum, ChapterEntity chapter) async {
    if (state is! HadithViewLoaded) return;

    _saveLastReadedHadithChapter(hadithBooksEnum, chapter.id);

    emit(HadithViewLoaded((state as HadithViewLoaded).hadithBookEntity, chapter.id));

    _scrollHadithCtr(0);

    NavigatorHelper.pop();
  }

  Future<void> _saveLastReadedHadithChapter(HadithBooksEnum hadithBooksEnum, int chapterId) async {
    await localStorage.write(AppStorageKeys.lastReadedHadithChapterIndex(hadithBooksEnum), chapterId);
  }

  void _scrollHadithCtr(int index) {
    if (hadithItemScrollController.isAttached) {
      hadithItemScrollController.jumpTo(index: index);
    }
    //chekc if hadithPageViewController is attached
    if (hadithPageViewController.hasClients) {
      hadithPageViewController.jumpToPage(index);
    }
  }

  void _scrollChapterCtr(int index) {
    chapterItemScrollController.jumpTo(index: index);
  }

  List<SearchHadithInfoModel> searchInTrie(String searchText) {
    var result = _searchTrieService.search(searchText);
    return result;
  }

  List<SearchHadithInfoModel> searchInTrieHadith(List<HadithEntity> hadith, String searchText) {
    var result = _searchTrieService.search(searchText);
    result = result.where((element) => hadith.any((element2) => element2.id == element.hadithId)).toList();
    return result;
  }
}
