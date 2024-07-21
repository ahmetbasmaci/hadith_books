import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/i_use_case.dart';
import '../../../../core/usecase/params/favorite_params.dart';
import '../../../features.dart';


class FavoriteButtonAddItemUseCase extends IUseCase<Unit, FavoriteParams> {
  final IFavoriteButtonRepository favoriteRepository;

  FavoriteButtonAddItemUseCase({required this.favoriteRepository});
  @override
  Future<Either<Failure, Unit>> call(params) async {
    return await favoriteRepository.addItem(params.item);
  }
}
