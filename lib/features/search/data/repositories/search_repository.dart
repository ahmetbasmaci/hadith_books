import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

class SearchRepository implements ISearchRepository {
  final ISearchDataSource _searchDataSource;

  SearchRepository(this._searchDataSource);

  @override
  Future<Either<Failure, Unit>> insertAll(SearchHadithInfoModel searchHadithParameterInfoModel, String sentence) async {
    try {
      await _searchDataSource.insertAll(searchHadithParameterInfoModel, sentence);
      return Right(unit);
    } catch (e) {
      PrinterHelper.printError(e.toString());
      return Left(SearchFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SearchHadithInfoModel>>> search(
      List<HadithBooksEnum> hadithBookEnums, String sentence) async {
    try {
      var result = await _searchDataSource.search(hadithBookEnums, sentence);
      return Right(result);
    } catch (e) {
      PrinterHelper.printError(e.toString());
      return Left(SearchFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SearchHadithInfoModel>>> searchHadith(HadithEntity hadith, String word) async {
    try {
      var result = await _searchDataSource.searchHadith(hadith, word);
      return Right(result);
    } catch (e) {
      PrinterHelper.printError(e.toString());
      return Left(SearchFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> initSearchTria(HadithBooksEnum hadithBookEnum,String langCode) async {
    try {
      await _searchDataSource.initSearchTria(hadithBookEnum,langCode);
      return Right(unit);
    } catch (e) {
      PrinterHelper.printError(e.toString());
      return Left(SearchFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> initAllSearchTria(String langCode) async {
    try {
      await _searchDataSource.initAllSearchTria(langCode);
      return Right(unit);
    } catch (e) {
      PrinterHelper.printError(e.toString());
      return Left(SearchFailure(e.toString()));
    }
  }
}
