import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/core.dart';
import '../../../features.dart';
part 'hadith_home_state.dart';

class HadithHomeCubit extends Cubit<HadithHomeState> {
  final GetAllHadithBookUseCase getAllHadithBookUseCase;
  final ScrollController scrollController = ScrollController();

  HadithHomeCubit(this.getAllHadithBookUseCase) : super(HadithHomeInitial());

  List<HadithBookEntity> allHadithBookEntitys = [];

  Future<List<HadithBookEntity>> getAllHadithsBooks() async {
    if (allHadithBookEntitys.isNotEmpty) return allHadithBookEntitys;
    emit(HadithHomeLoading());
    var result = await getAllHadithBookUseCase(NoParams());
    emit(HadithHomeInitial());
    result.fold(
      (l) => [],
      (r) => allHadithBookEntitys = r,
    );
    return allHadithBookEntitys;
  }

  Future<void> searchInHoleBooks(List<HadithBooksEnum> selectedHadithBookEnums) async {
    List<HadithBookEntity> selectedHadithBooksEnums = await _getFilteredHadithBooks(selectedHadithBookEnums);
    AppSearch.showSearchAllBooks(selectedHadithBooksEnums: selectedHadithBooksEnums);
  }

  Future<List<HadithBookEntity>> _getFilteredHadithBooks(List<HadithBooksEnum> selectedHadithBookEnums) async {
    List<HadithBookEntity> allHadithBookEntitys = await getAllHadithsBooks();
    List<HadithBookEntity> selectedHadithBooksEnums = [];
    for (var element in allHadithBookEntitys) {
      if (selectedHadithBookEnums.any((x) => x.bookId == element.id)) {
        selectedHadithBooksEnums.add(element);
      }
    }
    return selectedHadithBooksEnums;
  }
}
