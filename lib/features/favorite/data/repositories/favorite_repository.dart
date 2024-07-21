import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../features.dart';

class FavoriteRepository implements IFavoriteRepository {
  final IFavoriteGetAllDataSource getAllDataSource;

  const FavoriteRepository({required this.getAllDataSource});
  @override
  Future<Either<Failure, List<HadithEntity>>> getAllFavoriteItems() async {
    try {
      var result = await getAllDataSource.getAllFavoriteItems();
      return Right(result);
    } catch (e) {
      return Left(SqliteFailure(e.toString()));
    }
  }
}
