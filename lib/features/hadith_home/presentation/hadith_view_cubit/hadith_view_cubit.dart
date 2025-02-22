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
  final TextEditingController hadithPageTexyEditCtr = TextEditingController();

  Future<void> init(HadithBooksEnum hadithBooksEnum) async {
    emit(HadithViewLoading());

    //to show loading part
    await Future.delayed(Duration(milliseconds: 200));

    _setListeners(hadithBooksEnum);

    Future.microtask(() => _searchCubit.init(hadithBooksEnum));

    _saveLastReadedHadithBook(hadithBooksEnum);

    _updateHadithScrollCtrToSavedIndex(hadithBooksEnum);

    updateBookEntityToUi(hadithBooksEnum);
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
          int page = int.parse(hadithPageViewController.page!.toStringAsFixed(0));
          _saveHadithScrollInfo(hadithBooksEnum, page);
          hadithPageTexyEditCtr.text = '${page + 1}';
          if (state is HadithViewLoaded) {
            emit((state as HadithViewLoaded).copyWith(pageIndex: page));
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

  Future<void> updateSelectedChapter(int chapterId, bool isClickedFromDrawer) async {
    if (state is! HadithViewLoaded) return;
    var hadithBookFullModel = (state as HadithViewLoaded).hadithBookFullModel;
    var hadithBooksEnum = HadithBooksEnum.values.firstWhere((x) => x.bookId == hadithBookFullModel.hadithBook.id);

    //save last readed chapter
    _saveLastReadedHadithChapter(hadithBooksEnum, chapterId);

    emit((state as HadithViewLoaded).copyWith(selectedChapterId: chapterId));

    //scroll to selected chapter and save data if clicked from drawer button
    if (isClickedFromDrawer) {
      var index = hadithBookFullModel.hadithBook.hadiths.firstWhere((x) => x.chapterId == chapterId).id;

      _scrollHadithCtr(index - 1);

      _saveLastReadedHadithId(hadithBooksEnum, 0);

      NavigatorHelper.pop();
    }
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

  Future<void> updateBookEntityToUi(HadithBooksEnum hadithBooksEnum) async {
    if (isClosed) return;

    var hadithBookFullModel = await _hadithHomeCubit.getHadithBookFullModel(hadithBooksEnum);

    int lastReadedChapterId = _localStorage.read<int>(AppStorageKeys.lastReadedHadithChapterIndex(hadithBooksEnum)) ??
        hadithBookFullModel.hadithBook.chapters.first.id;

    emit(HadithViewLoaded(hadithBookFullModel, lastReadedChapterId));
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

    var hadith = (state as HadithViewLoaded).hadithBookFullModel.hadithBook.hadiths.toList()[index];
    await _localStorage.write(AppStorageKeys.lastReadedHadithItemId(hadithBooksEnum), hadith.id);
  }

  Future<void> _saveLastReadedHadithBook(HadithBooksEnum hadithBooksEnum) async {
    await _localStorage.write(AppStorageKeys.lastReadedHadithBook(hadithBooksEnum), hadithBooksEnum.name);
  }

  Future<void> _saveLastReadedHadithChapter(HadithBooksEnum hadithBooksEnum, int chapterId) async {
    await _localStorage.write(AppStorageKeys.lastReadedHadithChapterIndex(hadithBooksEnum), chapterId);
  }

  @override
  Future<void> close() {
    // hadithItemScrollController.dispose();
    // chapterItemScrollController.dispose();
    // chapterItemPositionsListener.dispose();
    hadithPageViewController.dispose();
    hadithPageTexyEditCtr.dispose();
    return super.close();
  }
}
