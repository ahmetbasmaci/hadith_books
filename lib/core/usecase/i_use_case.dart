import 'package:dartz/dartz.dart';

import '../errors/failures.dart';

abstract class IUseCaseAsync<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class IUseCase<Type, Params> {
  Either<Failure, Type> call(Params params);
}
