import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../hadith_home/hadith_home.dart';

abstract class IFavoriteButtonRepository {
  Future<Either<Failure, bool>> checkItemIfFavorite(HadithEntity itemModel);
  Future<Either<Failure, Unit>> removeItem(HadithEntity itemModel);
  Future<Either<Failure, Unit>> addItem(HadithEntity itemModel);
}
