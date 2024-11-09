import 'package:dartz/dartz.dart';
import 'package:hadith_books/core/core.dart';

import '../../../features.dart';

class InitAllSearchTriaUseCase extends IUseCaseAsync<Unit, NoParams> {
  final ISearchRepository _searchRepository;

  InitAllSearchTriaUseCase(this._searchRepository);

  @override
  Future<Either<Failure, Unit>> call(NoParams params) async {
    return await _searchRepository.initAllSearchTria();
  }
}
