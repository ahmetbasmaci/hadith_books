import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/i_use_case.dart';
import '../../../../core/usecase/params/hadith_book_params.dart';
import '../../../features.dart';

class GetHadithBookUseCase extends IUseCaseAsync<HadithBookEntity, GetHadithUseCaseParams> {
  final IHadithBookRepository _hadithRepository;

  GetHadithBookUseCase(this._hadithRepository);

  @override
  Future<Either<Failure, HadithBookEntity>> call(GetHadithUseCaseParams params) async {
    return await _hadithRepository.getHadithBook(params.hadithBookEnum);
  }
}
