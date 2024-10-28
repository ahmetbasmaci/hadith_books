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
      final hadithBook = await _hadithBookDataSource.getHadithBook(hadithBookEnum, false);
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
  Future<Either<Failure, List<ImamsTarjamaEntity>>> getAllImamsTarjama() async {
    try {
      var result = await _hadithBookDataSource.getAllImamsTarjama();
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
