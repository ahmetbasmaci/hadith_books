import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

class GetLastReadedHadithId extends IUseCase<int, GetHadithUseCaseParams> {
  final IHadithBookRepository _hadithRepository;

  GetLastReadedHadithId(this._hadithRepository);

  @override
  Either<Failure, int> call(GetHadithUseCaseParams params) {
    return _hadithRepository.getLastReadedHadithId(params.hadithBookEnum);
  }
}
