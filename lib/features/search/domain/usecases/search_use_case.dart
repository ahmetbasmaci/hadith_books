import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

class SearchUseCase extends IUseCaseAsync<List<SearchHadithInfoModel>, SearchParams> {
  final ISearchRepository _searchRepository;

  SearchUseCase(this._searchRepository);

  @override
  Future<Either<Failure, List<SearchHadithInfoModel>>> call(SearchParams params) {
    return _searchRepository.search(params.hadithBookEnums,params.sentence);
  }
}
