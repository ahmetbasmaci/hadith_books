import 'package:dartz/dartz.dart';
import 'package:hadith_books/core/usecase/params/no_params.dart';
import 'package:hadith_books/features/hadith_home/data/repositories/hadith_book_repository.dart';
import 'package:hadith_books/features/hadith_home/domain/entities/hadith_book_entity.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/i_use_case.dart';

class GetAllHadithBookUseCase extends IUseCase<List<HadithBookEntity>, NoParams> {
  final IHadithBookRepository _hadithRepository;

  GetAllHadithBookUseCase(this._hadithRepository);

  @override
  Future<Either<Failure,List<HadithBookEntity>>> call(NoParams params) async {
    return await _hadithRepository.getAllHadithBook();
  }
}
