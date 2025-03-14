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
      var auther = await _hadithBookDataSource.getAutherById(autherId);
    
      return Right(auther);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Either<Failure, int> getLastReadedHadithId(HadithBooksEnum hadithBookEnum) {
    try {
      final result = _hadithBookDataSource.getLastReadedHadithId(hadithBookEnum);
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
