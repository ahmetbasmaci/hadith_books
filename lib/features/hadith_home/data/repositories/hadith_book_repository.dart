import 'package:dartz/dartz.dart';

import '../../../../core/enums/hadith_books_enum.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/hadith_book_entity.dart';
import '../datasources/hadith_book_data_source.dart';

abstract class IHadithBookRepository {
  Future<Either<Failure, HadithBookEntity>> getHadithBook(HadithBooksEnum hadithBookEnum);
  Future<Either<Failure, List<HadithBookEntity>>> getAllHadithBook();
}

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
}
