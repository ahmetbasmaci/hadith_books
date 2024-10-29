import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/core.dart';
import '../../../features.dart';
part 'hadith_home_state.dart';

class HadithHomeCubit extends Cubit<HadithHomeState> {
  final GetAllHadithBookUseCase getAllHadithBookUseCase;
  final GetHadithBookUseCase getHadithBookUseCase;
  final GetAllAuthersUseCase getAllAuthersUseCase;
  final ScrollController scrollController = ScrollController();

  HadithHomeCubit(this.getAllHadithBookUseCase,this.getHadithBookUseCase,  this.getAllAuthersUseCase)
      : super(HadithHomeInitial());

  Future<void> init() async {
    await allHadithsBooks;
    await _initAllAuthers();
  }

  //! Hadiths Books
  Future<List<HadithBookEntity>> get allHadithsBooks async {
    while (state is HadithHomeLoading) {
      await Future.delayed(const Duration(milliseconds: 300));
    }
    return await _initAllHadithsBooks();
  }

  Future<HadithBookEntity?> getHadithBook(HadithBooksEnum hadithBookEnum) async {
    final params = GetHadithUseCaseParams(hadithBookEnum);
    final result = await getHadithBookUseCase(params);
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
    var result = await getAllHadithBookUseCase(NoParams());
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

  Future<List<Auther>> _initAllAuthers() async {
    emit(HadithHomeLoading());
    List<Auther> resultData = [];
    var result = await getAllAuthersUseCase(NoParams());
    emit(HadithHomeInitial());
    result.fold(
      (l) => [],
      (r) => resultData = r,
    );
    return resultData;
  }

  //! Search
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
}
