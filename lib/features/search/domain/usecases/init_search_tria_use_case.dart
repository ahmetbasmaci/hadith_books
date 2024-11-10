import 'package:dartz/dartz.dart';
import 'package:hadith_books/core/usecase/params/search_params.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/i_use_case.dart';
import '../../../features.dart';

class InitSearchTriaUseCase extends IUseCaseAsync<Unit, InitSearchTriaParams> {
  final ISearchRepository _searchRepository;

  InitSearchTriaUseCase(this._searchRepository);

  @override
  Future<Either<Failure, Unit>> call(InitSearchTriaParams params) async {
    return await _searchRepository.initSearchTria(params.hadithBookEnum,params.langCode);
  }
}
