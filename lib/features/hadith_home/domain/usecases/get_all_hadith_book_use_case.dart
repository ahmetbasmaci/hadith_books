import 'package:dartz/dartz.dart';
import 'package:hadith_books/core/usecase/params/no_params.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/i_use_case.dart';
import '../../../features.dart';

class GetAllHadithBookUseCase extends IUseCaseAsync<List<HadithBookEntity>, NoParams> {
  final IHadithBookRepository _hadithRepository;

  GetAllHadithBookUseCase(this._hadithRepository);

  @override
  Future<Either<Failure, List<HadithBookEntity>>> call(NoParams params) async {
    return await _hadithRepository.getAllHadithBook();
  }
}
