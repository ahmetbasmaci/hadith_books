import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../hadith_home/hadith_home.dart';
import '../../favorite_button.dart';

class FavoriteButtonRepository implements IFavoriteButtonRepository {
  final IFavoriteButtonCheckContentIfFavoriteDataSource checkContentIfFavoriteDataSource;
  final IFavoriteButtonReadWriteDataSource readWriteDataSource;

  FavoriteButtonRepository({
    required this.checkContentIfFavoriteDataSource,
    required this.readWriteDataSource,
  });

  @override
  Future<Either<Failure, Unit>> addItem(HadithEntity item) async {
    try {
      await readWriteDataSource.addItem(item);
      return const Right(unit);
    } catch (e) {
      return Left(SqliteFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> checkItemIfFavorite(HadithEntity itemModel) async {
    try {
      final result = await checkContentIfFavoriteDataSource.checkItemIfFavorite(itemModel);
      return Right(result);
    } catch (e) {
      return Left(SqliteFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeItem(HadithEntity item) async {
    try {
      await readWriteDataSource.removeItem(item);
      return const Right(unit);
    } catch (e) {
      return Left(SqliteFailure(e.toString()));
    }
  }
}
