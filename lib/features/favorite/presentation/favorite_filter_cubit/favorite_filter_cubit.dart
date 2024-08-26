import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hadith_books/core/packages/local_storage/local_storage.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';

import '../../../../core/enums/hadith_books_enum.dart';

part 'favorite_filter_state.dart';

class FavoriteFilterCubit extends Cubit<FavoriteFilterState> {
  final ILocalStorage _localStorage;
  FavoriteFilterCubit(this._localStorage) : super(const FavoriteFilterInitial(selectedHadithsInFavorite: []));

  List<HadithBooksEnum> _selectedHadithsInFavoriteInstance = [];

  List<HadithBooksEnum> get selectedHadithsInFavoriteList => state.selectedHadithsInFavorite;

  void updateSelectedHadithsInFavoriteList(HadithBooksEnum hadithBooksEnum) {
    List<HadithBooksEnum> selectedHadithsInFavorite = [];
    selectedHadithsInFavorite.addAll(state.selectedHadithsInFavorite);
    if (selectedHadithsInFavorite.contains(hadithBooksEnum)) {
      selectedHadithsInFavorite.remove(hadithBooksEnum);
    } else {
      selectedHadithsInFavorite.add(hadithBooksEnum);
    }
    emit(FavoriteFilterInitial(selectedHadithsInFavorite: selectedHadithsInFavorite));
  }

  bool isSelectedHadithsInFavorite(HadithBooksEnum hadithBooksEnum) {
    return state.selectedHadithsInFavorite.contains(hadithBooksEnum);
  }

  bool get isSelectedAll {
    return state.selectedHadithsInFavorite.length == HadithBooksEnum.values.length;
  }

  bool get isHaveItemsSelectedAndNotAll {
    return state.selectedHadithsInFavorite.isNotEmpty && !isSelectedAll;
  }

  void triggerSelectAll() {
    if (isSelectedAll) {
      emit(const FavoriteFilterInitial(selectedHadithsInFavorite: []));
    } else {
      emit(FavoriteFilterInitial(selectedHadithsInFavorite: HadithBooksEnum.values.toList()));
    }
  }

  void getInstanceFromSavedData() {
    _selectedHadithsInFavoriteInstance = [];
    _selectedHadithsInFavoriteInstance.addAll(state.selectedHadithsInFavorite);
  }

  void getSavedSelectedHadithsInFavoriteList() {
    var data = _localStorage.read<String>(AppStorageKeys.selectedHadithsInFavorite) ??
        HadithBooksEnum.values.toList().toString();
    var splitedData =
        data.replaceAll('[', '').replaceAll(']', '').replaceAll(' ', '').replaceAll('HadithBooksEnum.', '').split(',');

    for (var item in splitedData) {
      var data = HadithBooksEnum.values.firstWhere((element) => element.name == item);
      _selectedHadithsInFavoriteInstance.add(data);
    }
    emit(FavoriteFilterInitial(selectedHadithsInFavorite: _selectedHadithsInFavoriteInstance));
  }

  void saveSelectedHadithsInFavoriteList() async {
    await _localStorage.write(AppStorageKeys.selectedHadithsInFavorite, state.selectedHadithsInFavorite.toString());
  }

  void resetSelectedHadithsInFavoriteList() {
    emit(FavoriteFilterInitial(selectedHadithsInFavorite: _selectedHadithsInFavoriteInstance));
  }
}
