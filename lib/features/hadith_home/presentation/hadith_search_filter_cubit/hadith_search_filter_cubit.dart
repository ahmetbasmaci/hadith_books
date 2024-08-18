import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hadith_books/core/packages/local_storage/local_storage.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';

import '../../../../core/enums/hadith_books_enum.dart';

part 'hadith_search_filter_state.dart';

class HadithSearchFilterCubit extends Cubit<HadithSearchFilterState> {
  final ILocalStorage _localStorage;
  HadithSearchFilterCubit(this._localStorage) : super(const HadithSearchFilterInitial(selectedHadithsInSearch: []));

  List<HadithBooksEnum> _selectedHadithsInSearchInstance = [];

  List<HadithBooksEnum> get selectedHadithsInSearchList => state.selectedHadithsInSearch;

  void updateSelectedHadithsInSearchList(HadithBooksEnum hadithBooksEnum) {
    List<HadithBooksEnum> selectedHadithsInSearch = [];
    selectedHadithsInSearch.addAll(state.selectedHadithsInSearch);
    if (selectedHadithsInSearch.contains(hadithBooksEnum)) {
      selectedHadithsInSearch.remove(hadithBooksEnum);
    } else {
      selectedHadithsInSearch.add(hadithBooksEnum);
    }
    emit(HadithSearchFilterInitial(selectedHadithsInSearch: selectedHadithsInSearch));
  }

  bool isSelectedHadithsInSearch(HadithBooksEnum hadithBooksEnum) {
    return state.selectedHadithsInSearch.contains(hadithBooksEnum);
  }

  bool get isSelectedAll {
    return state.selectedHadithsInSearch.length == HadithBooksEnum.values.length;
  }

  bool get isHaveItemsSelectedAndNotAll {
    return state.selectedHadithsInSearch.isNotEmpty && !isSelectedAll;
  }

  void triggerSelectAll() {
    if (isSelectedAll) {
      emit(const HadithSearchFilterInitial(selectedHadithsInSearch: []));
    } else {
      emit(HadithSearchFilterInitial(selectedHadithsInSearch: HadithBooksEnum.values.toList()));
    }
  }

  void getInstanceFromSavedData() {
    _selectedHadithsInSearchInstance = [];
    _selectedHadithsInSearchInstance.addAll(state.selectedHadithsInSearch);
  }

  void getSavedSelectedHadithsInSearchList() {
    var data = _localStorage.read<String>(AppStorageKeys.selectedHadithsInSearch) ??
        HadithBooksEnum.values.toList().toString();
    var splitedData =
        data.replaceAll('[', '').replaceAll(']', '').replaceAll(' ', '').replaceAll('HadithBooksEnum.', '').split(',');

    for (var item in splitedData) {
      var data = HadithBooksEnum.values.firstWhere((element) => element.name == item);
      _selectedHadithsInSearchInstance.add(data);
    }
    emit(HadithSearchFilterInitial(selectedHadithsInSearch: _selectedHadithsInSearchInstance));
  }

  void saveSelectedHadithsInSearchList() async {
    await _localStorage.write(AppStorageKeys.selectedHadithsInSearch, state.selectedHadithsInSearch.toString());
  }

  void resetSelectedHadithsInSearchList() {
    emit(HadithSearchFilterInitial(selectedHadithsInSearch: _selectedHadithsInSearchInstance));
  }
}
