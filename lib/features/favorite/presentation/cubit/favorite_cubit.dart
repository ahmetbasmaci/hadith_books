import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hadith_books/core/core.dart';
import '../../../features.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey();
  final FavoriteGetAllUseCase _favoriteGetAllUseCase;
  final FavoriteSaveSelectedBooksUseCase _favoriteSaveSelectedBooksUseCase;
  final FavoriteGetSavedSelectedBooksUseCase _favoriteGetSavedSelectedBooksUseCase;
  final HadithHomeCubit _hadithHomeCubit;
  final SearchCubit _searchCubit;
  FavoriteCubit(
    this._favoriteGetAllUseCase,
    this._favoriteSaveSelectedBooksUseCase,
    this._favoriteGetSavedSelectedBooksUseCase,
    this._hadithHomeCubit,
    this._searchCubit,
  ) : super(const FavoriteInitState());

  Future<void> updateSavedData() async {
    emit(const FavoriteLoadingState());
    var selectedHadithBookEnums = await getSelectedFavoriteHadithsEnums();
    List<HadithBookEntity> hadithBookEntities = await getHadithBooks(selectedHadithBookEnums);

    if (isClosed) return;

    emit(
      FavoriteLoadedState(
        selectedHadithBookEntitys: hadithBookEntities,
        selectedHadithBookEnums: selectedHadithBookEnums,
      ),
    );
  }

  Future<List<HadithEntity>> getFavoriteHadiths() async {
    List<HadithEntity> hadiths = [];
    var result = await _favoriteGetAllUseCase.call(NoParams());

    result.fold(
      (l) {
        // emit(FavoriteErrorState(message: l.message, selectedHadithEnums: state.selectedHadithEnums));
      },
      (r) {
        if (r.isNotEmpty) hadiths = r;
      },
    );
    return hadiths;
  }

  Future<List<HadithBooksEnum>> getSelectedFavoriteHadithsEnums() async {
    List<HadithBooksEnum> selectedHadithEnums = HadithBooksEnum.values;
    var result = await _favoriteGetSavedSelectedBooksUseCase.call(NoParams());

    result.fold(
      (l) {
        emit(FavoriteErrorState(message: l.message, selectedHadithBookEnums: state.selectedHadithBookEnums));
      },
      (r) {
        if (r.isNotEmpty) selectedHadithEnums = r;
      },
    );
    return selectedHadithEnums;
  }

  Future<void> updateSelectededHadiths(List<HadithBooksEnum> hadithBooksEnums) async {
    var result = await _favoriteSaveSelectedBooksUseCase.call(SaveSelectedBooksParams(hadithBooksEnums));
    result.fold(
      (l) => emit(FavoriteErrorState(message: l.message, selectedHadithBookEnums: state.selectedHadithBookEnums)),
      (r) async {
        List<HadithBookEntity> allHadithBookEntitys = await getHadithBooks(hadithBooksEnums);
        emit(
          FavoriteLoadedState(
            selectedHadithBookEntitys: allHadithBookEntitys,
            selectedHadithBookEnums: hadithBooksEnums,
          ),
        );
      },
    );
  }

  Future<List<HadithBookEntity>> getHadithBooks(List<HadithBooksEnum> hadithBooksEnums) async {
    //get all saved hadiths
    List<HadithEntity> allSavedHadiths = await getFavoriteHadiths();

    //get all unic book ids from saved hadiths
    List<int> bookIds = allSavedHadiths.map((e) => e.bookId).toSet().toList();

    //get books enums from book ids
    var hadithBooksEnumsFromSavedHadiths =
        hadithBooksEnums.where((element) => bookIds.contains(element.bookId)).toList();

    //create less data to get from server
    var hadithBooksEnumsLess = hadithBooksEnums.length > hadithBooksEnumsFromSavedHadiths.length
        ? hadithBooksEnumsFromSavedHadiths
        : hadithBooksEnums;

    //get books from data set
    List<HadithBookEntity> hadithBookEntities = await _hadithHomeCubit.getHadithBooks(hadithBooksEnumsLess);

    //get hadiths from saved hadiths
    List<HadithEntity> selectedHadiths = allSavedHadiths
        .where((element) => hadithBooksEnumsLess.any((enumElement) => enumElement.bookId == element.bookId))
        .toList();

    for (var hadithBookEntity in hadithBookEntities) {
      hadithBookEntity.hadiths.clear();
      for (var hadith in selectedHadiths) {
        if (hadith.bookId == hadithBookEntity.id) {
          hadithBookEntity.hadiths.add(hadith);
        }
      }
    }

    return hadithBookEntities;
  }

  void removeItemFromList(HadithEntity hadithEntity) {
    if (state is FavoriteLoadedState) {
      var hadithBookEntities = (state as FavoriteLoadedState).selectedHadithBookEntitys;
      for (var hadithBook in hadithBookEntities) {
        if (hadithBook.id != hadithEntity.bookId) continue;
        hadithBook.hadiths.removeWhere((element) => element.id == hadithEntity.id);
      }

      if (isClosed) return;
      emit((state as FavoriteLoadedState).copyWith(selectedHadithBookEntitys: hadithBookEntities));
    }
  }

  void searchInFavorite() {
    if (state is! FavoriteLoadedState) return;

    _searchCubit.showSearchPageFavorite((state as FavoriteLoadedState).selectedHadithBookEntitys);
  }
}
