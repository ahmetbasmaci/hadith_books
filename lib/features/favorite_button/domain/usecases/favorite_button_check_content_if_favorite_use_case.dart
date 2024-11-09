import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/i_use_case.dart';
import '../../../../core/usecase/params/favorite_params.dart';
import '../../../features.dart';

class FavoriteButtonCheckContentIfFavoriteUseCase extends IUseCaseAsync<bool, FavoriteParams> {
  final IFavoriteButtonRepository _favoriteRepository;

  FavoriteButtonCheckContentIfFavoriteUseCase(this._favoriteRepository);
  @override
  Future<Either<Failure, bool>> call(params) async {
    return await _favoriteRepository.checkItemIfFavorite(params.item);
  }
}
