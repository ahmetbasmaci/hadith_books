import 'package:dartz/dartz.dart';
import '../../../../core/core.dart';
import '../../../features.dart';

class FavoriteSaveSelectedBooksUseCase extends IUseCase<Unit, SaveSelectedBooksParams> {
  final IFavoriteRepository favoriteRepository;

  FavoriteSaveSelectedBooksUseCase( this.favoriteRepository);
  @override
  Future<Either<Failure, Unit>> call(params) async {
    return await favoriteRepository.saveSelectedBooks(params.selectedHadithsInSearch);
  }
}
