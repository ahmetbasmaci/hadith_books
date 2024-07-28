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

  FavoriteCubit({required this.favoriteGetAllUseCase}) : super(const FavoriteInitState()) {
    getAllSavedData();
  }

  void changeFavoriteZikrCategory(FavoriteHadithTypeEnum favoriteHadithTypeEnum) {
    emit(FavoriteInitState(favoriteHadithTypeEnum: favoriteHadithTypeEnum));
    getAllSavedData();
  }

  Future<void> getAllSavedData() async {
    var result = await favoriteGetAllUseCase.call(NoParams());

    result.fold(
      (l) {
        emit(FavoriteErrorState(message: l.message, favoriteHadithTypeEnum: state.favoriteHadithTypeEnum));
      },
      (r) {
        if (state.favoriteHadithTypeEnum == FavoriteHadithTypeEnum.all) {
          emit(FavoriteLoadedState(favoriteZikrModels: r, favoriteHadithTypeEnum: state.favoriteHadithTypeEnum));
        } else {
          emit(
            FavoriteLoadedState(
              favoriteZikrModels: r.where((element) => element.bookId == state.favoriteHadithTypeEnum.bookId).toList(),
              favoriteHadithTypeEnum: state.favoriteHadithTypeEnum,
            ),
          );
        }
      },
    );
  }

  Future<void> getFilteredZikrModels(String searchText) async {
    var result = await favoriteGetAllUseCase.call(NoParams());

    result.fold(
      (l) {
        emit(FavoriteErrorState(message: l.message, favoriteHadithTypeEnum: state.favoriteHadithTypeEnum));
      },
      (r) {
        var filteredList = <HadithEntity>[];
        if (searchText.isEmpty) {
          filteredList = r;
        } else {
          filteredList.addAll(_filterList(r, searchText));
        }

        emit(
          FavoriteLoadedState(
            favoriteZikrModels: filteredList,
            favoriteHadithTypeEnum: state.favoriteHadithTypeEnum,
          ),
        );
      },
    );
  }

  List<HadithEntity> _filterList(List<HadithEntity> list, String searchText) {
    if (state.favoriteHadithTypeEnum == FavoriteHadithTypeEnum.all) {
      return list
          .where(
            (element) => element.arabic.removeTashkil.contains(searchText) || element.english.text.contains(searchText),
          )
          .toList();
    }

    return list
        .where(
          (element) =>
              element.bookId == state.favoriteHadithTypeEnum.bookId &&
              (element.arabic.removeTashkil.contains(searchText) || element.english.text.contains(searchText)),
        )
        .toList();
  }
}
