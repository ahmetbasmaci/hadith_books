import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hadith_books/core/enums/hadith_books_enum.dart';
import 'package:hadith_books/core/helpers/navigator_helper.dart';
import 'package:hadith_books/core/packages/local_storage/local_storage.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../core/usecase/params/hadith_book_params.dart';
import '../../../features.dart';

part 'hadith_view_state.dart';

class HadithViewCubit extends Cubit<HadithViewState> {
  final GetHadithBookUseCase getHadithBookUseCase;
  final ILocalStorage localStorage;
  HadithViewCubit(this.getHadithBookUseCase, this.localStorage) : super(HadithViewInitial());

  final ItemScrollController hadithItemScrollController = ItemScrollController();
  final ItemScrollController chapterItemScrollController = ItemScrollController();
  final ItemPositionsListener chapterItemPositionsListener = ItemPositionsListener.create();
  Future<void> init(HadithBooksEnum hadithBooksEnum) async {
    emit(HadithViewLoading());
    _setListeners(hadithBooksEnum);

    var hadithBookEntity = await _getHadithBook(hadithBooksEnum);
    if (hadithBookEntity == null) return;

    await _saveLastReadedHadithBook(hadithBooksEnum);

    _updateHadithScrollCtrToSavedIndex(hadithBookEntity, hadithBooksEnum);

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
  }

  Future<void> _saveHadithScrollCurrentIndex(HadithBooksEnum hadithBooksEnum, int index) async {
    await localStorage.write(AppStorageKeys.lastReadedHadithItemIndex(hadithBooksEnum), index);
  }

  Future<HadithBookEntity?> _getHadithBook(HadithBooksEnum hadithBookEnum) async {
    await Future.delayed(const Duration(milliseconds: 1000));
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

  void _updateHadithScrollCtrToSavedIndex(HadithBookEntity hadithBookEntity, HadithBooksEnum hadithBooksEnum) {
    int lastReadedHadithItemIndex =
        localStorage.read<int>(AppStorageKeys.lastReadedHadithItemIndex(hadithBooksEnum)) ?? 0;

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (hadithItemScrollController.isAttached) {
          _scrollHadithCtr(lastReadedHadithItemIndex);
        }
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
    hadithItemScrollController.jumpTo(index: index);
  }

  void _scrollChapterCtr(int index) {
    chapterItemScrollController.jumpTo(index: index);
  }
}
