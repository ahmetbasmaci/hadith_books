import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hadith_books/core/core.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../features.dart';

part 'hadith_view_state.dart';

class HadithViewCubit extends Cubit<HadithViewState> {
  final ILocalStorage _localStorage;
  final SearchCubit _searchCubit;
  final HadithHomeCubit _hadithHomeCubit;
  HadithViewCubit(this._localStorage, this._searchCubit, this._hadithHomeCubit) : super(HadithViewInitial());

  final ItemScrollController hadithItemScrollController = ItemScrollController();
  final ItemScrollController chapterItemScrollController = ItemScrollController();
  final ItemPositionsListener chapterItemPositionsListener = ItemPositionsListener.create();
  final PageController hadithPageViewController = PageController();
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> init(HadithBooksEnum hadithBooksEnum) async {
    emit(HadithViewLoading());

    await Future.delayed(Duration(milliseconds: 200));

    _setListeners(hadithBooksEnum);

    var hadithBookEntity = await _hadithHomeCubit.getHadithBook(hadithBooksEnum);
    if (hadithBookEntity == null) return;
    Future.microtask(() => _searchCubit.init(hadithBooksEnum));

    var auther = await _hadithHomeCubit.getAutherById(hadithBookEntity.metadata.autherId);

    _saveLastReadedHadithBook(hadithBooksEnum);

    _updateHadithScrollCtrToSavedIndex(hadithBooksEnum);

    updateBookEntityToUi(hadithBookEntity, auther, hadithBooksEnum);
  }

  void _setListeners(HadithBooksEnum hadithBooksEnum) {
    chapterItemPositionsListener.itemPositions.addListener(
      () {
        final visibleItems = chapterItemPositionsListener.itemPositions.value;

        // Get the first visible item index
        if (visibleItems.isNotEmpty) _saveHadithScrollInfo(hadithBooksEnum, visibleItems.first.index);
      },
    );
    hadithPageViewController.addListener(
      () {
        //check if page is int
        if (hadithPageViewController.page!.round() == hadithPageViewController.page) {
          _saveHadithScrollInfo(hadithBooksEnum, int.parse(hadithPageViewController.page!.toStringAsFixed(0)));

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

  Future<void> changeSelectedChapter(HadithBooksEnum hadithBooksEnum, Auther auther, ChapterEntity chapter) async {
    if (state is! HadithViewLoaded) return;

    _saveLastReadedHadithChapter(hadithBooksEnum, chapter.id);

    emit(HadithViewLoaded((state as HadithViewLoaded).hadithBookEntity, auther, chapter.id));

    _scrollHadithCtr(0);
    _saveLastReadedHadithId(hadithBooksEnum, 0);
    NavigatorHelper.pop();
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

  //! Read from local storage
  void _updateHadithScrollCtrToSavedIndex(HadithBooksEnum hadithBooksEnum) {
    int lastReadedHadithItemIndex =
        _localStorage.read<int>(AppStorageKeys.lastReadedHadithItemIndex(hadithBooksEnum)) ?? 0;

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _scrollHadithCtr(lastReadedHadithItemIndex);
      },
    );
  }

  void updateBookEntityToUi(HadithBookEntity hadithBookEntity, Auther auther, HadithBooksEnum hadithBooksEnum) {
    if (isClosed) return;

    int lastReadedChapterId = _localStorage.read<int>(AppStorageKeys.lastReadedHadithChapterIndex(hadithBooksEnum)) ??
        hadithBookEntity.chapters.first.id;

    emit(HadithViewLoaded(hadithBookEntity, auther, lastReadedChapterId));
  }

  //!Save to local storage
  Future<void> _saveHadithScrollInfo(HadithBooksEnum hadithBooksEnum, int index) async {
    _saveLastReadedHadithId(hadithBooksEnum, index);
    _saveHadithScrollCurrentIndex(hadithBooksEnum, index);
  }

  Future<void> _saveHadithScrollCurrentIndex(HadithBooksEnum hadithBooksEnum, int index) async {
    await _localStorage.write(AppStorageKeys.lastReadedHadithItemIndex(hadithBooksEnum), index);
  }

  Future<void> _saveLastReadedHadithId(HadithBooksEnum hadithBooksEnum, int index) async {
    if (state is! HadithViewLoaded) return;
    int chapterId = (state as HadithViewLoaded).selectedChapterId;
    var hadith =
        (state as HadithViewLoaded).hadithBookEntity.hadiths.where((e) => e.chapterId == chapterId).toList()[index];
    await _localStorage.write(AppStorageKeys.lastReadedHadithItemId(hadithBooksEnum), hadith.id);
  }

  Future<void> _saveLastReadedHadithBook(HadithBooksEnum hadithBooksEnum) async {
    await _localStorage.write(AppStorageKeys.lastReadedHadithBook(hadithBooksEnum), hadithBooksEnum.name);
  }

  Future<void> _saveLastReadedHadithChapter(HadithBooksEnum hadithBooksEnum, int chapterId) async {
    await _localStorage.write(AppStorageKeys.lastReadedHadithChapterIndex(hadithBooksEnum), chapterId);
  }

//! Search
  Future<List<SearchHadithInfoModel>> searchInTrie(List<HadithBooksEnum> hadithBookEnums, String searchText) async {
    List<SearchHadithInfoModel> data = await _searchCubit.searchInTrie(hadithBookEnums, searchText);
    return data;
  }

  Future<List<SearchHadithInfoModel>> searchInTrieHadith(List<HadithEntity> hadith, String searchText) async {
    List<SearchHadithInfoModel> data = await _searchCubit.searchInTrieHadith(hadith, searchText);
    return data;
  }
}
