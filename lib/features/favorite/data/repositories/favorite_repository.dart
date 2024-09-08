import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

class FavoriteRepository implements IFavoriteRepository {
  final IFavoriteGetAllDataSource getAllDataSource;
  final IFavoriteSelectedBooksDataSource selectedBooksDataSource;

  const FavoriteRepository(this.getAllDataSource, this.selectedBooksDataSource);
  @override
  Future<Either<Failure, List<HadithEntity>>> getAllFavoriteItems() async {
    try {
      var result = await getAllDataSource.getAllFavoriteItems();
      return Right(result);
    } catch (e) {
      return Left(SqliteFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<HadithBooksEnum>>> getSavedSelectedBooks() async {
    try {
      var result = await selectedBooksDataSource.getSavedSelectedBooks();
      return Right(result);
    } catch (e) {
      return Left(SqliteFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveSelectedBooks(List<HadithBooksEnum> selectedHadithsInSearch) async {
    try {
      await selectedBooksDataSource.saveSelectedBooks(selectedHadithsInSearch);
      return const Right(unit);
    } catch (e) {
      return Left(SqliteFailure(e.toString()));
    }
  }
}
