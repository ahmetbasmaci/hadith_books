import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/core.dart';
import '../../../features.dart';
part 'hadith_home_state.dart';

class HadithHomeCubit extends Cubit<HadithHomeState> {
  final GetAllHadithBookUseCase getAllHadithBookUseCase;
  final GetAllImamsTarjamaUseCase getAllImamsTarjamaUseCase;
  final ScrollController scrollController = ScrollController();

  HadithHomeCubit(this.getAllHadithBookUseCase, this.getAllImamsTarjamaUseCase) : super(HadithHomeInitial());

  List<HadithBookEntity> _allHadithBookEntitys = [];
  List<ImamsTarjamaEntity> _allTarjamaEntities = [];

  Future<List<HadithBookEntity>> get allHadithsBooks async {
    while (state is HadithHomeLoading) {
      await Future.delayed(const Duration(milliseconds: 300));
    }
    if (_allHadithBookEntitys.isNotEmpty) return _allHadithBookEntitys;
    _allHadithBookEntitys = await getAllHadithsBooks();
    return _allHadithBookEntitys;
  }

  Future<List<HadithBookEntity>> getAllHadithsBooks() async {
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

  Future<ImamsTarjamaEntity> getImamTarjamaByBookId(int bookId) async {
    var imamTarjama = (await _getAllImamsTarjama()).firstWhere((e) => e.id == bookId);
    return imamTarjama;
  }

  Future<List<ImamsTarjamaEntity>> _getAllImamsTarjama() async {
    if (_allTarjamaEntities.isNotEmpty) return _allTarjamaEntities;
    emit(HadithHomeLoading());
    var result = await getAllImamsTarjamaUseCase(NoParams());
    emit(HadithHomeInitial());
    result.fold(
      (l) => [],
      (r) => _allTarjamaEntities = r,
    );
    return _allTarjamaEntities;
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
}
