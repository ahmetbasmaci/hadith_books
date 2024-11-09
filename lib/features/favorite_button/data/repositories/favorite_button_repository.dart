import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../features.dart';

class FavoriteButtonRepository implements IFavoriteButtonRepository {
  final IFavoriteButtonCheckContentIfFavoriteDataSource _checkContentIfFavoriteDataSource;
  final IFavoriteButtonReadWriteDataSource _readWriteDataSource;

  FavoriteButtonRepository(this._checkContentIfFavoriteDataSource, this._readWriteDataSource);

  @override
  Future<Either<Failure, Unit>> addItem(HadithEntity item) async {
    try {
      await _readWriteDataSource.addItem(item);
      return const Right(unit);
    } catch (e) {
      return Left(SqliteFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> checkItemIfFavorite(HadithEntity itemModel) async {
    try {
      final result = await _checkContentIfFavoriteDataSource.checkItemIfFavorite(itemModel);
      return Right(result);
    } catch (e) {
      return Left(SqliteFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeItem(HadithEntity item) async {
    try {
      await _readWriteDataSource.removeItem(item);
      return const Right(unit);
    } catch (e) {
      return Left(SqliteFailure(e.toString()));
    }
  }
}
