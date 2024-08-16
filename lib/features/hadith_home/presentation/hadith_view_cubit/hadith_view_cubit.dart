import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hadith_books/core/enums/hadith_books_enum.dart';
import 'package:hadith_books/core/helpers/navigator_helper.dart';
import 'package:hadith_books/core/packages/local_storage/local_storage.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';

import '../../../../core/usecase/params/hadith_book_params.dart';
import '../../../features.dart';

part 'hadith_view_state.dart';

class HadithViewCubit extends Cubit<HadithViewState> {
  final GetHadithBookUseCase getHadithBookUseCase;
  final ILocalStorage localStorage;
  HadithViewCubit(this.getHadithBookUseCase, this.localStorage) : super(HadithViewInitial());

  final ScrollController scrollController = ScrollController();

  void init(HadithBooksEnum hadithBooksEnum) async {
    scrollController.addListener(
      () async {
        await localStorage.write(
            AppStorageKeys.lastReadedHadithScrollPixell(hadithBooksEnum), scrollController.position.pixels);
      },
    );
    var hadithBookEntity = await getHadithBook(hadithBooksEnum);
    if (hadithBookEntity != null) {
      String? lastReadedBook = localStorage.read<String>(AppStorageKeys.lastReadedHadithBook(hadithBooksEnum));
      int lastReadedChapter = hadithBookEntity.chapters.first.id;

      /// Check if the last readed book is the same as the current book
      /// and get the last readed chapter and scroll to it
      if (lastReadedBook != null && lastReadedBook == hadithBooksEnum.name) {
        lastReadedChapter =
            localStorage.read<int>(AppStorageKeys.lastReadedHadithChapterIndex(hadithBooksEnum)) ?? lastReadedChapter;
        double lastReadedScrollPixel =
            localStorage.read<double>(AppStorageKeys.lastReadedHadithScrollPixell(hadithBooksEnum)) ?? 0;
        WidgetsBinding.instance.addPostFrameCallback(
          (_) {
            if (scrollController.hasClients) {
              scrollController.jumpTo(lastReadedScrollPixel);
            }
          },
        );
      }

      await localStorage.write(AppStorageKeys.lastReadedHadithBook(hadithBooksEnum), hadithBooksEnum.name);

      emit(HadithViewLoaded(hadithBookEntity, lastReadedChapter));
    }
  }

  Future<HadithBookEntity?> getHadithBook(HadithBooksEnum hadithBookEnum) async {
    emit(HadithViewLoading());
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

  Future<void> changeSelectedChapter(HadithBooksEnum hadithBooksEnum, ChapterEntity chapter) async {
    if (state is HadithViewLoaded) {
      await localStorage.write(AppStorageKeys.lastReadedHadithChapterIndex(hadithBooksEnum), chapter.id);
      emit(HadithViewLoaded((state as HadithViewLoaded).hadithBookEntity, chapter.id));
      scrollController.jumpTo(0);
      NavigatorHelper.pop();
    }
  }
}
