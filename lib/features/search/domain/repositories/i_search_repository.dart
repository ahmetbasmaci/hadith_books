import 'package:dartz/dartz.dart';
import 'package:hadith_books/core/core.dart';

import '../../../features.dart';

abstract class ISearchRepository {
  Future<Either<Failure, Unit>> insertAll(SearchHadithInfoModel searchHadithParameterInfoModel, String sentence);
  Future<Either<Failure, List<SearchHadithInfoModel>>> search(List<HadithBooksEnum> hadithBookEnums, String sentence);
  Future<Either<Failure, List<SearchHadithInfoModel>>> searchHadith(HadithEntity hadith, String word);
  Future<Either<Failure, Unit>> initSearchTria(HadithBooksEnum hadithBookEnum,String langCode);
  Future<Either<Failure, Unit>> initAllSearchTria(String langCode);
}
