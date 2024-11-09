import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/i_use_case.dart';
import '../../../../core/usecase/params/favorite_params.dart';
import '../../../features.dart';

class FavoriteButtonAddItemUseCase extends IUseCaseAsync<Unit, FavoriteParams> {
  final IFavoriteButtonRepository _favoriteRepository;

  FavoriteButtonAddItemUseCase(this._favoriteRepository);
  @override
  Future<Either<Failure, Unit>> call(params) async {
    return await _favoriteRepository.addItem(params.item);
  }
}
