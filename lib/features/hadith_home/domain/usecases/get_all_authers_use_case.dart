import 'package:dartz/dartz.dart';
import 'package:hadith_books/core/usecase/params/no_params.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/i_use_case.dart';
import '../../../features.dart';

class GetAllAuthersUseCase extends IUseCaseAsync<List<Auther>, NoParams> {
  final IHadithBookRepository _hadithRepository;

  GetAllAuthersUseCase(this._hadithRepository);

  @override
  Future<Either<Failure, List<Auther>>> call(NoParams params) async {
    return await _hadithRepository.getAllAuthers();
  }
}
