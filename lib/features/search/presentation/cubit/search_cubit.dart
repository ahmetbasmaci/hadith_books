import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hadith_books/features/features.dart';

import '../../../../core/core.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchUseCase _searchUseCase;
  final InitSearchTriaUseCase _initSearchTriaUseCase;

  SearchCubit(this._searchUseCase, this._initSearchTriaUseCase) : super(SearchInitialState());

  bool get isInSearchMode => searchText.isNotEmpty;
  TextEditingController searchController = TextEditingController();
  String searchText = '';

  Future<void> init(HadithBooksEnum hadithBooksEnum) async {
    await _initSearchTria(hadithBooksEnum);
  }

  Future<void> _initSearchTria(HadithBooksEnum hadithBooksEnum) async {
    var result = await _initSearchTriaUseCase(InitSearchTriaParams(hadithBooksEnum, AppConstants.context.localeCode));

    result.fold(
      (l) => [],
      (r) => r,
    );
  }

  Future<List<SearchHadithInfoModel>> searchInTrie(List<HadithBooksEnum> hadithBookEnums, String searchText) async {
    emit(SearchLoadingState());
    List<SearchHadithInfoModel> data = [];
    var result = await _searchUseCase.call(SearchParams(hadithBookEnums, searchText));
    result.fold(
      (l) {
        emit(SearchErrorState(l.message));
        return [];
      },
      (r) {
        data = r;
      },
    );
    return data;
  }

  Future<List<SearchHadithInfoModel>> searchInTrieHadith(List<HadithEntity> hadith, String searchText) async {
    emit(SearchLoadingState());
    List<SearchHadithInfoModel> data = [];
    var hadithBookEnums = HadithBooksEnum.values.where((element) => element.bookId == hadith.first.bookId).toList();
    var result = await _searchUseCase.call(SearchParams(hadithBookEnums, searchText));
    result.fold(
      (l) {
        emit(SearchErrorState(l.message));
        return [];
      },
      (r) {
        data = r.where((element) => hadith.any((element2) => element2.id == element.hadithId)).toList();
      },
    );
    return data;
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
}
