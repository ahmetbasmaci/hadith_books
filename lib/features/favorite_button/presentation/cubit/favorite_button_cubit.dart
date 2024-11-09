import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/usecase/params/favorite_params.dart';
import '../../../features.dart';
part 'favorite_button_state.dart';

class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {
  final FavoriteButtonRemoveItemUseCase _favoriteButtonRemoveItemUseCase;
  final FavoriteButtonCheckContentIfFavoriteUseCase _favoriteButtonCheckContentIfFavoriteUseCase;
  final FavoriteButtonAddItemUseCase _favoriteButtonAddItemUseCase;

  FavoriteButtonCubit(
     this._favoriteButtonRemoveItemUseCase,
     this._favoriteButtonCheckContentIfFavoriteUseCase,
     this._favoriteButtonAddItemUseCase,
  ) : super(const FavoriteButtonInitialState());

  Future<void> checkIfItemIsFavorite(HadithEntity item) async {
    var result = await _favoriteButtonCheckContentIfFavoriteUseCase(FavoriteParams(item: item));
    if (isClosed) return;
    result.fold(
      (l) => emit(FavoriteButtonErrorState(message: l.message)),
      (isFavoriteResponse) => emit(FavoriteButtonInitialState(isFavorite: isFavoriteResponse)),
    );
  }

  Future<void> changeFavoriteStatus(HadithEntity item) async {
    if (state.isFavorite) {
      _removeItem(item);
    } else {
      _addItem(item);
    }
  }

  Future<void> _removeItem(HadithEntity item) async {
    var result = await _favoriteButtonRemoveItemUseCase(FavoriteParams(item: item));
    if (isClosed) return;
    result.fold(
      (l) => emit(FavoriteButtonErrorState(message: l.message)),
      (r) => emit(const FavoriteButtonInitialState(isFavorite: false)),
    );
  }

  Future<void> _addItem(HadithEntity item) async {
    var result = await _favoriteButtonAddItemUseCase(FavoriteParams(item: item));
    if (isClosed) return;
    result.fold(
      (l) => emit(FavoriteButtonErrorState(message: l.message)),
      (r) => emit(const FavoriteButtonInitialState(isFavorite: true)),
    );
  }
}
