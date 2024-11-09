import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/i_use_case.dart';
import '../../../../core/usecase/params/favorite_params.dart';
import '../../../features.dart';

class FavoriteButtonRemoveItemUseCase extends IUseCaseAsync<Unit, FavoriteParams> {
  final IFavoriteButtonRepository _favoriteRepository;

  FavoriteButtonRemoveItemUseCase(this._favoriteRepository);
  @override
  Future<Either<Failure, Unit>> call(params) async {
    return await _favoriteRepository.removeItem(params.item);
  }
}
