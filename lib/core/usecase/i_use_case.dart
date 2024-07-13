import 'package:dartz/dartz.dart';

import '../errors/failures.dart';

abstract class IUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
