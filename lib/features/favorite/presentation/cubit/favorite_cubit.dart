import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hadith_books/core/enums/hadith_books_enum.dart';
import 'package:hadith_books/core/utils/resources/app_extentions.dart';

import '../../../../core/usecase/params/no_params.dart';
import '../../../features.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey();
  final FavoriteGetAllUseCase favoriteGetAllUseCase;
  final FavoriteSaveSelectedBooksUseCase favoriteSaveSelectedBooksUseCase;
  final FavoriteGetSavedSelectedBooksUseCase favoriteGetSavedSelectedBooksUseCase;

  List<HadithEntity> allSavedHadiths = [];
  FavoriteCubit(
    this.favoriteGetAllUseCase,
    this.favoriteSaveSelectedBooksUseCase,
    this.favoriteGetSavedSelectedBooksUseCase,
  ) : super(const FavoriteInitState());



  Future<void> updateSavedData() async {
     var selectedHadithEnums = await getSelectedFavoriteHadithsEnums();
    allSavedHadiths = await getFavoriteHadiths();
    if (isClosed) return;
    emit(
      FavoriteLoadedState(
        favoriteZikrModels: allSavedHadiths
            .where((element) => selectedHadithEnums.any((enumElement) => enumElement.bookId == element.bookId))
            .toList(),
        selectedHadithEnums: selectedHadithEnums,
      ),
    );
  }

  Future<List<HadithEntity>> getFavoriteHadiths() async {
    List<HadithEntity> hadiths = [];
    var result = await favoriteGetAllUseCase.call(NoParams());

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
    var result = await favoriteGetSavedSelectedBooksUseCase.call(NoParams());

    result.fold(
      (l) {
        emit(FavoriteErrorState(message: l.message, selectedHadithEnums: state.selectedHadithEnums));
      },
      (r) {
        if (r.isNotEmpty) selectedHadithEnums = r;
      },
    );
    return selectedHadithEnums;
  }

  Future<void> updateSelectededHadiths(List<HadithBooksEnum> hadithBooksEnums) async {
    var result = await favoriteSaveSelectedBooksUseCase.call(SaveSelectedBooksParams(hadithBooksEnums));
    result.fold(
      (l) => emit(FavoriteErrorState(message: l.message, selectedHadithEnums: state.selectedHadithEnums)),
      (r) {
        emit(
          FavoriteLoadedState(
              favoriteZikrModels: allSavedHadiths
                  .where((element) => hadithBooksEnums.any((enumElement) => enumElement.bookId == element.bookId))
                  .toList(),
              selectedHadithEnums: hadithBooksEnums),
        );
      },
    );
  }

  Future<void> getFilteredZikrModelsForSearch(String searchText) async {
    var result = await favoriteGetAllUseCase.call(NoParams());

    result.fold(
      (l) {
        emit(FavoriteErrorState(message: l.message, selectedHadithEnums: state.selectedHadithEnums));
      },
      (r) {
        var filteredList = <HadithEntity>[];
        if (searchText.isEmpty) {
          filteredList = r;
        } else {
          filteredList.addAll(_filterListForSearch(r, searchText));
        }
        if (isClosed) return;
        emit(
          FavoriteLoadedState(
            favoriteZikrModels: filteredList,
            selectedHadithEnums: state.selectedHadithEnums,
          ),
        );
      },
    );
  }

  List<HadithEntity> _filterListForSearch(List<HadithEntity> list, String searchText) {
    return list
        .where(
          (element) =>
              state.selectedHadithEnums.any((enumElement) => enumElement.bookId == element.bookId) &&
              (element.arabic.removeTashkil.contains(searchText.removeTashkil) ||
                  element.english.text.contains(searchText)),
        )
        .toList();
  }

  void removeItemFromList(HadithEntity hadithEntity) {
    if (state is FavoriteLoadedState) {
      var list = List<HadithEntity>.from((state as FavoriteLoadedState).favoriteZikrModels);
      list.remove(hadithEntity);
      if (isClosed) return;
      emit(FavoriteLoadedState(favoriteZikrModels: list, selectedHadithEnums: state.selectedHadithEnums));
    }
  }
}
