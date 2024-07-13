import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hadith_books/core/enums/hadith_books_enum.dart';
import 'package:hadith_books/core/helpers/navigator_helper.dart';

import '../../../../core/usecase/params/hadith_book_params.dart';
import '../../hadith_home.dart';

part 'hadith_view_state.dart';

class HadithViewCubit extends Cubit<HadithViewState> {
  final GetHadithBookUseCase getHadithBookUseCase;
  HadithViewCubit(this.getHadithBookUseCase) : super(HadithViewInitial());

  void init(HadithBooksEnum hadithBooksEnum) async {
    var hadithBookEntity = await getHadithBook(hadithBooksEnum);
    if (hadithBookEntity != null) {
      emit(HadithViewLoaded(hadithBookEntity, hadithBookEntity.chapters.first.id));
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

  void changeSelectedChapter(ChapterEntity chapter) {
    if (state is HadithViewLoaded) {
      emit(HadithViewLoaded((state as HadithViewLoaded).hadithBookEntity, chapter.id));
      NavigatorHelper.pop();
    }
  }
}
