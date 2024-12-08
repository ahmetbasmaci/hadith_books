import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../config/local/l10n.dart';
import '../../../../core/core.dart';
import '../../../features.dart';
part 'hadith_home_state.dart';

class HadithHomeCubit extends Cubit<HadithHomeState> {
  final GetAllHadithBookUseCase _getAllHadithBookUseCase;
  final GetHadithBookUseCase _getHadithBookUseCase;
  final GetAllAuthersUseCase _getAllAuthersUseCase;
  final InitAllSearchTriaUseCase _initAllSearchTriasUseCase;
  final InitSearchTriaUseCase _initSearchTriaUseCase;
  final GetLastReadedHadithId _getLastReadedHadithId;
  final GetAutherByIdUseCase _getAutherByIdUseCase;
  final SearchCubit _searchCubit;
  final HadithSearchFilterCubit _hadithSearchFilterCubit;

  final ScrollController scrollController = ScrollController();

  HadithHomeCubit(
      this._getAllHadithBookUseCase,
      this._getHadithBookUseCase,
      this._getAllAuthersUseCase,
      this._initAllSearchTriasUseCase,
      this._getLastReadedHadithId,
      this._initSearchTriaUseCase,
      this._searchCubit,
      this._getAutherByIdUseCase,
      this._hadithSearchFilterCubit)
      : super(HadithHomeInitial());

  Future<void> init() async {
    if (kDebugMode) {
      await Future.wait([
        // _initAllHadithsBooks(),
        _initAllAuthers(),
        //_initAllSearchTrias(),
      ]);
    } else {
      await Future.wait([
        //_initAllHadithsBooks(),
        _initAllAuthers(),
        // _initAllSearchTrias(),
      ]);
    }
  }

  //! Hadiths Books
  Future<HadithBookEntity> getHadithBook(HadithBooksEnum hadithBookEnum) async {
    final params = GetHadithUseCaseParams(hadithBookEnum);
    final result = await _getHadithBookUseCase(params);
    late final HadithBookEntity hadithBook;
    return result.fold(
      (l) => hadithBook,
      (r) => hadithBook = r,
    );
  }

  Future<List<HadithBookEntity>> getHadithBooks(List<HadithBooksEnum> hadithBookEnums) async {
    List<HadithBookEntity> allHadithBookEntitys = [];

    //call gethadithBook parallerl and wait for all to end
    await Future.wait(
      hadithBookEnums.map(
        (e) async {
          Future.microtask(() => _initSearchTria(e));
          var result = await getHadithBook(e);
          allHadithBookEntitys.add(result);
        },
      ),
    );
    return allHadithBookEntitys;
  }

  Future<void> _initAllHadithsBooks() async {
    var result = await _getAllHadithBookUseCase(NoParams());
    result.fold(
      (l) => [],
      (r) => r,
    );
  }

  //!Auther
  Future<void> _initAllAuthers() async {
    var result = await _getAllAuthersUseCase(NoParams());

    result.fold(
      (l) => [],
      (r) => r,
    );
  }

  Future<Auther> getAutherById(int autherId) async {
    var result = await _getAutherByIdUseCase(GetAutherByIdUseCaseParams(autherId));

    return result.fold(
      (l) => Auther.empty(),
      (r) => r,
    );
  }

  //! HadithBookFullModel
  Future<HadithBookFullModel> getHadithBookFullModel(HadithBooksEnum hadithBooksEnum) async {
    final hadithBook = await getHadithBook(hadithBooksEnum);
    final auther = await getAutherById(hadithBook.metadata.autherId);
    return HadithBookFullModel(
      auther: auther,
      hadithBook: hadithBook,
    );
  }

  //! Search
  Future<void> _initAllSearchTrias() async {
    var result = await _initAllSearchTriasUseCase(InitAllSearchTriaParams(AppConstants.context.localeCode));
    result.fold(
      (l) => l,
      (r) => r,
    );
  }

  Future<bool> _initSearchTria(HadithBooksEnum hadithBookEnum) async {
    emit(HadithHomeLoading());

    var result = await _initSearchTriaUseCase(InitSearchTriaParams(hadithBookEnum, AppConstants.context.localeCode));
    emit(HadithHomeInitial());
    result.fold(
      (l) => [],
      (r) => r,
    );

    return true;
  }

  Future<void> searchBtnPressed() async {
    //emit(HadithHomeLoading());

    _hadithSearchFilterCubit.getSavedSelectedHadithsInSearchList();

    var bottomSheet = MultiSelectibleHadithEnumBottomSheet(
      context: AppConstants.context,
      title: AppStrings.of(AppConstants.context).selectBooksToSearchIn,
      selectedItems: _hadithSearchFilterCubit.state.selectedHadithsInSearch,
    );

    var result = await bottomSheet.show();

    bool isConfermSelected = result.$1;

    if (!isConfermSelected) return;

    List<HadithBooksEnum> selectedItems = result.$2;

    _hadithSearchFilterCubit.updateAndSaveSelectededHadiths(selectedItems);

    //wait for the bottom sheet to close
    await Future.delayed(Duration(milliseconds: 1000));

    await searchInHoleBooks(selectedItems);

    //emit(HadithHomeInitial());
  }

  Future<void> searchInHoleBooks(List<HadithBooksEnum> selectedHadithBookEnums) async {
    List<HadithBookEntity> selectedHadithBooksEnums = await getHadithBooks(selectedHadithBookEnums);
    _searchCubit.showSearchPageMultibleBooks(selectedHadithBooksEnums);
  }

  //! Read from storage
  int getLastReadedHadithId(HadithBooksEnum hadithBooksEnum) {
    var result = _getLastReadedHadithId(GetHadithUseCaseParams(hadithBooksEnum));
    return result.fold(
      (l) => 1,
      (r) => r,
    );
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
