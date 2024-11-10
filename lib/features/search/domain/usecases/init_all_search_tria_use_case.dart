import 'package:dartz/dartz.dart';
import 'package:hadith_books/core/core.dart';

import '../../../features.dart';

class InitAllSearchTriaUseCase extends IUseCaseAsync<Unit, InitAllSearchTriaParams> {
  final ISearchRepository _searchRepository;

  InitAllSearchTriaUseCase(this._searchRepository);

  @override
  Future<Either<Failure, Unit>> call(InitAllSearchTriaParams params) async {
    return await _searchRepository.initAllSearchTria(params.langCode);
  }
}
