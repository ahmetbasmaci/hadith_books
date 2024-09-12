import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

abstract class IHadithBookRepository {
  Future<Either<Failure, HadithBookEntity>> getHadithBook(HadithBooksEnum hadithBookEnum);
  Future<Either<Failure, List<HadithBookEntity>>> getAllHadithBook();
  Future<Either<Failure, List<ImamsTarjamaEntity>>> getAllImamsTarjama();
}
