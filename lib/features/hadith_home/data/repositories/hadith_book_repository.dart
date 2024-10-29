import 'package:dartz/dartz.dart';

import '../../../../core/enums/hadith_books_enum.dart';
import '../../../../core/errors/failures.dart';
import '../../../features.dart';

class HadithBookRepository extends IHadithBookRepository {
  final IHadithBookDataSource _hadithBookDataSource;

  HadithBookRepository(this._hadithBookDataSource);

  @override
  Future<Either<Failure, HadithBookEntity>> getHadithBook(HadithBooksEnum hadithBookEnum) async {
    try {
      final hadithBook = await _hadithBookDataSource.getHadithBook(hadithBookEnum);
      return Right(hadithBook);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, List<HadithBookEntity>>> getAllHadithBook() async {
    try {
      final hadithBooks = await _hadithBookDataSource.getAllHadithBook();
      return Right(hadithBooks);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, List<Auther>>> getAllAuthers() async {
    try {
      var result = await _hadithBookDataSource.getAllAuthers();
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, Auther>> getAutherById(int autherId) async {
    try {
      var allAuthers = await _hadithBookDataSource.getAllAuthers();
      var result = allAuthers.firstWhere((element) => element.id == autherId);
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
