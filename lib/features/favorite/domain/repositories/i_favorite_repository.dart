import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../features.dart';

abstract class IFavoriteRepository {
  Future<Either< Failure,List<HadithEntity>>> getAllFavoriteItems();
}
