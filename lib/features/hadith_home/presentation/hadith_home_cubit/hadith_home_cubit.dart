import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hadith_books/features/search/domain/usecases/init_all_search_tria_use_case.dart';
import '../../../../core/core.dart';
import '../../../features.dart';
import '../../domain/usecases/get_last_readed_hadith_id.dart';
part 'hadith_home_state.dart';

class HadithHomeCubit extends Cubit<HadithHomeState> {
  final GetAllHadithBookUseCase _getAllHadithBookUseCase;
  final GetHadithBookUseCase _getHadithBookUseCase;
  final GetAllAuthersUseCase _getAllAuthersUseCase;
  final InitAllSearchTriaUseCase _initAllSearchTriasUseCase;
  final GetLastReadedHadithId _getLastReadedHadithId;

  final ScrollController scrollController = ScrollController();

  HadithHomeCubit(this._getAllHadithBookUseCase, this._getHadithBookUseCase, this._getAllAuthersUseCase,
      this._initAllSearchTriasUseCase, this._getLastReadedHadithId)
      : super(HadithHomeInitial());

  Future<void> init() async {
    if (kDebugMode) {
      await Future.wait([
        //_initAllHadithsBooks(),
        _initAllAuthers(),
        // _initAllSearchTrias(),
      ]);
    } else {
      await Future.wait([
        //_initAllHadithsBooks(),
        _initAllAuthers(),
        // _initAllSearchTrias(),
      ]);
    }
  }

  //! Hadiths Books
  Future<List<HadithBookEntity>> get allHadithsBooks async {
    while (state is HadithHomeLoading) {
      await Future.delayed(const Duration(milliseconds: 300));
    }

    await Future.microtask(() => _initAllSearchTrias());

    var result = await _initAllHadithsBooks();
    return result;
  }

  Future<HadithBookEntity?> getHadithBook(HadithBooksEnum hadithBookEnum) async {
    final params = GetHadithUseCaseParams(hadithBookEnum);
    final result = await _getHadithBookUseCase(params);
    return result.fold(
      (l) {
        emit(HadithHomeError(l.message));
        return null;
      },
      (r) {
        return r;
      },
    );
  }

  Future<List<HadithBookEntity>> _initAllHadithsBooks() async {
    emit(HadithHomeLoading());
    List<HadithBookEntity> resultData = [];
    var result = await _getAllHadithBookUseCase(NoParams());
    emit(HadithHomeInitial());
    result.fold(
      (l) => [],
      (r) => resultData = r,
    );
    return resultData;
  }

  //!Auther
  Future<Auther> getAutherById(int autherId) async {
    var auther = (await _initAllAuthers()).firstWhere((e) => e.id == autherId);
    return auther;
  }

  Future<Auther> getAutherByHadithBookEnum(HadithBooksEnum hadithBooksEnum) async {
    var hadithBook = await getHadithBook(hadithBooksEnum);
    var auther = (await _initAllAuthers()).firstWhere((e) => e.id == hadithBook?.metadata.autherId);
    return auther;
  }

  Future<List<Auther>> _initAllAuthers() async {
    // emit(HadithHomeLoading());
    List<Auther> resultData = [];
    var result = await _getAllAuthersUseCase(NoParams());
    // emit(HadithHomeInitial());
    result.fold(
      (l) => [],
      (r) => resultData = r,
    );
    return resultData;
  }

  //! Search
  Future<bool> _initAllSearchTrias() async {
    emit(HadithHomeLoading());

    var result = await _initAllSearchTriasUseCase(InitAllSearchTriaParams(AppConstants.context.localeCode));
    emit(HadithHomeInitial());
    result.fold(
      (l) => [],
      (r) => r,
    );

    return true;
  }

  Future<void> searchInHoleBooks(List<HadithBooksEnum> selectedHadithBookEnums) async {
    List<HadithBookEntity> selectedHadithBooksEnums = await _getFilteredHadithBooks(selectedHadithBookEnums);
    AppSearch.showSearchAllBooks(selectedHadithBooksEnums: selectedHadithBooksEnums);
  }

  Future<List<HadithBookEntity>> _getFilteredHadithBooks(List<HadithBooksEnum> selectedHadithBookEnums) async {
    List<HadithBookEntity> allHadithBookEntitys = await allHadithsBooks;
    List<HadithBookEntity> selectedHadithBooksEnums = [];
    for (var element in allHadithBookEntitys) {
      if (selectedHadithBookEnums.any((x) => x.bookId == element.id)) {
        selectedHadithBooksEnums.add(element);
      }
    }
    return selectedHadithBooksEnums;
  }

  //! Read from storage
  int getLastReadedHadithId(HadithBooksEnum hadithBooksEnum) {
    var result = _getLastReadedHadithId(GetHadithUseCaseParams(hadithBooksEnum));
    return result.fold(
      (l) => 1,
      (r) => r,
    );
  }
}
