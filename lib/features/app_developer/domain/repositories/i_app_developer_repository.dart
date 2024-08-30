import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';

abstract class IAppDeveloperRepository {
  Future<Either<Failure, Unit>> saveMessageToDb(String name, String message);
}
