import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hadith_books/core/core.dart';

part 'hadith_search_filter_state.dart';

class HadithSearchFilterCubit extends Cubit<HadithSearchFilterState> {
  final ILocalStorage _localStorage;
  HadithSearchFilterCubit(this._localStorage) : super(const HadithSearchFilterInitial(selectedHadithsInSearch: []));

  Future<void> updateAndSaveSelectededHadiths(List<HadithBooksEnum> hadithBooksEnums) async {
    await saveSelectedHadithsInSearchList();
    emit(HadithSearchFilterInitial(selectedHadithsInSearch: hadithBooksEnums));
  }

  Future<void> saveSelectedHadithsInSearchList() async {
    await _localStorage.write(AppStorageKeys.selectedHadithsInSearch, state.selectedHadithsInSearch.toString());
  }

  void getSavedSelectedHadithsInSearchList() {
    if (state.selectedHadithsInSearch.isNotEmpty) return;

    var data = _localStorage.read<String>(AppStorageKeys.selectedHadithsInSearch) ?? HadithBooksEnum.bukhari.toString();

    List<HadithBooksEnum> savedItems = HadithBookEnumConverterHelper.fromStringToList(data);

    if (isClosed) return;
    emit(HadithSearchFilterInitial(selectedHadithsInSearch: savedItems));
  }
}
