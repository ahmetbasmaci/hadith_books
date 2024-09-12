import 'package:dartz/dartz.dart';
import 'package:hadith_books/core/usecase/params/no_params.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/i_use_case.dart';
import '../../../features.dart';

class GetAllImamsTarjamaUseCase extends IUseCase<List<ImamsTarjamaEntity>, NoParams> {
  final IHadithBookRepository _hadithRepository;

  GetAllImamsTarjamaUseCase(this._hadithRepository);

  @override
  Future<Either<Failure, List<ImamsTarjamaEntity>>> call(NoParams params) async {
    return await _hadithRepository.getAllImamsTarjama();
  }
}
