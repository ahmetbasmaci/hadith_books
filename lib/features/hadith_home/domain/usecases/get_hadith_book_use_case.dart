import 'package:dartz/dartz.dart';
import 'package:hadith_books/features/hadith_home/data/repositories/hadith_book_repository.dart';
import 'package:hadith_books/features/hadith_home/domain/entities/hadith_book_entity.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/i_use_case.dart';
import '../../../../core/usecase/params/hadith_book_params.dart';

class GetHadithBookUseCase extends IUseCase<HadithBookEntity, GetHadithUseCaseParams> {
  final IHadithBookRepository _hadithRepository;

  GetHadithBookUseCase(this._hadithRepository);

  @override
  Future<Either<Failure, HadithBookEntity>> call(GetHadithUseCaseParams params) async {
    return await _hadithRepository.getHadithBook(params.hadithBookEnum);
  }
}
