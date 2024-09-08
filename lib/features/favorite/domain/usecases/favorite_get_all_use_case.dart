import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/i_use_case.dart';
import '../../../../core/usecase/params/no_params.dart';
import '../../../features.dart';

class FavoriteGetAllUseCase extends IUseCase<List<HadithEntity>, NoParams> {
  final IFavoriteRepository favoriteRepository;

  FavoriteGetAllUseCase( this.favoriteRepository);
  @override
  Future<Either<Failure, List<HadithEntity>>> call(params) async {
    return await favoriteRepository.getAllFavoriteItems();
  }
}
