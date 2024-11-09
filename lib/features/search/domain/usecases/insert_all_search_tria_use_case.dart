import 'package:dartz/dartz.dart';
import 'package:hadith_books/core/usecase/params/search_params.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/i_use_case.dart';
import '../../../features.dart';

class InsertAllSearchTriaUseCase extends IUseCaseAsync<Unit, InsertAllToTriaParams> {
  final ISearchRepository _searchRepository;

  InsertAllSearchTriaUseCase(this._searchRepository);

  @override
  Future<Either<Failure, Unit>> call(InsertAllToTriaParams params) async {
    return await _searchRepository.insertAll(params.searchHadithParameterInfoModel, params.sentence);
  }
}
