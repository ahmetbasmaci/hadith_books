import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/usecase/params/no_params.dart';
import '../../../../core/widgets/components/bottom_sheets/filter_search_in_all_books_model_bottom_sheet.dart';
import '../../../../core/widgets/components/buttons/app_search.dart';
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

  Future<void> searchInHoleBooks(BuildContext context) async {
    bool isConfermSelected = await FilterSearchInAllBooksModelBottomSheet.show(context);

    if (isConfermSelected) {
      List<HadithBookEntity> selectedHadithBooksEnums = await _getFilteredHadithBooks(context);
      AppSearch.showSearchAllBooks(selectedHadithBooksEnums: selectedHadithBooksEnums);
    }
  }

  Future<List<HadithBookEntity>> _getFilteredHadithBooks(BuildContext context) async {
    var selectedHadithBookEnums = context.read<HadithSearchFilterCubit>().selectedHadithsInSearchList;
    List<HadithBookEntity> allHadithBookEntitys = await context.read<HadithHomeCubit>().getAllHadithsBooks();
    List<HadithBookEntity> selectedHadithBooksEnums = [];
    for (var element in allHadithBookEntitys) {
      if (selectedHadithBookEnums.any((x) => x.bookId == element.id)) {
        selectedHadithBooksEnums.add(element);
      }
    }
    return selectedHadithBooksEnums;
  }
}
