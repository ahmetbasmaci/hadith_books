import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/i_use_case.dart';
import '../../../../core/usecase/params/favorite_params.dart';
import '../../../features.dart';

class FavoriteButtonRemoveItemUseCase extends IUseCase<Unit, FavoriteParams> {
  final IFavoriteButtonRepository favoriteRepository;

  FavoriteButtonRemoveItemUseCase({required this.favoriteRepository});
  @override
  Future<Either<Failure, Unit>> call(params) async {
    return await favoriteRepository.removeItem(params.item);
  }
}
