import 'package:dartz/dartz.dart';
import '../../../../core/core.dart';
import '../../../features.dart';

class FavoriteGetSavedSelectedBooksUseCase extends IUseCaseAsync<List<HadithBooksEnum>, NoParams> {
  final IFavoriteRepository favoriteRepository;

  FavoriteGetSavedSelectedBooksUseCase(this.favoriteRepository);
  @override
  Future<Either<Failure, List<HadithBooksEnum>>> call(params) async {
    return await favoriteRepository.getSavedSelectedBooks();
  }
}
