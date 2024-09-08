import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

abstract class IFavoriteRepository {
  Future<Either<Failure, List<HadithEntity>>> getAllFavoriteItems();

  Future<Either<Failure, List<HadithBooksEnum>>> getSavedSelectedBooks();
  Future<Either<Failure, Unit>> saveSelectedBooks(List<HadithBooksEnum> selectedHadithsInSearch);
}
