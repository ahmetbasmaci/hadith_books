import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/i_use_case.dart';
import '../../../../core/usecase/params/favorite_params.dart';
import '../../../features.dart';

class FavoriteButtonCheckContentIfFavoriteUseCase extends IUseCase<bool, FavoriteParams> {
  final IFavoriteButtonRepository favoriteRepository;

  FavoriteButtonCheckContentIfFavoriteUseCase({required this.favoriteRepository});
  @override
  Future<Either<Failure, bool>> call(params) async {
    return await favoriteRepository.checkItemIfFavorite(params.item);
  }
}
